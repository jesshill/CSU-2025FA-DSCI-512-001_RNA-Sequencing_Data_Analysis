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

**1. Transcriptome profiling has been used to identify cancer sub-types**

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
<img width="600" alt="HeatMap ex1" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/HM_ex1.png">
</p>

**2. Transcriptome profiling gene expression patterns through development**

Boeck, ME, et al. 2016. [The time-resolved transcriptome of C. elegans](https://genome.cshlp.org/content/26/10/1441.long) Genome Research. Oct;26(10):1441-1450.

- RNA-seq was performed on 97 samples of Caenorhabditis elegans at different developmental stages
- Embryonic and larval stages of development were captured
- Waves of gene expression occur through development

<p align="center">
<img width="300" alt="HeatMap ex2" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/HM_ex2.png">
</p>

## What else can we learn?

RNA-seq in its most basic form assesses the transcriptome of a sample. This is useful to take a snapshot of gene expression within that sample at a given time. However, by sequencing subsets of transcriptomes, we can understand more RNA processes and the basic biology of the cell with greater detail. Therefore, by combining RNA-seq methodology with approaches that isolate specific pools of RNA, we can expand our knowledge.

Some examples of these protocols are shown in the chart below.

<p align="center">
<img width="600" alt="seq methods" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/seq_methods.jpg">
</p>

Images adapted from Stark et al., 2019

## What is the spatial resolution of RNA-seq? 

The original protocols for RNA-seq required 4 micrograms of total RNA preparation. This was a large input requirement. Advancements in the RNA-seq protocol now make it possible to perform RNA-seq on individual cells that contain only tens of picograms of total RNA. By combining these reduced input protocols with microfluidics, individual cells can now have their individual transcriptomes profiled.

**DROP-seq** is one of the first and most successful examples of this type of technology. DROP-seq creates oil-water droplets of individual cells followed by parallel processing of thousands or tens of thousands of RNA-seq libraries [Macosco et al., 2015, Cell](https://www.cell.com/fulltext/S0092-8674(15)00549-8). Click [here](https://mccarrolllab.org/dropseq/) to see droplet formation in action!

<p align="center">
<img width="500" alt="Drop-Seq" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/drop-seq.gif">
</p>

Using DROP-seq, the individual cell compositions of complex tissues, organs, and tumors can be probed. This has led to advances in our understanding of how cells work together in multicellular systems. Cell types can be identified from the heterogenous pool of cells based on known cell identity markers. Further, different cell groupings may be referred to as cell states (as opposed to cell types) due to the fact that gene expression responses are confounded with cell identity in these studies. 

The first tissue studied by this method was the mouse retina. The transcriptomes of 44,808 mouse embryonic retinal cells were separated by DROP-seq into 39 transcriptionally distinct clusters and plotted using a new form of transcriptome diversity representation called a tSNE plot. The study re-capitulated known retinal cell types, identified novel cell types not previously associated with the retina, and discovered a wide range of transcriptome diversity among the amacrine cell group [Macosco et al., 2015, Cell](https://www.cell.com/fulltext/S0092-8674(15)00549-8).

<p align="center">
<img width="700" alt="Drop-Seq example" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/drop-seq_ex.jpg">
</p>

Figure from [Macosco et al., 2015, Cell](https://www.cell.com/fulltext/S0092-8674(15)00549-8): A.) Retinal tissue was dissociated and assessed by DROP-seq. B.) A tSNE plot of the resulting transcriptome profiles.

Single-cell resolution RNA-seq is now available through kits and platforms mass-produced by different companies including the 10X Genomics Chromium Platform and Illumiina Sequencing (PIP-seq). However, these high resolution assays still present certain technical challeneges depending on the cell types/organisms being probed. 

Continue on to [The RNA-seq Protocol](1_4_241105_RNAseqProtocol.pdf)

Continue on to [Installing Software](1_5_Installing_Software.md)
