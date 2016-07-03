library(selac)
library(lineprof)
tree<-read.tree('example/rokas.yeast.red.tre')
source("/Users/bomeara/Documents/MyDocuments/GitClones/selac/R/selac.R")
set.seed(42)
system.time(l0 <- lineprof(result.1 <- SelacLargeOptimize(codon.data.path = 'example/', phy = tree,
             edge.length = 'optimize', optimal.aa = 'optimize', data.type='codon',
             nuc.model = "GTR", include.gamma = FALSE, ncats = 4, numcode = 1,
             diploid = FALSE, k.levels = 0, aa.properties = NULL, verbose = FALSE, max.tol=0.1, max.evals = 10,
             n.cores = 2, max.restarts = 1, n.partitions=2)))

library(compiler)
enableJIT(3)
set.seed(42)
system.time(l3 <- lineprof(result.1 <- SelacLargeOptimize(codon.data.path = 'example/', phy = tree,
             edge.length = 'optimize', optimal.aa = 'optimize', data.type='codon',
             nuc.model = "GTR", include.gamma = FALSE, ncats = 4, numcode = 1,
             diploid = FALSE, k.levels = 0, aa.properties = NULL, verbose = FALSE, max.tol=0.1, max.evals = 10,
             n.cores = 2, max.restarts = 1, n.partitions=2)))

save(list=ls(), file="fastdirty.rda")
