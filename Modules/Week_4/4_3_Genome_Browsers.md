# Genome Browsers

Genome browsers are software that allow you to display RNA-seq or other genomics data. There are many genome browsers available to you to use.

My lab uses **UCSC Genome browser**, a website. Sadly, UCSC Genome browser doesn't have all genomes available. Also sad, using UCSC Genome browser requires a public-facing, HTTP-viewable file space. If you or your lab is interested in setting this up, please contact your IT folks (CNS-IT for the College of Natural Sciences). Even more sad - there is a current conflict with CSU's firewall that is creating a bug.

Another option is **IGV - Integrative Genomics Viewer**. IGV comes in a web app form and a downloadable form. The downloadable form has more customization options (bonus material below). Today we'll walk through the web app form of IGV to give you a sense of how to use the software.

[IGV](https://igv.org/)

## Visualizing data using the IGV Web App

### Prepping .bw files for upload

- Behind the scenes, I downloaded all the .bw files.
- I merged them together using this script: merge_bw script
- I placed the merged files in an http-viewable location.
- I used UCSC Genome Browser's **upload tracks** to link to my files.

### Exercise 

**Obtain the data** 

- Download this compressed directory of merged bigwig files and our original .gtf file: 
- Uncompress by double-clicking.

**Go to IVG-Web** 

- Navigate to [IGV App](https://igv.org/app/)
- The human genome is loaded by default. To switch to C. elegans, let's go to the **Genome** menu tab.
- Typically, I would recommend selecting **Local file** and having you upload the exact fasta file and .gtf file that you used for your RNA-seq analysis. In the interest of time and because we downloaded everything from UCSC, we can do select **UCSC GenArk**...


