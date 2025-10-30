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

#### For this class, we will use HISAT2

- Reference manual:
  - [HISAT2 web-manual](http://daehwankimlab.github.io/hisat2/manual/)

- HISAT2 reference publications:
  - [Origional 2016 HISAT publication](https://www.nature.com/articles/nprot.2016.095)
  - [HISAT: a fast spliced aligner with low memory requirements](https://www.nature.com/articles/nmeth.3317)
  - [The latest 2019 HISAT2 publication](https://www.nature.com/articles/s41587-019-0201-4)
 







