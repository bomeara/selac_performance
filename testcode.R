library(selac)
tree<-read.tree('example/rokas.yeast.red.tre')


time.1 <- system.time(result.1 <- SelacLargeOptimize(codon.data.path = 'example/', phy = tree,
             edge.length = 'optimize', optimal.aa = 'optimize', data.type='codon',
             nuc.model = "GTR", include.gamma = FALSE, ncats = 4, numcode = 1,
             diploid = FALSE, k.levels = 0, aa.properties = NULL, verbose = TRUE,
             n.cores = 2, max.restarts = 2, n.partitions=2))

time.2 <- system.time(result.2 <- SelacLargeOptimize(codon.data.path = 'example/', phy = tree,
                          edge.length = 'optimize', optimal.aa = 'optimize', data.type='codon',
                          nuc.model = "GTR", include.gamma = FALSE, ncats = 4, numcode = 1,
                          diploid = FALSE, k.levels = 0, aa.properties = NULL, verbose = TRUE,
                          n.cores = 2, max.restarts = 2, n.partitions=2, tol.step=2))


save(list=ls(),file='exampleRun.Rdata')
system("git add exampleRun.Rdata")
system("git commit -m'run done' -a")
system("git push")
