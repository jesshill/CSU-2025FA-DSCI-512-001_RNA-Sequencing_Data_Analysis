# Assignment #4

- Due Thursday, December 4, 2025, 11:59 pm.
- Turn in on canvas.

## Download RNA-seq .fastq files from SRA or some other data repository

**! Start a README file** - write down in the Readme file everything you do in this section.

**! README file**

- Write a few introductory sentences to state your goal. Are you uploading your own data? Are you obtaining data from SRA short read archive? Write a brief sentence on what the dataset is including the organism.
- This file should be dated
- Any downloads should be described with a URL link
- The directory where you worked should be recorded
- You don't need to copy and paste all commands, but you need to write where these commands are kept (script names, etc)
- There should be some assessments and personal reflection - “This worked; This didn't work; etc”

**!!! Exercise**

- Download the dataset you will use for your **Final Project**.
  - Remember, you can choose to use 1) your own data, 2) a published dataset in your field, 3) any of the suggested datasets below and listed in [Reading #2](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Home_Work/Reading_2.md).
- Download the dataset (or a portion of it) to your scratch space on ALPINE.
- To do this, follow the instructions laid out in [Data Acquisition](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Modules/Week_2/2_6_Data_Aquisition.md).

**!!! Metadata File**

- Create a Metadata file as a tab-delimited .txt file for your dataset.
- The Metadata document should be in the form:

| Column | Contents | Example |
| ------ | -------- | ------- |
| 1	| 1st .fastq file	| SRR5832182_1.fastq |
| 2 |	2nd .fastq file	| SRR5832182_2.fastq |
| 3 |	A short name for each sample - short alphnumeric sorting numbers & letters	| EG01 |
| 4 |	A long name for each sample - with condition info	| 01_Ecoli_15_1 |
| 5	| condition #1	| Ecoli |
| 6	| condition #2 ( the number of conditions you have will determine how many total column you will have	| 15 |
| 7	| replicate #	| 1 |

- Turn in your Metadata file for your homework.

Example:

```
SRR5832182_1.fastq      SRR5832182_2.fastq      EG01    01_Ecoli_15_1   Ecoli   15      1
SRR5832183_1.fastq      SRR5832183_2.fastq      EG02    02_Ecoli_15_2   Ecoli   15      2
SRR5832184_1.fastq      SRR5832184_2.fastq      EG03    03_Ecoli_15_3   Ecoli   15      3
SRR5832185_1.fastq      SRR5832185_2.fastq      EG04    04_Ecoli_20_1   Ecoli   20      1
SRR5832186_1.fastq      SRR5832186_2.fastq      EG05    05_Ecoli_20_2   Ecoli   20      2
SRR5832187_1.fastq      SRR5832187_2.fastq      EG06    06_Ecoli_20_3   Ecoli   20      3
SRR5832188_1.fastq      SRR5832188_2.fastq      EG07    07_Ecoli_25_2   Ecoli   25      1
SRR5832189_1.fastq      SRR5832189_2.fastq      EG08    08_Ecoli_25_1   Ecoli   25      2
SRR5832190_1.fastq      SRR5832190_2.fastq      EG09    09_Ecoli_25_3   Ecoli   25      3
SRR5832191_1.fastq      SRR5832191_2.fastq      EG10    10_Bsubtilis_15_1       Bsubtilis       15      1
SRR5832192_1.fastq      SRR5832192_2.fastq      EG11    11_Bsubtilis_15_2       Bsubtilis       15      2
SRR5832193_1.fastq      SRR5832193_2.fastq      EG12    12_Bsubtilis_15_3       Bsubtilis       15      3
SRR5832194_1.fastq      SRR5832194_2.fastq      EG13    13_Bsubtilis_20_1       Bsubtilis       20      1
SRR5832195_1.fastq      SRR5832195_2.fastq      EG14    14_Bsubtilis_20_2       Bsubtilis       20      2
SRR5832196_1.fastq      SRR5832196_2.fastq      EG15    15_Bsubtilis_20_3       Bsubtilis       20      3
SRR5832197_1.fastq      SRR5832197_2.fastq      EG16    16_Bsubtilis_25_1       Bsubtilis       25      1
SRR5832198_1.fastq      SRR5832198_2.fastq      EG17    17_Bsubtilis_25_2       Bsubtilis       25      2
SRR5832199_1.fastq      SRR5832199_2.fastq      EG18    18_Bsubtilis_25_3       Bsubtilis       25      3
```

**!!!** If you are using your own data that you already have, upload your dataset to ALPINE and describe how you did this.

**!!!** If your dataset is not accessible through an SRA link, but uses some other data distribution strategy, just follow the instructions to obtain the data and report what you did to get it onto ALPINE. This may require downloading data to your local computer and then uploading that to ALPINE.

**!!!** More tips on uploading data to ALPINE. Sometimes, it can be frustrating to upload several large datasets to ALPINE using the upload icon (up arrow) on Jupyter Hub. In these cases, using dedicated sFTP software can work much more smoothly.

### Turn in the answers to the following questions

1) Turn in your README file as its own .txt file.

2) Turn in your metadata file as a .txt file.

### Options

*Yeast*

[Dong Y, Hu J, Fan L, and Chen Q. (2016) RNA-seq-based transcriptomic and metabolomic analysis reveal stress responses and programmed cell death induced by acetic acid in Saccharomyces cerevisiae. Scientific Reports. 7:4.](https://www.nature.com/articles/srep42659)

- 12 files
- 8 - 12 minutes download per file

*Arabidopsis* 

[Herranz, Vandenbrink, Villacampa, Manzano, Poehlman, Feltus, Kiss, and Medina. (2019) RNAseq Analysis of the Response of Arabidopsis thaliana to Fractional Gravity Under Blue-Light Stimulation During Spaceflight. Front Plant Sci. 2019 Nov 26;10:1529.](https://www.frontiersin.org/journals/plant-science/articles/10.3389/fpls.2019.01529/full)

- This is a pretty big dataset. I suggest just using a low-gravity & high gravity conditions.
- This download's from a NASA-managed site, not from SRA. You'll need to download the data to your local computer and then upload it to ALPINE manually.
- Go to “Study Files” and download “Raw Sequence Data” appropriate for the conditions you select to study.

[Park et al., (2019) The transcriptome analysis of the Arabidopsis thaliana in response to the Vibrio vulnificus by RNA-sequencing. PLoS One. 2019 Dec 16;14(12):e0225976.](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0225976)

- Roughly 15 minutes per sample
- 10 samples

*Mouse*

[Brady RA, Bruno VM, Burns DL. (2015) RNA-Seq Analysis of the Host Response to Staphylococcus aureus Skin and Soft Tissue Infection in a Mouse Model](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0124877)

- Suggest just focusing on the Day 7 data. Even that took about 8 hrs to download.

[Tuipulotu, Netzler, Lun, Mackenzie, and White1. (2017) RNA Sequencing of Murine Norovirus-Infected Cells Reveals Transcriptional Alteration of Genes Important to Viral Recognition and Antigen Presentation. Front. Immunol. 11 August](https://pubmed.ncbi.nlm.nih.gov/28848558/)

- This dataset is large. Just work on a subset of the samples
- Some samples may be organized into multiple small files that will need to be merged together
