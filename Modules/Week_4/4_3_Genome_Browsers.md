# Genome Browsers

Genome browsers are software that allow you to display RNA-seq or other genomics data. There are many genome browsers available to you to use.

My lab uses **UCSC Genome browser**, a website. Sadly, UCSC Genome browser doesn't have all genomes available. Also sad, using UCSC Genome browser requires a public-facing, HTTP-viewable file space. If you or your lab is interested in setting this up, please contact your IT folks (CNS-IT for the College of Natural Sciences). Even more sad - there is a current conflict with CSU's firewall that is creating a bug.

Another option is **IGV - Integrative Genomics Viewer**. IGV comes in a web app form and a downloadable form. The downloadable form has more customization options (bonus material below). Today we'll walk through the web app form of IGV to give you a sense of how to use the software.

[IGV](https://igv.org/)

## Visualizing data using the IGV Web App

### Prepping .bw files for upload

- Behind the scenes, downloaded all the .bw files.
- Merged them together using this script: [merge_bw script](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/merge_bw_script.md)
- Placed the merged files in an http-viewable location.
- Used UCSC Genome Browser's **upload tracks** to link to my files.

### Exercise 

**Obtain the data** 

- Download this compressed directory of merged bigwig files and our original .gtf file: 
- Uncompress by double-clicking.

**Go to IVG-Web** 

- Navigate to [IGV App](https://igv.org/app/)
- The human genome is loaded by default. To switch to C. elegans, let's go to the **Genome** menu tab.
- Typically, I would recommend selecting **Local file** and having you upload the exact fasta file and .gtf file that you used for your RNA-seq analysis. In the interest of time and because we downloaded everything from UCSC, we can do select **UCSC GenArk**...

<p align="center">
<img width="700" alt="igv screenshot" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/IGV-screenshot.png">
</p>

- Search for “elegans” and pick the one for “roundworm”.

**Upload your tracks** 

- To add new tracks, go to **Tracks** and **Local File**...
  - Select ALL your files - all the _merged.bw files and the .gtf file.

**Customize the look and feel** 

- **Group Autoscale**
- The most important thing is to link your tracks so they scale their y-axes together. This allows you to compare their heights. If you don't do this, the default is to set the “tallest” point in the field of view to the max height.
- Click on **Select Tracks**. It's a button on the top right.
- Click on all square boxes to the left of each .bw track
- Click on the gear icon (settings icon) to the right of ANY one of the .bw tracks.
- Click on **Group Autoscale**
- Unselect **Select Tracks**

<p align="center">
<img width="700" alt="igv screenshot 2" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/IGV-screenshot2.png">
</p>

**Change the colors**

- Click on **Select Tracks**
- Click on all square boxes to the left of all the **B.Subtilis** samples
- Click on the gear icon (settings icon) to the right of any B.Subtilis sample.
- Click on **Set track color**.
- A color box will pop up but sometimes it is lower down and you'll need to scroll down to find it.
- Pick a color.
- Unselect **Select Tracks**

**Change the order**
- If you hover over the “tab” or “flap” looking icon to the right of any track, it will turn a darker grey
- Drag and drop this tab to move the track up or down.
- Arrange your tracks how you prefer

<p align="center">
<img width="700" alt="igv screenshot 3" src="">
</p>

