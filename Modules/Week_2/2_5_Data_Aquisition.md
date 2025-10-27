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























