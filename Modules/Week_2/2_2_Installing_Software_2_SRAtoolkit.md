# Installing Software II - Setting up SRA Toolkit

We are going to start to use the **SRA Toolkit (Short Reach Archive Tools)** to download large, raw RNA-seq data files from a **public data repository**. SRA Toolkit is a collection of software bundled together. It is written and maintained by [NCBI - National Center for Biotechnology Information](https://www.ncbi.nlm.nih.gov/), a division of the NIH (National Institutes of Health).

If your grant is supported by US government funds, you must deposit your data in NCBI prior to publication. If you are publishing in any major journal, you will be required to deposit your data at either NCBI or an equivalent public data repository and allow your reviewers to preview the data.

Before we start, we'll need to just configure SRA Tools. We will only need to do this once.

Let's ensure we all have the proper version ...

**!!! EXERCISE:** Let's load the SRAtoolkit module
```
$ acompile
$ module list             # this lists what you have installed already
$ module spider sra       # this searches for things that have 'sra' int hem
$ module load sra-toolkit # this installs the pre-loaded sra-toolkit
$ module list             # this lists what you have installed
```

**!!! HINT:** If you're not seeing sra-toolkit, ensure that you are on the compile node:
```
$ hostname #should not say login
$ acompile # to switch to to a compile node
```

Great! Now, if you just executed that command, double check that you have the proper version with
```
$ fasterq-dump
```



Continue on to [Project Initiation](2_3_Project_Initiation.md) 
