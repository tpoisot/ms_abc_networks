#! /usr/bin/env Rscript

library(RColorBrewer)
library(plyr)

abc <- read.table("../data/flatfile.dat", h=T, sep='\t')

PAL <- brewer.pal(5, "Set2")
names(PAL) <- levels(abc$type)

LABELS <- c("Seed disp.", "Herbivory", "Parasit.", "Bacterioph.", "Pollin.")
names(LABELS) <- levels(abc$type)

abc <- ddply(abc, c("network", "type"), summarize, d=mean(d))

abc$d <- (abc$d-mean(abc$d))/sd(abc$d)

pdf("../figures/z-scores.pdf", height=8, width=13)
par(las=1, xaxs="i", yaxs="i", cex=2, mar=c(4.1, 4.0, 0.5, 0.3), mgp=c(2.1,0.8,0))

plot(NA, xlim=c(0,6), ylim=c(-2, 5), axes=F, bty='n', xlab="", ylab="", main="")
grid(nx=NA, ny=7, lty=1, col="lightgrey", lwd=2.5)
abline(h=0, col="darkgray")

points(jitter(as.numeric(abc$type)), abc$d, bg=PAL[abc$type],
  pch=21, col="darkgray", cex=1.0, lwd=1.5)

title(
  xlab="",
  ylab="Z-score of average distance",
  font.lab=2
)
axis(1, lwd.ticks=1.5, lwd=0, at=c(1,2,3,4,5), labels=LABELS)
axis(2, lwd=0, lwd.ticks=1, col.ticks="darkgray", at=c(-2, 0, 2, 4))

#legend("center", pt.bg=PAL, pch=21, legend=LABELS, col="darkgray", bty='n', cex=1.5)

dev.off()
