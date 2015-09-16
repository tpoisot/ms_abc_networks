#! /usr/bin/env Rscript

library(RColorBrewer)

abc <- read.table("../data/flatfile.dat", h=T, sep='\t')

PAL <- brewer.pal(5, "Set2")
names(PAL) <- levels(abc$type)

LABELS <- c("Seed dispersal", "Herbivory", "Parasitism", "Bacteriophagy", "Pollination")
names(LABELS) <- levels(abc$type)

abc$d <- 1-abc$d # Distances -> weights

dabc <- abc

pdf("../figures/posteriors.pdf", height=28, width=25)
# For each interaction type
par(las=1, xaxs="i", yaxs="i", mfrow=c(5,3), cex=2, mar=c(4.1, 4.0, 0.5, 0.55), mgp=c(2.1,0.8,0))
for(u in unique(abc$type)){

abc <- subset(dabc, type == u)

HCOL <- rgb(0.8, 0.8, 0.8, 0.3)

# Plot for p
plot(NA, xlim=c(0,1), ylim=c(0, 2.0), axes=F, bty='n', xlab="", ylab="", main="")
hist(
  abc$p,
  freq=F,
  col=PAL[unique(abc$type)],
  border=NA,
  breaks=50,
  add=T
)
hist(
  runif(100000, 0, 1), add=T, freq=F,
  border=NA, breaks=50, col=HCOL
)
title(
  xlab="Probability of bottom-level speciation",
  ylab=LABELS[unique(abc$type)],
  font.lab=2
)
axis(1, lwd.ticks=1.5, lwd=1.5)
axis(2, lwd=0, lwd.ticks=1, col.ticks="darkgray", at=c(0.5, 1.0, 1.5, 2.0))
grid(nx=0, ny=8, lty=1, col="lightgrey", lwd=1.0)

# Plot for e
plot(NA, xlim=c(-3, 0), ylim=c(0, 0.9), axes=F, bty='n', xlab="", ylab="", main="")
hist(
  log(abc$e, 10),
  freq=F,
  col=PAL[unique(abc$type)],
  border=NA,
  breaks=50,
  add=T
)
hist(
  runif(100000, -3, 0), add=T, freq=F,
  border=NA, breaks=50, col=HCOL
)
title(
  xlab="Interaction persistence",
  ylab="",
  font.lab=2
)
axis(1, lwd.ticks=1.5, lwd=1.5)
axis(2, lwd=0, lwd.ticks=1, col.ticks="darkgray", at=c(0.3, 0.6, 0.9))
grid(nx=0, ny=6, lty=1, col="lightgrey", lwd=1.0)

# Plot for c
plot(NA, xlim=c(-1, 1), ylim=c(0, 12), axes=F, bty='n', xlab="", ylab="", main="")
hist(
  log(abc$c, 10),
  freq=F,
  col=PAL[unique(abc$type)],
  border=NA,
  breaks=50,
  add=T
)
hist(
  runif(100000, -1, 1), add=T, freq=F,
  border=NA, breaks=50, col=HCOL
)
title(
  xlab="Rich get richer",
  ylab="",
  font.lab=2
)
axis(1, lwd.ticks=1.5, lwd=1.5)
axis(2, lwd=0, lwd.ticks=1, col.ticks="darkgray", at=c(4, 8, 12))
grid(nx=0, ny=6, lty=1, col="lightgrey", lwd=1.0)

}
dev.off()
