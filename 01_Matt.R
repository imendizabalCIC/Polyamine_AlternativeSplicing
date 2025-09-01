#!/bin/bash

##################################################################
#                     RUN MATT
##################################################################

# See https://gitlab.com/aghr/matt 
# Matt v1.3.0

# Main directory
path="/storage/AClab/mponce/project"

# Output directory
dir_outfiles="$path/01_Matt"
mkdir -p $dir_outfiles
cd $dir_outfiles

# Select Mouse assembly annotation file
gtf_file="/storage/AClab/DATA_shared/NewCluster_Software/vast-tools/Mm10.gtf"
# gtf_file="/storage/AClab/DATA_shared/NewCluster_Software/vast-tools/Hsa38.gtf" 

# VAST-TOOLS result table
inclusion_tab=$dir_outfiles/INCLUSION_LEVELS_FULL-mm10-10.tab

# Experimental group
groupA="Gastro_SAM486A_6,Gastro_SAM486A_7,Gastro_SAM486A_8,Gastro_SAM486A_9,Gastro_SAM486A_10" 
# Control group
groupB="Gastro_Vehicle_1,Gastro_Vehicle_2,Gastro_Vehicle_3,Gastro_Vehicle_4,Gastro_Vehicle_5"

# Run comparison 
matt get_vast $inclusion_tab -a $groupA -b $groupB -gtf $gtf_file -f genei_d -minqglob VLOW -minqab VLOW > matt_events_Gastro_VehvsSAM486A.tab