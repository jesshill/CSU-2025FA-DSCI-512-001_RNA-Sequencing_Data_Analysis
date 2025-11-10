# Tabulation How To

How to write a line of featureCounts code.

**!!! NOTE:** For our previous steps, like fastp and hisat2, we operated on each sample individually. So, if we have 18 samples in our dataset, the goal would be to run fastp 18 times, once for each sample. featureCounts is different. In this step, we will merge together all the samples. We will only run featureCounts once and that single step will take ALL the samples as input. Here is a visual summary of that concept:

<p align="center">
<img width="700" alt="featureCounts idea" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/featurecounts_idea.jpg">
</p>

**GOAL:**
- Obtain some .sam files to tabulate
- Obtain a .gtf file
- Learn how to write the featureCounts line of code
- Execute featureCounts using the pipeline.

## 1. Obtain some .sam files to tabulate

Let's pretend you have generated some .sam files

```
#Navigate to your output file
$ pwd
/scratch/summit/<email/DSCI512/PROJ01_GomezOrte/03_output
 
# Create a link to these files:
$ ln -s /pl/active/onishimura_lab/ERIN/COURSES/SAMFILES/* .
 
# Check you have the files:
$ ls
EG01.sam EG02.sam EGO03.sam
```

## 2. Obtain .gtf file

You should already have downloaded this. Look in the directory `PROJ02_ce11BuildIndices` and in your file called `path.txt`. This will tell you where your .gtf file path is. Double-check it is correct.

Keep note of this path name.

## 3. Learn how to write the featureCounts line of code

Let's tabulate our two tester .sam files together into a counts.txt file using featureCounts.
- gather the required input
- ensure featureCounts can run
- execute the run

What input do we need?

**featureCounts Usage:**

```
USAGE:
featureCounts [options] input_file1.sam [input_file2.sam] ... 
 
OPTIONS:
     -p                     # paired-end sequencing   #Default is for single-end
     -T <number>            # number of threads (use ${SLURM_NTASKS})
     -a <annotation_file>   # this will be your .gtf file (use the path link you wrote down)
     -o <output_file.txt>   # choose an output file name (../03_output/GomezOrte_feature_counts.txt)
```

Perform this exercise in the same `PROJ01_GomezOrte` directory as before.
- Navigate to your `02_scripts` sub-directory
- Start a new script called `tabulateCounts.sbatch`
- Copy the following into your script file:

```
#!/usr/bin/env bash
 
#SBATCH --job-name=tabulate 
#SBATCH --nodes=1                        # this script is designed to run on one node
#SBATCH --ntasks=4                       # how many cores you want to use (up to 24)
#SBATCH --time=00:29:00                  # how much time to request
#SBATCH --partition=shas-testing         # modify this to reflect which queue you want to use 
#SBATCH --qos=testing                    # modify this to reflect which queue you want to use
#SBATCH --output=log_tabulate_%j.txt     # capture  output in a logfile with %j as jobID
 
# Write your line of code here
featureCounts
```

Now modify it to make it work. It can look something like this...

```
#!/usr/bin/env bash

#SBATCH --job-name=tabulate 
#SBATCH --nodes=1                        # this script is designed to run on one node
#SBATCH --ntasks=4                       # how many cores you want to use (up to 24)
#SBATCH --time=00:29:00                  # how much time to request
#SBATCH --partition=shas-testing         # modify this to reflect which queue you want to use 
#SBATCH --qos=testing                    # modify this to reflect which queue you want to use
#SBATCH --output=log_tabulate_%j.txt     # capture  output in a logfile with %j as jobID

# Tabulate alignments
featureCounts -p -T ${SLURM_NTASKS} \
-a ../../PROJ02_ce11IndexBuild/ce11_annotation_ensembl_to_ucsc.gtf \
-o ../03_output/GomezOrte_feature_counts.txt \
../03_output/EG01.sam ../03_output/EG02.sam ../03_output/EG03.sam
```

**Questions:** 
- What is the featureCounts output? Where is it? Explore the output.
- How many reads were successfully mapped? How many alignments were unsuccessfully assigned to a gene? How long did it take?

**NOTE:** 
- featureCounts does not use multi-mapping reads in the final tabulation. All reads must be uniquely mapped to be counted.
- For fastp and hisat2, we used loops to run each sample separately. However, for featureCounts, all the samples are combined together into a single line of code. So, if you have 8 samples, fastp will run 8x times, then hisat2 will run 8x times, but featureCounts will only run once. When featureCounts runs, it will merge all the samples together.
