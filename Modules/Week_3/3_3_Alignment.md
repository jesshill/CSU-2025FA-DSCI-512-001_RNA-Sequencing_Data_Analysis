# Introduction to Alignment 

<p align="center">
<img width="700" alt="course pipeline" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/course_pipeline.jpg">
</p>

- We are at the **align reads** to the **reference genome** step.
- Also called **mapping**, this step takes all the high-quality reads that were output from **fastp** and searches for their place of origin within the reference genome.
- We expect that for mRNA-seq these regions should be heavily enriched for **exon** sequences.
- For this reason, RNA-seq aligners need to take into account the fact that many reads may span **exon-exon junctions** where introns were spliced out.

## Aligners

- There are many different **alignment programs**, also known as **aligners**, to choose from.
- Typically, different aligners are designed with different strategies and attributes in mind.
- In the past, the choice of aligner had the potential to make a big impact on the results and inferences. More recently, aligner behavior has improved and convergently evolved. The choice of aligner is not likely to make a marked impact on your conclusions.

Here are some examples of aligners you may encounter:

| Aligner | Should I consider it? | Notes  | Reference |
| ------- | --------------------- | ------ | --------- |
| Tophat/Tophat2 | Just no | Out of date; slow; authors of the software dissuade against its use | no |
| STAR | yes | A very popular choice; very fast; extensible with a whole set of software | [STAR Github](https://github.com/alexdobin/STAR) |
| Salmon | yes | A popular choice; fast; lightweight version; accounts for some types of biases | [Salmon](https://salmon.readthedocs.io/en/latest/salmon.html) |
| Hisat2 | yes | A Nishimura lab favorite; very fast; user-friendly | [Hisat2](http://daehwankimlab.github.io/hisat2/main/) |
| Kallisto | yes | Excellent for model organisms with robust reference transcriptomes; Goes straight to tabulating the reads to known transcriptomes; skips some aspects of alignment | [Kallisto](https://pachterlab.github.io/kallisto/) |
| Trinity or SOAPdenovo-Trans | only if your genome isn't sequenced | These are two alignment tools that can be used if you don't have a reference genome | [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) and [SOAPdenovo-Trans](https://github.com/aquaskyline/SOAPdenovo-Trans) |

All of these aligners should be available to install on ALPINE using conda... [bioconda](https://bioconda.github.io/index.html).

## For this class, we will use HISAT2

- Reference manual:
  - [HISAT2 web-manual](http://daehwankimlab.github.io/hisat2/manual/)

- HISAT2 reference publications:
  - [Origional 2016 HISAT publication](https://www.nature.com/articles/nprot.2016.095)
  - [HISAT: a fast spliced aligner with low memory requirements](https://www.nature.com/articles/nmeth.3317)
  - [The latest 2019 HISAT2 publication](https://www.nature.com/articles/s41587-019-0201-4)
 
### About HISAT2

- **HISAT2** stands for **Hierarchical Indexing for Spliced Alignment of Transcripts**
- The HISAT2's alignment strategy:
  - First, map reads that perfectly match to exons
  - Second, map exon-exon-junction-spanning reads with >15 nt of homology to either exon.
  - Third, go back and map exon-exon-junction-spanning reads with <15 nt of homology
- HISAT2's special attributes
  - HISAT2 is incredibly fast compared to other aligners. How does HISAT2 achieve its speed? HISAT2 splits the genome into chunks and tabulates the contents within each chunk into indexes. The developers analogize this as creating a “table of contents” for the genome. Instead of searching for homology to a given read throughout the genome, the algorithm searches the indexes first and iterates through each genomic possibility.
  - HISAT2 is flexible enough to allow for SNP mismatches. This is important for sequencing human individuals who vary in their genomes at millions of single-nucleotide loci.

<p align="center">
<img width="700" alt="hisat2" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/hisat2.png">
</p>

### HISAT2 alignment strategy 

- Figure: From Kim et al., 2015. HISAT: a fast spliced aligner with low memory requirements. Nature Methods. 12, p357–360.
- First - M reads are mapped first. Completely aligned to a given exon. All unmapped reads are reserved.
- Second - using the previously unmapped reads, all 2M_gt_15 reads are mapped. These have more than 15 bp of homology within each exon. The unmapped reads are reserved.
- Third - using the previously unmapped reads, all the remaining small-anchor and “other” models are tried. These contain 1 - 15 bp of homology to each exon, or they span more than two exons.

## How do we use HISAT2? 

1. Install software (done)
2. Prepare the genome
  - Download genome information (.fasta)
  - Build indexes – this is like writing the index to a book
3. Run HISAT2
  - Input: FASTQ files (two for each read if you’re doing paired-end)
  - Input: Genome indexes (created above)
4. Get HISAT2 output
  - Output: .bam files – alignment files
  - Output: Log files

Other genome files that are useful to download when you download the .fasta files:
- Chromosome length files (.txt)
- Annotation files (.gtf, .gff)

## BONUS Content: Alignment detailed instructions 

...

Continue on to [Building Indexes](3_4_Building_Indexes.md)
