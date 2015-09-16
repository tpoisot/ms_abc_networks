#! /usr/bin/env Rscript

library(RColorBrewer)
library(plyr)

abc <- read.table("../data/flatfile.dat", h=T, sep='\t')

PAL <- brewer.pal(5, "Set2")
names(PAL) <- levels(abc$type)

LABELS <- c("Seed dispersal", "Herbivory", "Parasitism", "Bacteriophagy", "Pollination")
names(LABELS) <- levels(abc$type)

abc$d <- 1-abc$d # Distances -> weights

dabc <- abc

ddabc <- ddply(dabc, c("network", "type"), summarize, e = weighted.mean(e, d), c = weighted.mean(c, d), d=mean(d))

pdf("../figures/interaction-params.pdf", height=20, width=30)
par(las=1, xaxs="i", yaxs="i", mfrow=c(2,3), cex=2, mar=c(4.1, 4.0, 0.5, 0.3), mgp=c(2.1,0.8,0))
for(u in unique(abc$type)){

abc <- subset(dabc, type == u)
abc <- ddply(abc, c("network", "type"), summarize, e = weighted.mean(e, d), c = weighted.mean(c, d), d=mean(d))
abc$d <- (abc$d - mean(abc$d))/sd(abc$d)
abc$w <- 1.2 + (abc$d * 0.25)

HCOL <- rgb(0.8, 0.8, 0.8, 0.3)

# Plot for c vs. e
plot(NA, xlim=c(-0.5,1), ylim=c(-3, 0), axes=F, bty='n', xlab="", ylab="", main="")
grid(nx=6, ny=6, lty=1, col="lightgrey", lwd=2.5)
abline(v=0, col="darkgray")
points(log(ddabc$c,10), log(ddabc$e,10), pch=20, col="darkgray", cex=0.5)
points(log(abc$c,10), log(abc$e,10), bg=PAL[unique(abc$type)],
  pch=21, col="darkgray", cex=1.0, lwd=1.5)
title(
  xlab="Rich get richer",
  ylab="Interaction persistence",
  font.lab=2
)
axis(1, lwd.ticks=1, lwd=0, col.ticks="darkgray", at=c(-1, -0.5, 0, 0.5, 1.0))
axis(2, lwd=0, lwd.ticks=1, col.ticks="darkgray", at=c(-3, -2, -1, 0))

}

# Final plot (legend)

plot(NA, axes=F, ylim=c(0, 1), xlim=c(0, 1), xlab="", ylab="")
legend("center", pt.bg=PAL, pch=21, legend=LABELS, col="darkgray", bty='n', cex=1.5)

dev.off()
