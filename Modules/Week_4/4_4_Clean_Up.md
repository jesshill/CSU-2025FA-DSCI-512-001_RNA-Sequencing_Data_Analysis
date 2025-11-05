# Cleaning up an RNA-seq project on ALPINE

**!!! Reminder:** Scratch space should be used for all compute jobs run on Alpine. This high-performance scratch directory is not backed up, and is not appropriate for long-term storage. **Data may be purged at any time subject to overall system needs. Files are automatically removed 90 days after their initial creation.**

We want to save our results **locally**: 
1. Follow the instructions to Clean Up the Project on github
2. create a tarball out of the whole project
3. Use rsync to download your tarball to a local computer
4. Unzip on your local computer

ALPINE maintenance days are on **Wednesdays!**
- Sign up for maintenance notifications

**Final Exam Project**
- Start early
- Common pitfalls
  - Typos
  - Paths
- Metadata
  - HW assignment 4
- .gff files versis .gtf files
  - About .gff files 
- Thoughts on chatGPT are in the "Syllabus" 

## Recommended Acknowledgments 

- Reference all software, packages, and resources
- Include software and package versions
- Use NCBI GEO and SRA Toolkit
- Upload your .gtf files with your raw data! So helpful!
- Reference R
  - cite R when publishing: Type into R: 
```
citation()
```
- Reference ALPINE
- Reference your organism's data hub.
- Acknowledge this class if you use any adapted scripts in publications. Just include the class in the Acknowledgments or reference the github repository in Materials & Methods.
- Feel free to use all materials in this class freely. Feel free to adapt and change any materials as it suits your needs. Just acknowledge the class and relevant githubs somewhere.

## Recommended additional trainings

**Best Practices**
- [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)
- [A Quick Guide to Organizing Computational Biology Projects](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)
- [Gene name errors are widespread in the scientific literature](https://pmc.ncbi.nlm.nih.gov/articles/PMC4994289/)

**Clustering**
- [Stats Lab Dublin Hierarchical Clustering (1 of 5 videos)](https://www.youtube.com/watch?v=3cub1laiFeU)

**RNA-seq resources**
- [Kasper Hansen's Statistics for Genomics youtube video](https://www.youtube.com/watch?v=C8RNvWu7pAw&t=2366s)
- [DESeq2 Vignette](https://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html)
- [Simon Anders CSHL Lecture of DESeq2](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/DESeq2-Anders.pdf)

**R programming** 
- [Base R Cheatsheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)
- [An introduction to R, by R Core Team](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)

## 1. Follow the instructions to Clean Up the Project

[Erni's Github repo for RNAseq_PE_array](https://github.com/erinosb/2024_RNAseq_PE_array)

Copied from there:

7. Clean up the project I included a script that automates the process of compressing files and deleting temp files. This is located in the same directory you cloned from github. To use this script:

- Make sure the cleanup script RNAseq_cleanup_241117.sh is copied into the 02_scripts directory (move it one directory up).
- Modify the “Modify this Section” part of the clean script.
- Modify the execute_RNAseq_pipeline.sbatch script to 1) comment out the bash line that runs the RNAseq_analyzer script, 2) remove the from the bash line that runs the cleanup script, and 3) add the metadata path
- It should look like this:

```
######################################################
## Execute the RNA-seq_pipeline to run the pipeline ##
######################################################
 
# Execute this script to analyze samples in your metadata file
#bash analyze_RNAseq_241117.sh $SLURM_NTASKS $line 
 
 
#############################
# Optional Clean Up Script  #
#############################
 
## Execute the cleanup script to zip .fastq files and delete extra files
bash cleanup_RNAseq_241117.sh $line
```

- Again, run with:

```
$ sbatch --array=0-17 execute_RNAseq_pipeline.sbatch 
```

## 2. create a tarball out of the whole project

Compress your PROJ01_GomezOrte directory into a single file...

**Usage**

```
tar -zcvf <compressed-file-name> <path/to/directory/you/want/to/compress>
```

```
# Options:

 -z use gzip
 -c compress
 -v verbose (print stuff out)
 -f file name is supplied
```

Compress using the following examples to guide you:

```
$ pwd
~/your/path/DSCI512
$ ls
PROJ01_GomezOrte  PROJ02_ce11_indexBuild  PROJ03_myPorcineProject
$ tar -zcvf PROJ01.tar.gz PROJ01_GomezOrte
$ tar -zcvf PROJ02.tar.gz PROJ02_ce11_indexBuild
$ tar -zcvf PROJ03.tar.gz PROJ03_myPorcineProject
$ ls 
PROJ01_GomezOrte  PROJ01.tar.gz  PROJ02_ce11_indexBuild PROJ02.tar.gz PROJ03_myPorcineProject  PROJ03.tar.gz
```

## 3. Use rsync to download your tarball to a local computer

You can just download with right-click download. However, if download is disrupted, you'll need to start again.

rsync can pick up downloads if they are disrupted. Saves you time. You can build your own sync script and do your syncs periodically and automatically.

Basically:
- Open a terminal on your local computer
  - Mac: terminal
  - PC: putty

rsync code will look something like this...

```
$ rsync -auvz -e 'ssh -p 22' jesshill\@colostate.edu@login.rc.colorado.edu:/scratch/alpine/jesshill@colostate.edu/DSCI512/PROJ01.tar.gz .
```

**!!!** To use it, don't forget to replace my eID with yours!

**!!!** Don't forget the final period

**!!!** When prompted for the password, don't forget to type: password,push

- As in, your password, then a comma, then the word push. No spaces. You'll have to say accept on your DUO app on your phone for it to continue

**!!!** Common pitfall: Be aware that directory and directory/ with a trailing slash will have different behaviors in rsync. directory will move the whole directory. directory/ with the trailing slash will move only the contents of directory.

<details>
  <summary>For more details and tips on writing a sync script</summary>

---

### Syncing using rsync

Scratch space on ALPINE is deleted every 90 days. If you would like to avoid this, please work in your project space (250 GB limit) or request petabyte storage space (for a fee).

To avoid having your projects disappear in the poof with no warning, it is important to save your work locally.

There are many strategies to do this. We will discuss one strategy. It may not the best, so consult with your lab and/or the ALPINE help people for advice.

1. Write a shell script in a local directory on your computer.
2. Run the shell script anytime you are working on ALPINE. You can run the script in the morning and at night.
3. The script will use rsync. Rsync is a powerful utility for synchronizing and backing up lots of data in complex ways.

**rsync usage:**

```
rsync -auvz -e 'ssh -p 22' <source> <target> 
rsync -auvz -e 'ssh -p 22' <source> .
```

This command will make a copy of all the data in <source> to <target>. <source> and <target> can be different locations on the same computer or locations on remote computers (servers, cloud locations, supercomputers, etc).

Let's break it down...

```
rsync   this is the command
-a      archive option. this is a shortcut for many options all bundled into
        one.
        It basically allows you to sync things within directories 
        (recursively) and preserves lots of information about the date of last 
        modification, permissions, etc.
-u      update option. Only move files that have changed since the last rsync.
-v               verbose option. This makes rsync spit out a lot of commentary 
                 on what it is doing.
-z               compress option. This compresses the data during transit.
-e 'ssh -p 22'   This specifies that you want to connect to the remotes server 
                 using secure shell.
<source>         source. This is the summit source directory. In the form: eID\@colostate.edu@login.rc.colorado.edu:/scratch/summit/location
<target>         This is your local space. I just use a dot. 
                         
Other helpful options:
-n               dry run option. When you add -n, nothing actually is moved or 
                 copied, but it is just a test.
--exclude <filesOrDirs>  an option that allows you to ignore syncing certain files. 
                         This can be useful if there is a giant input folder where 
                         you often unzip and re-zip files.
```

Here is an example of my script called `rsync_summit.sh`...

```
#!/bin/bash
 
#Pull work from summit to the local directory
rsync -auvz -e 'ssh -p 22' jesshill\@colostate.edu@login.rc.colorado.edu:/scratch/alpine/jesshill@colostate.edu/DSCI512_RNAseq .
```

- To use it, don't forget to replace my eID with yours!
- When prompted for the password, don't forget to type: password,push

**!!! Exercise:** Make a shell script on your local computer inside the directory where you want to copy/backup your /scratch/summit files.

**!!! Common pitfall:** Be aware that `directory` and `directory/` with a trailing slash will have different behaviors in rsync. `directory` will move the whole directory. `directory/` with the trailing slash will move only the contents of directory.

**!!! Common pitfall:** This may be tricker for PC people than for Mac people.

**!!! Common pitfall:** Match the shebang line to your own configuration by looking up `$ which bash`.

### Moving files using an ftp client

Learn more about moving files here: 

### Secure Coyping using SCP

scp - Secure CoPy
scp <sourcefile> <target>
scp <http://address/to/file/file.txt> <.>

Can be used to secure copy onto your local computer or to pull things from alpine or push things to alpine.

---

</details>

## 4. Unzip on your local computer

To decompress the tarball once you obtain it...

```
$ tar -zxvf PROJ01.tar.gz
```

-x means “expand”

