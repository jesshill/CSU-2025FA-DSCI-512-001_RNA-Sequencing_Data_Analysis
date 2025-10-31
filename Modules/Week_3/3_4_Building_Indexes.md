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

For this project, we will take meticulous notes of everything we are doing. If we decide to publish this project, we will need these notes (dates, versions, URLs, etc) for the materials and methods section.

**!!! Exercise:** start a readme file within the directory `PROJ02_ce11IndexBuild`.

```
$ cd PROJ02_ce11IndexBuild
$ touch 241119_README_downloads.txt
```

- Open this file using a text editor. You'll need to ensure your working directory is synced in the file structure on the left panel.
- Fill it with some content.
  - Date
  - Your name
  - The directory in which you are currently working
  - Your goal (downloading the C. elegans genome and building hisat2 indices for it.)

**!!! Exam Notes:** You will be asked to keep a running Notebook of all your notes for Homework 4, Homework 5, and the Exam. You will turn this notebook in as Question #6 of the exam.

## Explore the C. elegans genome 

- In a new internet browser tab, navigate to [UCSC Genome Browser](https://genome.ucsc.edu/)
- Under **Downloads**, select **Genome Data**
- Select **Nematodes**
- Select **C. elegans** (Also navigable: [http://hgdownload.soe.ucsc.edu/downloads.html#c_elegans](http://hgdownload.soe.ucsc.edu/downloads.html#c_elegans))
- Under **Feb. 2013 (WS220/ce11)**, select **Sequence data by chromosome**
- These are the files we want to download! Scroll down to the bottom and you can find links to each file.
- However, we want to transfer these files over to our directory on ALPINE. To do this, we'll use the instructions written on this page to use the command **rsync** to synchronize the UCSC Genome Browser directory with our ALPINE directory.

## Let's download the genome!

**!!! Exercise:** Download the *C. elegans* genome

**Let's download all the chromosomes of the *C. elegans* genome.**

- We will use the rsync command suggested to us on the UCSC Genome Browser page: [http://hgdownload.soe.ucsc.edu/goldenPath/ce11/chromosomes/](http://hgdownload.soe.ucsc.edu/goldenPath/ce11/chromosomes/)

**!!! Common Pitfall:** Don't forget the period at the end of the rsync command line

```
# making sure you're in the directory ''/scratch/alpine/<eID@colostate.edu>/DSCI512/PROJ02_ce11IndexBuild''
$ pwd # should be /scratch/alpine/<eID@colostate.edu>/DSCI512/PROJ02_ce11IndexBuild
$ rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/ce11/chromosomes/ .
$ ls -alh
```

- Does this seem familiar? We did something similar in DSCI510 [Downloading files from the internet]()
- Next, let's check whether the files arrived uncorrupted by transit using md5sum.

```
# Check the md5 sums:
$ more md5sum.txt                  # This reads the md5sum file that UCSC included in the directory
$ md5sum *.fa.gz                   # This checks all the md5sums of the files you downloaded
$ md5sum *.fa.gz > 2511DD_sums.txt # This saves all the md5sums of the files you downloaded in a file
$ diff md5sum.txt  2511DD_sums.txt # This compares the md5sums you generated to the ones UCSC gave you.
                                   # You shouldn't see anything coming up.
```

**Taking Notes:** Ok, now record what you did in your file YYMMDD_README_downloads.txt. You can use history. Make sure you include the download command and make mention that you checked the md5sums.

### Unzip your files 

We need to unzip the files

```
$ gunzip *.fa.gz
```

### Concatenate the genome

These days, many genomes are downloadable as a single file. C. elegans was the first animal to have its genome sequenced so it is in the older format with a file for each chromosome. Let's merge the files together into one complete genome file.

To concatenate the separate chromosome files into a whole genome file...

```
$ cat *.fa > ce11_wholegenome.fa
```

## Let's build the indexes!

**First lets write a script to build the indexes. We'll call it `buildWormIndices.sbatch`**

```
# Start a script called buildWormIndices.sbatch
$ touch buildWormIndices.sbatch
```

If you're in JupyterHub, you can open the file in an editor, by double-clicking it on the file system browser along the left-hand side.

**Copy and paste this code into the program file to initiate it**

```
#!/usr/bin/env bash
 
#SBATCH --job-name=execute_hisat2-build
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=00:29:00
#SBATCH --partition=atesting
#SBATCH --output=log_hisat2-build_%J.out
 
# Test that you have hisat2 working
hisat2
```

Test that the code works. Execute it using:

```
$ sbatch buildWormIndices.sbatch
$ scheck     # test it is working
$ more log_hisat2-build*   # read the output file created
```

**Quick Tip:** Go to [Research Computing Job Submission](https://curc.readthedocs.io/en/latest/running-jobs/batch-jobs.html) site to learn more about your #SBATCH options on ALPINE.

**Now add some pseudocode about what we want to do**

```
#!/usr/bin/env bash
 
#SBATCH --job-name=execute_hisat2-build
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=00:29:00
#SBATCH --partition=atesting
#SBATCH --output=log_hisat2-build_%J.txt
 
# Build hisat2 indexes for C. elegans
 
 
# Check the build
 
 
# Capture version number
```

**Now let's add code blocks under each line of pseudocode.**

- This is the best practice for writing a script... plan first, code next. Test each block of code as you go.

**Now we need to build some indexes**

- If we look in the HISAT2 manual under the entry for **The hisat2-build indexer**, we'll find the proper usage for building genome indexes:

<p align="center">
<img width="700" alt="hisat2 build indexes" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/hisat2_buildIndexes.png">
</p>

**Usage:** hisat2-build [options] <reference_in> <ht2_base>

```
hisat2-build

options: 
-p <num>             Number of threads to use. The number in this option MUST match the number in the line #SBATCH --ntasks=<num>

<reference_in>       This is the genome as an .fa file. OR, you can use a list of comma-separated file names of all the chromosomes in your genome.
<ht2_base>           This is the name of your new genome. It'll just be ce11 (not the word cell, but ce + the number 11)
```

So, first it'll be just... 

`hisat2-build -p 4`

However, it is good coding practice to pull the number of threads specified in the #SBATCH section using some fancy environmental variables:

`hisat2-build -p ${SLURM_NTASKS}`

You can use `ce11_wholegenome.fa` as the <reference_in> genome.

Then, just add the last element: 

`ce11`

So, your code in buildWormIndices.sbatch should look like this:

```
#!/usr/bin/env bash
 
#SBATCH --job-name=execute_hisat2-build
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=00:29:00
#SBATCH --partition=atesting
#SBATCH --output=log_hisat2-build_%J.txt
 
# Build hisat2 indexes for C. elegans
hisat2-build -p ${SLURM_NTASKS} ce11_wholegenome.fa ce11
 
 
# Check the build
echo -e "\n\nINDEX-BUILD: inspecting indexes:"
hisat2-inspect -s ce11
 
# Capture version number
echo -e "\n\nINDEX-BUILD: version:"
hisat2-build --version
```

**Run it!!!**

- Switch over into a **terminal**.
- Make sure you are in the same directory as your file `buildWormIndices.sbatch`
- Then, execute!

```
$ sbatch buildWormIndices.sbatch
 
# To check on it:
$ scheck
 
# To watch your index files grow...
$ ls -alh
```

**Did it work???** Check it! You should have a log file and **eight** new files that all have names like `ce11.1.ht2`, `ce11.2.ht2`.

- No matter how large your genome is, you'll always have just 8 of these files.

**README time!** Write down what you did. Some other information you'll want to include in your notebook.

## Write a paths file

When we use this index, the one thing we'll need is the path and the prefix. To make it easy for me to find this information in the future, I like to save a file called `paths.txt` that contains this information.

```
$ touch paths.txt
```
