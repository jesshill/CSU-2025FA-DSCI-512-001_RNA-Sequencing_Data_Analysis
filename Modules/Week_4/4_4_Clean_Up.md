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

For more details and tips on writing a sync script

## 4. Unzip on your local computer

To decompress the tarball once you obtain it...

```
$ tar -zxvf PROJ01.tar.gz
```

-x means “expand”

