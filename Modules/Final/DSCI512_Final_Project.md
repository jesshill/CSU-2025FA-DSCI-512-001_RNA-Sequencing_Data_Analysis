# DSCI 512 - Final Project

- Due Tuesday, December 16, 2025, 11:59 pm
- If you need more time to complete this exam, please contact me ahead of time to make arrangements to turn the assignment in late.
- This exam accounts for 30% of your final grade

## RULES

- NO Wheat! No hexaploid, tetraploid, or other complex genomes!
- NO bacteria!
- NO un-characterized genomes!
- Go for model systems if you can or at least organisms that have a .gtf file.
- RNA-seq data must be paired-end!

## Description

This exam will be a **project**. You will be asked to pick an RNA-seq dataset to analyze. This dataset can be either something **published** already in a paper. It can be something you **produced** yourself or that your lab has produced. If you don't have an idea for a project readily available, talk to your PI about it. If you are not associated with a lab and you aren't sure which dataset to use, come talk to me and we can find some papers with data to choose from.

You will be asked to formulate a biological question that the RNA-seq dataset could address. It can be a question addressed in the originally published paper or it can be a new question. So think about a hypothesis you have that the dataset may be able to address. It should be within the framework of differential expression.

What are the transcriptional differences between wild type or mutant? What categories of genes might you expect to change most dramatically?
Which type of condition do you expect to have a dramatic effect on an organism (drug or mutant)?
What are the top-most changing genes between two conditions?
Some of the tasks you will do started out as Homework and Reading Assignments.

For the Final Project, you will customize and run the pipeline 2024_RNAseq_PE_array for your data. Basically, you will hack the code to run on your dataset. You will use .fastq files as input to produce tabulated counts as output on ALPINE. You will then download the tabulated count file from ALPINE and analyze it on your own computer using DESeq2 to produce a few plots.

You will be asked to create some figures and figure legends pertaining to your analysis (Questions 2 - 4) and you will be asked to introduce (Question 1) and discuss (Question 5) your findings.

