# Installing Software on ALPINE

Today we will explore two ways to access software on ALPINE. The first is the **modules system**. This will allow us to use software that the Research Computing team has already pre-installed and configured for us.

The second is through creation of a custom **Anaconda environment**. This will allow us to create a full environment of software we will use for this class. **Conda** is the open-source, cross-platform package and environment managment system used to create custom Anaconda environments. Similarly, we also commonly use **mamba**. mamba is a reimpliment of the conda package manager in C++ designed for speed and efficiency. Mamba offers the same environment management capabilities, including creation and managament of isolated environments. 

Here are the software packages we'll need for this class and how we'll install each:

| Software Package  | What it does | How we'll install it |
|-------------------|--------------|----------------------|
| sra-toolkit | downloads genomics data from online databases	 | modules |
| fastp | quality control | conda |
| bwa (bowtie) | alignment | conda |
| hisat2 | alignment | conda |
| bedtools | genomics file conversion | conda |
| samtools | genomics file conversion | conda |
| subread | tabulation | conda |
| deeptools | heatmaps & file conversion | conda |

## Resources

- [Loading Modules](https://curc.readthedocs.io/en/latest/compute/modules.html)
- [Research Computing](https://curc.readthedocs.io/en/latest/software/python.html#basic-conda-commands-to-get-you-started)
- [Anaconda Resources](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
- [bioconda](https://bioconda.github.io/index.html)

## Log into ALPINE through OnDemand

For this course, we will access ALPINE through a web browser portal called OnDemand.

Let's log into ALPINE using [OnDemand](https://curc.readthedocs.io/en/latest/open_ondemand/index.html). 
- Open https://ondemand-rmacc.rc.colorado.edu in a new tab or window
- Log into your CSU NET ID. You will receive a DUO PUSH on your phone. Accept it.
- To access the LINUX command line on ALPINE, go to the Clusters menu. Select >_Alpine Shell

## Loading Modules 

Follow along to load the sra-toolkit using the modules system.

First, let's explore a little of where we are ...

```
$ whoami
$ hostname
$ pwd
$ curc-quota 
```

`curc-quota` should give you your disk usage. 

Here is the “map” of ALPINE for reference.

<p align="center">
<img width="600" alt="alpine map" src="https://github.com/jesshill/CSU-2025FA-DSCI-510-001_LINUX_as_a_computational_platform/blob/main/Images/alpine_map.png">
</p>

Now move to the compile node!

```
$ acompile
$ hostname
```

From here, we can see what modules we have loaded already: 

```
$ module list
```

Next, lets see what modules are pre-installed by the staff and available to load: 

```
$ module avail
```


