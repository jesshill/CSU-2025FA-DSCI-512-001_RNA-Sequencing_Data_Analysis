# Introduction to RNA-seq 

## What is RNA-seq? 

- A transcriptome is the sum set of total mRNA molecules from a given sample
- RNA-seq uses high-throughput sequencing to characterize a transcriptome by identifying all RNA sequences and simultaneously quantifying their abundances
- Also called transcriptome profiling

## How do we do RNA-seq? 

1. Isolate mRNA convert it to cDNA
2. Create a library of cDNA fragments with specialized adapter sequences ligated to each end
3. Interrogate the sequence of each cDNA fragment on high-throughput sequencing instrumentation
4. Identify the gene of origin for each fragment
5. Quantify fragments emanating from each gene

<p align="center">
<img width="410" alt="RNAseq workflow" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/191114_rnaseqintro_depict.png">
</p>

## What can we learn from RNA-seq?

### Discovery 

- Annotate genomes
- Find new transcripts, splice junctions, polyA sites
- Identify Single Nucleotide Polymorphisms (SNPs) differences

### Comparison

- RNA abundance differences between conditions
- Splice/isoform differences between conditions
- Compare how different SNP-containing alleles are expressed

### Examples

1. Transcriptome profiling has been used to identify cancer sub-types

Perrou, C. 2011. [Molecular Stratification of Triple-Negative Breast Cancers](https://theoncologist.onlinelibrary.wiley.com/doi/full/10.1634/theoncologist.2011-S1-61) The Oncologist. 16 Suppl 1:61-70.

- RNA-seq was performed on 677 breast tumors from patients.
- Breast tumors fall into 5 major sub-types.
- Breast tumors that had been categorized as Triple-Negative actually fell in two sub-types – Claudin-low and Basal-like.
- This discovery has led to new approaches to treating triple-negative breast cancer.
- This is a hierarchically clustered heat map
  - Each patient sample is a column
  - Significantly changing genes are shown as rows
  - A computer program called a clustering algorithm organizes the order of rows and columns into groupings

<p align="center">
<img width="410" alt="HeatMap ex1" src="...">
</p>

2. Transcriptome profiling gene expression patterns through development

Boeck, ME, et al. 2016. [The time-resolved transcriptome of C. elegans](https://genome.cshlp.org/content/26/10/1441.long) Genome Research. Oct;26(10):1441-1450.

- RNA-seq was performed on 97 samples of Caenorhabditis elegans at different developmental stages
- Embryonic and larval stages of development were captured
- Waves of gene expression occur through development

<p align="center">
<img width="410" alt="HeatMap ex1" src="...">
</p>
