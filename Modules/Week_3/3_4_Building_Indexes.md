# Building HISAT2 Genome Indexes

## References 

- [HISAT2 manual](http://daehwankimlab.github.io/hisat2/manual/)
- [UCSC Genome Browser](https://genome.ucsc.edu/)

## Downloading the genome and building indexes

Because our project involves the C. elegans genome, we will now download the C. elegans genome and build HISAT2 indexes using it. These are files that will make it possible to use the C. elegans genome as a reference genome in a HISAT2 alignment. This is a very common step in any NextGen sequencing alignment protocol.

To get started, we'll need to download some information on the C.elegans genome from a trusted repository.

To build the genome, we'll need as input two things...
- The genome as fasta files, one for each chromosome
- A name for our genome that we choose. (Since we're using Caenorhabditis elegans, version 11, we'll call it **ce11**)

**!!! Exercise:** Build hisat2 indices 

Ensure you are on ALPINE, are on the acompile node, and have activated your conda environment, and are in the proper folder

```
$ acompile
$ module load anaconda
$ conda activate 2024dsci
$ cd /scratch/alpine/<eID@colostate.edu>/DSCI512/
```

Start a new project entitled `PROJ02_ce11IndexBuild`

**NOTE:** for this project, we will be making C. elegans version #11 index build. So the abbreviation will be **ce11**. Those are two **ONES**. It is **NOT** the word “cell”.

```
$ pwd 
/scratch/alpine/tstark@colostate.edu/DSCI512/
$ mkdir PROJ02_ce11IndexBuild
```

## On the importance of taking notes








