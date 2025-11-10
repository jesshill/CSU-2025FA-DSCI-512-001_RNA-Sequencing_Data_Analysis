# Assignment #5

- Due Thursday, December 4, 2025, 11:59 pm.
- Turn in on canvas.

## Build indexes

**Remember the rules:**

- NO Wheat! No hexaploid, tetraploid, or other complex genomes!
- NO bacteria!
- NO un-characterized genomes!
- Go for model systems if you can or at least organisms that have a .gtf file.
- RNA-seq data must be paired-end!

### Assignment: Build hisat2 indices for a genome

- Select an organism you want to study. If you have already chosen an organism to work on for your final project, select that organism. If you do not yet have an organism selected for your final project, consider one of the projects/organisms suggested in [Reading #2](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Home_Work/Reading_2.md)
- Create a new directory in your summit scratch space where you will build this new hisat2 index
- Use what you learned about downloading genomes in the class to download your genome.
- Build hisat2 indices
- Test that your hisat2 indices are valid using `hisat2-inspect`
- Make sure and create a README document in this directory documenting what you have done.

### Hints:

- For animal and yeast genomes, I recommend either [UCSC genome browser](https://genome.ucsc.edu/) or [Ensembl](https://www.ensembl.org/index.html?redirect=no).
- For plant genomes, try [Phytozome](https://phytozome-next.jgi.doe.gov/) or [Ensemble Plants](https://plants.ensembl.org/index.html), for example: [Ensemble Arabidopsis](https://plants.ensembl.org/Arabidopsis_thaliana/Info/Index)
  - Note: for Ensembl/Ensembl Plants, go to your genome of interest, then click on **Download DNA sequence (FASTA)**

- Note: for Ensembl, here is the instructions for download... [instructions for rsync download](https://www.ensembl.org/info/data/ftp/rsync.html)
- Note: for Ensembl Plants, the instructions are similar to above, but need to include “all” instead of “ensembl” between “org” and “pub”, like so...

```
$ rsync -az rsync://ftp.ensemblgenomes.org/all/pub/release-49/plants/fasta/arabidopsis_thaliana/dna .
```

- Note: For Ensembl/Ensembl Plants, you don't need the 'rm' or 'sm' chromosome files.

### Turn in the answers to the following questions

*Once you have successfully built your hisat2 indices (above), please answer the following questions. Do not turn in the questions in your responses.*

1. HISAT2 Index Builds

- What organism did you build indices for?
- Will you be performing a Final Project using this organism? Briefly, in one sentence or less, describe the project including any links to publications if available. If you are not sure yet, you can just state that.

2. What is the output produced by `hisat2-inspect -s <name>` for your index build? Copy and paste the output as the answer to this question. So, if your build is mm10, what is the output to `hisat2-inspect -s mm10`?

3. Can you find a .gtf or .gff file for your organism? If, so where did you look? If not, what did you already try?

- For more hints on locating .gtf or .gff files, see the 'Get the .gtf file' below...

<details>
  <summary>Get the .gtf file</summary>

---

The .gtf of .gff file is the annotation file that contains the list of all the genes in the genome, their chromosomal coordinates, and which strand they are on. This will be a very important file. Typically, we download this file from UCSC Genome Browser at the same time as downloading the genome (look in the genes folder). However, for whatever reason the UCSC Genome Browser .gtf file had terrible name ID's. It didn't use the name ID's that are typical in the field. For that reason, you can downloaded the C. elegans .gtf file from Ensembl, filter it for only protein coding genes (so it's smaller and faster to use), and then switch the chromosome naming convention so we can use it with the UCSC Genome Browser.

Typically, it is recommended to obtain the .gtf and .gff from the same source to avoid this.

Download the .gtf file.
- Download the [ce11 .gtf file here](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/ce11_annotation_ensembl_to_ucsc.gtf.gz).
- Upload it to ALPINE using the UPLOAD button on the Dashboard
- Download it here, upload it to your ce11 folder
- check md5sums - (md5sum = 466558e94b59e643cad8b89835ec4f12)
- Unzip it

```
$ gunzip ce11_annotation_ensembl_to_ucsc.gtf.gz
```

Write down the .gtf file path in your `path.txt` file:

```
# This directory contains the C. elegans hisat2 indices for ce11.

# The path and prefix of this hisat2 build 
/scratch/alpine/<email>/DSCI512/PROJ02_ce11IndexBuild/ce11

# The path to the whole genome fasta file is:
/scratch/alpine/<email>/DSCI512/PROJ02_ce11IndexBuild/ce11_wholegenome.fa

# The path to the .gtf annotation file is:
/scratch/alpine/<email>/DSCI512/PROJ02_ce11IndexBuild/ce11_annotation_ensembl_to_ucsc.gtf
```

### Additional content about gtf/gff files

- Best practice is to obtain a .gtf file from the same place you obtained the genome file.
- Downloading from UCSC
  - Many of you will download the .gtf file from UCSC Genome Browser. This works well.
  - Go to **Downloads**
  - Select **Download data**
  - Choose your organism
  - Select the genome version and click on something like **Genome sequence files and select annotation**
  - Download the directory called genes
- Example:

```
$ rsync -avzP rsync://hgdownload.cse.ucsc.edu/goldenPath/ce11/bigZips/genes .
```

- You sometimes have options: NCBI, RefSeq, Ensembl. Each specifies the gene name a little differently. Some include ncRNAs. Some only contain protein-coding sequences. Notice they have slightly different content. Largely, most of the genes are the same.

### Downloading .gff files

In principle, you can use a .gff file as input instead of a .gtf file. To do this, just double check that in column 9 of your file, gene ID is specified as **gene_id**. If it is not, you can let featureCounts know, but using `-g`

```
-g 'ID'
or
-g ID=gene:
or 
-g Name
depending on how genes are specified in column #9 of your .gff file
```

"In principle", this should work. It can be buggy, Arabidopsis people found that they needed to convert their downloaded .gff files to .gtf files. To do the conversion, see below...

***.gff to .gtf conversion**

Download the software for [gffread](https://github.com/gpertea/gffread) using their instructions.

An example of how it can be run:
```
gffread <original gff3 filename> -T -o <output gtf file name>
gffread Arabidopsis_thaliana.TAIR10.49.gff3 -T -o gffread_Arabidopsis.gtf
(-T -o option will output GTF format instead of GFF3)
```

Here's some more info on it: [http://manpages.ubuntu.com/manpages/trusty/man1/gffread.1.html](https://manpages.ubuntu.com/manpages/trusty/man1/gffread.1.html)

- You only need to do that if you have a .gff file

---

</details>

4. Let's explore the HISAT2 manual.

- What are the default minimum and maximum intron lengths for HISAT2?
- Do you expect these default settings to be appropriate for your organism?
