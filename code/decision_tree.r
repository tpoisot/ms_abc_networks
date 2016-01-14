library(tree)

load("weighted.Rdata")

weighted$type <- as.factor(weighted$type)

weighted$e <- log(weighted$e, 10)
weighted$c <- log(weighted$c, 10)

network_tree <- tree(type~e+c, data = weighted)

pdf(file="../figures/tree.pdf", height=12, width=8)

plot(network_tree)
text(network_tree)

dev.off()

twei <- weighted
twei$type <- as.numeric(twei$type)
