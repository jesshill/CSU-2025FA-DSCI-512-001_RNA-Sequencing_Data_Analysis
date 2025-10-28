# Pre-Processing & Quality Control with fastp

Let's go ahead and log into [ALPINE through OnDemand](https://ondemand.rc.colorado.edu) if you're not already logged in.

Then go ahead and activate our conda environment.

### Once there:

```
$ acompile --time=2:00:00
$ module load anaconda
$ conda env list
$ conda activate 2024dsci
$ cd /scratch/alpine/<youreID@colostate.edu>/DSCI512   # move to your directory
```

Today, we want to do several things in one step. We want to...

- Assess the overall quality of the data we have obtained
- Remove low Phred-scoring reads
- Remove any adapter sequence that has snuck into our reads
- Remove polyA tails or PolyX tracks. PolyA tails won't align to the genome. And PolyX tracks sometimes arise erroneously through the sequencing process.

We can do all of these tasks with the toolkit **fastp**

### Helpful fastp references

- [fastp github repository]() ...
- fastp publication: ...

```
$ fastp
```



