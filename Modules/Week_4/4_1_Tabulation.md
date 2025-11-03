# Tabulation Using featureCounts

Today, let's begin by logging into alpine and checking how far we got before the break.

Refresher: 
- Navigate to [https://ondemand-rmacc.rc.colorado.edu/](https://ondemand-rmacc.rc.colorado.edu/)
- Login, then do the following...

```
$ acompile --time=2:00:00
$ conda env list 
$ conda activate <envName>
$ cd /scratch/alpine/<eID@colostate.edu>
```

- Next, navigate into your project folder, and the latest output folder.

Do you have the following? 

```
$ pwd
/scratch/alpine/jesshill@colostate.edu/2025_DSCI512/PROJ01_GomezOrte/03_output
$ ls 2024-11-21_output/03_feature/
EG01_counts.txt          EG04_counts.txt          EG07_counts.txt          EG10_counts.txt          EG13_counts.txt          EG16_counts.txt
EG01_counts.txt.summary  EG04_counts.txt.summary  EG07_counts.txt.summary  EG10_counts.txt.summary  EG13_counts.txt.summary  EG16_counts.txt.summary
EG02_counts.txt          EG05_counts.txt          EG08_counts.txt          EG11_counts.txt          EG14_counts.txt          EG17_counts.txt
EG02_counts.txt.summary  EG05_counts.txt.summary  EG08_counts.txt.summary  EG11_counts.txt.summary  EG14_counts.txt.summary  EG17_counts.txt.summary
EG03_counts.txt          EG06_counts.txt          EG09_counts.txt          EG12_counts.txt          EG15_counts.txt          EG18_counts.txt
EG03_counts.txt.summary  EG06_counts.txt.summary  EG09_counts.txt.summary  EG12_counts.txt.summary  EG15_counts.txt.summary  EG18_counts.txt.summary
```

- If YES, great!
- If NO, raise your hand and let me know please.

Once you have your output files, let's save our logfiles into their own directory...

```
# Navigate to your scripts folder:
$ pwd
/pl/active/onishimura_lab/ERIN/COURSES/2024_testing/PROJ01_GomezOrte/02_scripts
$ ls
$ mkdir 241121_logfiles
$ mv *.out 241121_logfiles
$ ls
```

## References

- [FeatureCounts online manual](https://subread.sourceforge.net/featureCounts.html)
- [FeatureCounts publication](https://pubmed.ncbi.nlm.nih.gov/24227677/) (Liao et al., Bioinformatics, Volume 30, Issue 7, 1 April 2014, Pages 923–930.)

## Review 

<p align="center">
<img width="700" alt="course pipeline" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/course_pipeline.jpg">
</p>

**What happened during Alignment?**

What software did we use for alignment?  hisat2

What did we get out of it?   summary files and .sam files

HISAT2 takes as input **.fastq files** and **genome indexes** and produces a **.sam** (Sequence Alignment Map) file as output. There is one .sam file for each pair of paired-end .fastq files. It also gives us a report.

Let's peek in a summary file. It should be located within `03_output/<date>/02_hisat2`:

```
$ more EG01_summary.txt
5353080 reads; of these:
  5353080 (100.00%) were paired; of these:
    139104 (2.60%) aligned concordantly 0 times
    5083972 (94.97%) aligned concordantly exactly 1 time
    130004 (2.43%) aligned concordantly >1 times
    ----
    139104 pairs aligned concordantly 0 times; of these:
      3860 (2.77%) aligned discordantly 1 time
    ----
    135244 pairs aligned 0 times concordantly or discordantly; of these:
      270488 mates make up the pairs; of these:
        164326 (60.75%) aligned 0 times
        103380 (38.22%) aligned exactly 1 time
        2782 (1.03%) aligned >1 times
98.47% overall alignment rate
```

- **Aligned concordantly** - the forward and reverse reads aligned, one with the sense & one with the anti-sense strands.
- **Aligned discordantly** - both the forward and reverse aligned but the stranding doesn't make sense (ie: they're both pointed the same direction).
- **0 times** - either the forward or the reverse strand or both didn't align. Split them up and try again.
- **Multiple alignments** - some pairs map to more than one location. This often happens when there are repetitive regions within a genome. What happens then? HISAT2 keeps track of the primary location which is the location to which the pair maps with the highest possible alignment score. By default, HISAT2 will keep 2 primary alignments. You can change this option with -k. You can also tell HISAT2 to keep secondary alignments with –secondary. Now that our sequence reads are so long (150 bp x 2 = 300 bp) there are typically at least a few nucleotides that can distinguish repetitive reads.

Let's peek in a .sam file. It should be located somewhere in your directory `03_output`:

```
$ more EG01.sam
(dsci512) [erinnish@colostate.edu@shas0137 02_hisat2]$ more EG01.sam 
@HD     VN:1.0  SO:unsorted
@SQ     SN:chrI LN:15072434
@SQ     SN:chrII        LN:15279421
@SQ     SN:chrIII       LN:13783801
@SQ     SN:chrIV        LN:17493829
@SQ     SN:chrM LN:13794
@SQ     SN:chrV LN:20924180
@SQ     SN:chrX LN:17718942
@PG     ID:hisat2       PN:hisat2       VN:2.2.1        CL:"/projects/erinnish@colostate.edu/software/anaconda/envs/dsci512/bin/hisat2-align-s --wrapper basic-0 -x /scratch/summit/erinnish@colostate.edu/DSCI512/PROJ02_ce11IndexBuild/ce11 --summary-file ../03_output/2020-11-19_output/02_hisat2/EG01_summary.txt -p 10 --passthrough --read-lengths 101,92,99,96,91,100,93,90,95,98,97,88,87,94,89,86,81,80,68,46,83,79,76,75,74,73,70,66,65,59,58,53,50,43,41,39,34,32 -1 ../03_output/2020-11-19_output/01_fastp/EG01/EG01_trim_1.fastq -2 ../03_output/2020-11_19_output/01_fastp/EG01/EG01_trim_2.fastq"
SRR5832182.4    99      chrIII  10215997        60      101M    =       10216103        207     GGCGACTCCACGAGCATAAGCTCCGGCGAATTTGCTTTCATTGTTCAAAGCAGCGATAGCGGCGATGAATTGAGCCATTGGATGGAGGTTATCTGGGAAGT   DDDDDHIIIIIIIIIIIIIIIIIIIIIIIHHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIHIHIIIIIIIIIIIIIIH   AS:i:0 XN:i:0  XM:i:0  XO:i:0  XG:i:0  NM:i:0  MD:Z:101        YS:i:0  YT:Z:CP NH:i:1
SRR5832182.4    147     chrIII  10216103        60      101M    =       10215997        -207 AGCATTCGGACAACGTGGGTTGGAAGATCGGCACGGGCGTTCCATTCTTTTGTGATAGCGGCAGTCTGGGCCTCGGATGGAACATCTCCTGTACACAAAAG FIIIIHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIHIIIIIIIIDDDDD AS:i:0 XN:i:0  XM:i:0  XO:i:0  XG:i:0  NM:i:0  MD:Z:101        YS:i:0  YT:Z:CP NH:i:1
```

Yikes! That looks crazy.

- Basically, all you need to remember is that the .sam file will retain the sequence and quality scores of any reads that align to the genome. It will add to that information the location in the genome where the pair of (or individual) read(s) map.
- [.sam format - wikipedia](https://en.wikipedia.org/wiki/SAM_(file_format))
- [.sam lookup FLAG app](https://broadinstitute.github.io/picard/explain-flags.html) - each pair of reads, if mapped, will be given a code called a “FLAG”. Enter the FLAG # in this little app to decipher the code.
- A .bam (Binary Alignment Map) file is a compressed .sam file. Think of it as a zipped file.

**Warning!** 
- .sam files are huge! They take up a lot of space.
- For today we'll keep our .sam files, but eventually, we will want to compress them into .bam files to reduce the amount of space these files take up. That is where our cleanup script will come in.

## Intro to tabulation with featureCounts

The next step in our pipeline is to **tabulate the number of reads that map to each gene using featureCounts**.

**featureCounts** simply counts the number of reads that fall within the limits of each “feature”.

**!!! EXERCISE:** How would you design a read-counting program to assign reads to different features? What would you consider to be a “feature”? Would it be an exon, a gene, or a transcript?

<p align="center">
<img width="700" alt="htseq problem" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/htseq_problem.jpg">
</p>

How would you assign reads to features?

## The featureCounts approach

**featureCounts** solves this problem by only counting reads if they can uniquely be mapped to a single gene.

featureCounts has two levels of feature organization. **meta-features** are genes. **features** are exons. Each gene has multiple exons. Each exon is associated with only one gene.

“We recommend that reads or fragments overlapping more than one gene are not counted for RNA-seq experiments because any single fragment must originate from only one of the target genes but the identity of the true target gene cannot be confidently determined.” = Liao et al., 2014.

The featureCounts algorithm takes the following input and gives you the following output...

**featureCounts input:**

- .bam/.sam files. Also known as an alignment file.
- a .gtf/.gff annotation file for your genome

**featureCounts output:**

a counts.txt file containing count data for the entire experiment
a summary file for the entire experiment

What will the counts file look like?

- The counts file merges multiple .sam files into one counts.txt file:

```
GeneID     Chr     Start   End     Strand  Length  EG01.sam  EG02.sam.  EG03.sam 
Gene1      chrI    1234    1345    +       1324     0         0          0 
Gene2      chrI    2345    3456    +       2345     2345      1021       3452 
Gene3      chrI    5456    8467    +       1234     234       134        234 
```

- Note, these counts files are **digital**
- The reads per gene are not normalized. If you ordered or received more sequencing for one sample, the gene will have more reads associated with it for that sample.
- The reads per gene will need to be **normalized to account for read depth**. We will do this later in DESeq2.
- Just know that at this stage, you can't **eyeball** to see whether some gene is over-expressed in some sample.

**!! NOTE** For our previous steps, like fastp and hisat2, we operated on each sample individually. So, if we have 18 samples in our dataset, the goal would be to run fastp 18 times, once for each sample. featureCounts is different. In this step, we will **merge** together all the samples. We will only run featureCounts once and that single step will take ALL the samples as input. *Here is a visual summary of that concept:*

<p align="center">
<img width="700" alt="feature counts idea" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/featurecounts_idea.jpg">
</p>

**featureCounts Usage:**

For more detail on featureCounts usage, there is a link to a tutorial at the end of this section. Briefly,

```
USAGE:
featureCounts [options] input_file1.sam [input_file2.sam] ... 
 
OPTIONS:
     -p                     # paired-end sequencing   #Default is for single-end
     -T <number>            # number of threads (use ${SLURM_NTASKS})
     -a <annotation_file>   # this will be your .gtf file (use the path link you wrote down)
     -o <output_file.txt>   # choose an output file name (../03_output/GomezOrte_feature_counts.txt)
```

**Questions:** What is the featureCounts output? Where is it? Explore the output.

**Questions:** How many reads were successfully mapped? How many alignments were unsuccessfully assigned to a gene? How long did it take?

**NOTE:** featureCounts does not use multi-mapping reads in the final tabulation. All reads must be uniquely mapped to be counted.

**NOTE:** For fastp and hisat2, we used loops to run each sample separately. However, for featureCounts, all the samples are combined together into a single line of code. So, if you have 8 samples, fastp will run 8x times, then hisat2 will run 8x times, but featureCounts will only run once. When featureCounts runs, it will merge all the samples together.

## One last task - Merge the Feature Counts files 

One last thing to do is to merge the featureCounts output files together into a single file that the DESeq2 R software can use.

To do this... 

- Navigate to our 02_scripts folder and locate the small script called `merge_counts_files.sh`.
- Open `merge_counts_files.sh` in a text editor
- Edit the section called `MODIFY THIS SECTION` to fit your output folder date and your metadata file.

```
#!/usr/bin/env bash
 
################################################
# PROGRAM:
# merge_counts_files.sh
#
# DESCRIPTION:
# Run this at the end to merge all your counts files together
#
# AUTHOR:
# Erin Osborne Nishimura
#
# START DATE:
# November 19,2024
#
#
# Usage statement: 
# bash merge_counts_files.sh
 
########################
# MODIFY THIS SECTION
########################
 
#Select the proper date for the output file you'd like to merge:
day=`date +%Y-%m-%d`
#OR
#day='2024-11-20'
 
 
# Select the metadata file. Replace <metadata.txt> with your metadata path and file. 
# Mine looks like: metadata=../01_input/metadata_gomezOrte.txt
metadata=<metadata.txt>
```

- Next, run the code with a quick shell line... 

```
$ bash merge_counts_files.sh
```

- Check within the 03_featureCounts subdirectory that there is now a merged file called `2024-11-<day>_merged_counts.txt`
- Download the merged file to your local computer...

<p align="center">
<img width="700" alt="old screen shot" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/old_screenshot.png">
</p>

- Download your metadata file to your local computer, too. 


## Bonus content...

<details>
  <summary>featureCount detailed instructions</summary>

---

Content here

---

</details>
