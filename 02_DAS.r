################################################################################
#                              Load data
################################################################################

# Matt file
matt_file <- "/storage/AClab/mponce/project/01_Matt/matt_events_Gastro_VehvsSAM486A.tab"

# Load file data 
matt <- read.delim(matt.file, dec = ".", header = TRUE, sep = "\t", stringsAsFactors = FALSE)


################################################################################
#                         Prefiltering data
################################################################################

# Filter events with length 0
filt_data <- matt[matt$LENGTH > 0,]

# Filter events with p-value NA
filt_data <- filt_data[!is.na(filt_data$PVAL_WILCOXON_GRPA_VS_GRPB),]


################################################################################
#                        Significant events
################################################################################

df <- filt_data[which(abs(filt_data$DPSI_GRPA_MINUS_GRPB) > 10 & filt_data$PVAL_WILCOXON_GRPA_VS_GRPB < 0.1),]

