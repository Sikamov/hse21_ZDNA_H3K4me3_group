
source('lib.R')

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

# NAME <- 'Human'
# NAME <- 'Mouse'
NAME <- 'All_except_1'

BED_FN <- paste0(DATA_DIR, NAME, '.bed')

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))

plotAnnoPie(peakAnno)
dev.off()
