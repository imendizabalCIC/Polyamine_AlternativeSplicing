#!/bin/bash

##################################################################
#                     RUN VAST-TOOLS
##################################################################

# See https://github.com/vastgroup/vast-tools
# Vast-tools v2.5.1

# Output directory
dir_outfiles="$path/00_VAST_TOOLS"
mkdir -p $dir_outfiles
cd $dir_outfiles

# Select assembly (Mm2/Hs2)
assembly="Mm2"
# assembly="Hs2"

# Samples names
samples=($(ls ${dir_infiles}*_R1.fastq.gz | xargs -n1 basename))
samples_names=()
for s in "${samples[@]}"; do
  samples_names+=("${s/_R1.fastq.gz/}")
done

# VAST-TOOLS align
# Map junctions reads within each RNA-seq sample
for sample in "${samples_names[@]}"; do

  fastq_1="${dir_infiles}${sample}_R1.fastq.gz"
  fastq_2="${dir_infiles}${sample}_R2.fastq.gz"

    vast-tools align $fastq_1 $fastq_2 \
    -sp $assembly \
    -c 8 \
    -stepSize 25 \
    -mismatchNum 2 \
    --IR_version 2 \
    --bowtieProg=/storage/apps/bowtie/bowtie-1.0.0/bowtie \ 
    -n $sample \
    -o $dir_outfiles
done


# VAST-TOOLS combine
# Combine all results into an unique tbale compatible with Matt software
vast-tools combine -sp $assembly -c 8 --IR_version 2 --keep_raw_reads --extra_eej 5 -C
