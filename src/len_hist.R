
source('lib.R')

###
# NAME <- 'Human'
# NAME <- 'Mouse'
NAME <- 'All_except_1'
###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)

colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()

print(OUT_DIR)
print(paste0('len_hist.', NAME, '.png'))
ggsave(paste0('len_hist.', NAME, '.png'), path = OUT_DIR)

