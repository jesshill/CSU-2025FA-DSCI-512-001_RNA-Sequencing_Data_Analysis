# Alignment How To 

How to align samples using HISAT2

### Resources: 

- [HISAT2](https://daehwankimlab.github.io/hisat2/)
- [HISAT2 Web Manual](https://daehwankimlab.github.io/hisat2/manual/)

Here are the steps we need to do to write a line of HISAT2 code:
- First, gather input files and information
- Second, ensure the software can be executed
- Third, write the line of code

## 1. gather input files and information

- Here is the HISAT2 Usage. It will tell us the input files we need:

```
hisat2 [options] -x <hisatpath> -1 <file_1.fastq> -2 <file_2.fastq> -S <outputfilename.sam> 
 
Required input:
  -x </hisatpath/prefix>          # hisatpath is the path to the location of the hisat2 indexes (~/PROJ02_ce11IndexBuild in our case).
                                  # prefix is the name of the hisat2 indexes (ce11, in our case)
                                  # This path and prefix should be in the paths.txt file your wrote earlier
  -1 <file_1.fastq>               # this is the forward .fastq file 
  -2 <file_2.fastq>               # this is the reverse .fastq file
  -S <outputfilename.sam>         # this will be the name of the outputfile

Options:
  --summary-file <summaryfilename.txt>   # Print out a summary
  --no-unal                              # Suppress SAM records for reads that failed to align
  -p <numbers of threads>                # number of cores to use. can automatically be pulled out of the header region using ${SLURM_NTASKS}
```

- For testing purposes, use small tester files that are trimmed. For this example, they will be: EG01_trim_1.fastq and EG01_trim_2.fastq

## 2. ensure the software can be executed

- This exercise will be performed in the same `PROJ01_GomezOrte` directory.
- Navigate to your `02_scripts` sub-directory
- Start a new script called `alignReads.sbatch`
- Copy the following into your script file:

```
#!/usr/bin/env bash
 
#SBATCH --job-name=hisat2_align 
#SBATCH --nodes=1                        # this script is designed to run on one node
#SBATCH --ntasks=4                       # how many cores you want to use (up to 24)
#SBATCH --time=00:20:00                  # how much time to request
#SBATCH --qos=amilan                   # modify this to reflect which queue you want to use.
#SBATCH --output=log_align_%j.txt        # capture  output in a logfile with %j as jobID
 
# hisat2 command
hisat2
```

- Test your code using:

```
$ sbatch alignReads.sbatch
$ squeue -u $USER
$ scheck
$ sa
$ more log_align_<jobID>.txt
```

- The output should be the usage instructions for hisat2. If you see this, hooray! You are able to execute the code.

## 3. write the line of code

- Write a line of HISAT2 code that will align one of your pairs of `_trim_1.fastq` and `_trim_2.fastq` files to the ce11 indexes.
- Choose an output names that makes sense based on your meta-data file (EG01.sam, etc)

*Clues:*

- Try to incorporate ${SLURM_NTASKS} into your code.
- How would you put the output files (.sam and _summary.txt files) in your output folder instead of in the current working directory?

*Hints:*

- How do I know if it worked?
  - If your alignment (HISAT2) run worked properly, you should have...
    - An EG01.sam file (in the output directory you specified)
    - An EG01_summary.txt file (in the output directory you specified)
    - Both the EG01_summary.txt file and the log_align_<eID#>.txt file should contain this report:

```
5353080 reads; of these:
  5353080 (100.00%) were paired; of these:
    139102 (2.60%) aligned concordantly 0 times
    5083976 (94.97%) aligned concordantly exactly 1 time
    130002 (2.43%) aligned concordantly >1 times
    ----
    139102 pairs aligned concordantly 0 times; of these:
      3860 (2.77%) aligned discordantly 1 time
    ----
    135242 pairs aligned 0 times concordantly or discordantly; of these:
      270484 mates make up the pairs; of these:
        164324 (60.75%) aligned 0 times
        103378 (38.22%) aligned exactly 1 time
        2782 (1.03%) aligned >1 times
98.47% overall alignment rate
```
  
- A few hints to try
  - **Hint #1**
    - The biggest problem most people have is the option `-x` that specifies the location of the hisat2 indexes. The argument for `-x` is written as follows:

```
hisat2 [options] -x <hisatpath> -1 <file_1.fastq> -2 <file_2.fastq> -S <outputfilename.sam> 
 
Required input:
  -x </hisatpath/prefix>          # hisatpath is the path to the location of the hisat2 indexes (~/PROJ02_ce11Build/ in our case).
                                  # prefix is the name of the hisat2 indexes (ce11, in our case).
```
    - To put this argument together, write the path where your hisat2 indexes live, followed by the prefix of the indexes. Below is an example of using a relative path to the directory `PROJ02_ce11Build` and the prefix ce11 (remember ce and eleven, not the word cell)

```
hisat2 -x ../../PROJ02_ce11Build/ce11
```

  - **Hint #2**
    - This is how I wrote the other options and their arguments
   
| OPTION	| ARGUMENT	| NOTES |
| ------- | --------- | ----- |
| --summary-file | EG01_summary.txt	| Print out a summary log to the local directory |
| --no-unal |  | only add aligned reads to the SAM file. Exclude un-aligned reads from the SAM file |
| -p	| ${SLURM_NTASKS}	| Pull the number of tasks to use from the #sbatch header region | 
| -x	| ../../PROJ02_ce11Build/ce11	| specify the hisat2 indexes as /path/to/indexes/<indexprefix> | 
| -1	| ../03_output/EG01_trim_1.fastq	| use forward trim FASTQ file as input |
| -2	| ../03_output/EG01_trim_2.fastq	| use reverse trim FASTQ file as input | 
| -S	| ../03_output/EG01.sam	| create a SAM file as output |
    
**Final Answer**

```
#!/usr/bin/env bash
 
#SBATCH --job-name=hisat2_align 
#SBATCH --nodes=1                        # this script is designed to run on one node
#SBATCH --ntasks=4                       # how many cores you want to use (up to 24)
#SBATCH --time=00:20:00                  # how much time to request
#SBATCH --qos=atesting                    # modify this to reflect which queue you want to use.
#SBATCH --output=log_align_%j.txt        # capture  output in a logfile with %j as jobID
 
# hisat2 command line
 
hisat2 \
--summary-file EG01_summary.txt \
--no-unal \
-p ${SLURM_NTASKS} \
-x ../../PROJ02_ce11IndexBuild/ce11 \
-1 ../03_output/EG01_trim_1.fastq \
-2 ../03_output/EG01_trim_2.fastq \
-S ../03_output/EG01.sam \
```

**HOT TIP:** using backslashes `\` is a convenient way of splitting a single long line of code into multiple lines for easier reading.

**!!! WARNING:** When using the backslashes `\`, any space characters AFTER the slash will break the code into two lines
