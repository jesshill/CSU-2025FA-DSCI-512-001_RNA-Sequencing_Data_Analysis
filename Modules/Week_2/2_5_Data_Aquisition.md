# Data Acquisition

Let's go ahead and log into [ALPINE](https://ondemand-rmacc.rc.colorado.edu) if you're not already logged in:

Let's go ahead and load the sra-toolkit module.

**Once there:**

```
$ acompile --time=2:00:00
$ module load sra-toolkit
```

How do we obtain RNA-seq data?

Data for different projects is stored and housed in repositories. The most common repositories are **NCBI GEO** (National Center for Biotechnology Information, [Gene Expression Omnibus](https://www.ncbi.nlm.nih.gov/geo/), organized by the NIH) and the [NCBI SRA (Short Read Archive)](https://www.ncbi.nlm.nih.gov/sra).

Not every project uses the NCBI repositories. Individual projects (NASA, ENCODE, etc) sometimes design their own repositories as part of their research project.

When you publish your own RNA-seq data, you will be required by the journal to deposit all your data in a repository, sometimes prior to submitting the manuscript for review. You can submit the data to the repository in an **embargoed** format. That is, the data will be hidden and password protected so that manuscript reviewers can access it, and then the password protection will be lifted once the manuscript is published.

- It is your responsibility as an author to upload the data to the repository and provide the **reviewer link** to the journal when you submit your manuscript.
- It is your responsibility as the author to contact NCBI when your paper is **published** and assist them in lifting the embargo and linking the repository to the published work.

## Resources

[SRA-Tools - fasterq-dump](https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump)

## Obtain the Gomez-Orté Dataset Information

**!!! Exercise:** Let's download one of the Gomez-Orté files together.

- **First**, I consult the Gomez-Orté manuscript: [Gomez-Orté et al., 2017](https://pmc.ncbi.nlm.nih.gov/articles/PMC5839384/)
- **Second**, I search for **GEO** or **GSE** in the document and find this reference in the materials and methods section: 

<p align="center">
<img width="700" alt="GEO info" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/GEO_info.png">
</p>

- **Third**, I google search **GSE101524** to find its NCBI GEO Entry: [GSE101524](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE101524).
  - Go ahead and navigate to that page and explore the content.
  - There are 18 samples to download (each link to their own description page)
  - There is additional information about the experiment.
- **Fourth**, we want to link to the SRA repository data by clicking on SRA Run Selector at the bottom of the page, here:

<p align="center">
<img width="700" alt="data aquisition" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/data_acquisition.png">
</p>

## Test the SRA-Toolkit

Let's test that sra-tools is working

```
$ module load sra-toolkit #if you haven't already
$ fasterq-dump --help #test that it works
```

## Download a single file

Say we want to download a single .fastq file from a dataset. We'll use **fasterq-dump** within the **sra-tools** suite of tools to do this.

First, I look up the SRR number of the .fastq file I want to download. Let's pick the first on this SRA Run Selector page.

<p align="center">
<img width="700" alt="SRA" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/SRA.png">
</p>

It's SRR5832182.

**!!! Exercise:** Let's do this together

```
$ mkdir test_download   # Create anew directory within /scratch/alpine/<eID>@colostate.edu/DSCI512/
$ cd test_download      # Navigate into that directory
$ fasterq-dump -e 1 --split-files --progress SRR5832182 # Execute this line of code to download one sample (2x files). This took me 5 minutes for two 1.8 GB files.
spots read      : 5,357,669
reads read      : 10,715,338
reads written   : 10,715,338
 
$ vdb-validate SRR5832182   # check that the files are intact and weren't corrupted during transit.
2021-11-18T14:43:01 vdb-validate.2.11.0 info: Validating '/scratch/alpine/erinnish@colostate.edu/ncbi/sra/SRR5832182.sra'...
2021-11-18T14:43:01 vdb-validate.2.11.0 info: Table 'SRR5832182.sra' metadata: md5 ok
2021-11-18T14:43:01 vdb-validate.2.11.0 info: Column 'ALTREAD': checksums ok
2021-11-18T14:43:02 vdb-validate.2.11.0 info: Column 'QUALITY': checksums ok
2021-11-18T14:43:02 vdb-validate.2.11.0 info: Column 'READ': checksums ok
2021-11-18T14:43:02 vdb-validate.2.11.0 info: Column 'X': checksums ok
2021-11-18T14:43:02 vdb-validate.2.11.0 info: Column 'Y': checksums ok
2021-11-18T14:43:02 vdb-validate.2.11.0 info: Table 'SRR5832182.sra' is consistent
 
$ ls
SRR5832182_1.fastq  SRR5832182_2.fastq
```

The line **vdb-validate** automates the process of checking **md5-sums**

**!! Common pitfall:** the number one reason vdb-validate doesn't come out ok - Error on SRA's side. So just stay calm.

## Start a downloads project

**!!! Exercise:** Let's download all the files!

To do this, we can AUTOMATE the process of pulling .fastq files using **fasterq-dump**. Let's do the following...

1. Set up a folder to download the files into
2. Obtain a list of SRR files you want to download from the SRA page
3. Obtain a looped script to automate the download
4. Download!

**1. Set up a folder to download the files into**

```
# Let's go here...
 
$ cd /scratch/alpine/<eID>@colostate.edu # Replace this with your eID
$ cd DSCI512
$ cd PROJ01_GomezOrte # If you have this directory, navigate into it. If you don't have this, go ahead and create it with mkdir
$ cd 01_input
```

**2. Obtain a list of SRR files you want to download from the SRA page**

<p align="center">
<img width="700" alt="SRA pic2" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/SRA_pic2.jpg">
</p>

- Navigate to the Gomez Orte SRA page.
- Click on Accession List
- Download it somewhere on your computer
- Open the file
- Copy and paste the contents of that file into a new file on ALPINE called SRR_Acc_List_GomezOrte.txt (you can use nano to do this).

```
$ more SRR_Acc_List_GomezOrte.txt
SRR5832182
SRR5832183
SRR5832184
SRR5832185
SRR5832186
SRR5832187
SRR5832188
SRR5832189
SRR5832190
SRR5832191
SRR5832192
SRR5832193
SRR5832194
SRR5832195
SRR5832196
SRR5832197
SRR5832198
SRR5832199
```
