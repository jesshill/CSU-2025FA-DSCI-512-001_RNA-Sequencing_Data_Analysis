# Introduction to Alignment 

The full pipeline for this course 

<p align="center">
<img width="700" alt="pipeline" src="...">
</p>

We are at the Align reads to the reference genome step.
Also called mapping, this step takes all the high-quality reads that were output from fastp and searches for their place of origin within the reference genome.
We expect that for mRNA-seq these regions should be heavily enriched for exon sequences.
For this reason, RNA-seq aligners need to take into account the fact that many reads may span exon-exon junctions where introns were spliced out.

## Aligners

There are many different alignment programs, also known as aligners, to choose from.
Typically, different aligners are designed with different strategies and attributes in mind.
In the past, the choice of aligner had the potential to make a big impact on the results and inferences. More recently, aligner behavior has improved and convergently evolved. The choice of aligner is not likely to make a marked impact on your conclusions.

Here are some examples of aligners you may encounter:

| ... | ... | ... |
| --- | --- | --- |
| ... | ... | ... | 
