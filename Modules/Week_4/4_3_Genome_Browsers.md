# Genome Browsers

Genome browsers are software that allow you to display RNA-seq or other genomics data. There are many genome browsers available to you to use.

My lab uses **UCSC Genome browser**, a website. Sadly, UCSC Genome browser doesn't have all genomes available. Also sad, using UCSC Genome browser requires a public-facing, HTTP-viewable file space. If you or your lab is interested in setting this up, please contact your IT folks (CNS-IT for the College of Natural Sciences). Even more sad - there is a current conflict with CSU's firewall that is creating a bug.

Another option is **IGV - Integrative Genomics Viewer**. IGV comes in a web app form and a downloadable form. The downloadable form has more customization options (bonus material below). Today we'll walk through the web app form of IGV to give you a sense of how to use the software.

[IGV](https://igv.org/)

## Visualizing data using the IGV Web App

### Prepping .bw files for upload

- Behind the scenes, downloaded all the .bw files.
- Merged them together using this script: [merge_bw script](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/merge_bw_script.md)
- Placed the merged files in an http-viewable location (i.e., [Galaxy server](https://usegalaxy.org/))
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
<img width="700" alt="igv screenshot 3" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/IGV-screenshot3.png">
</p>

**Navigate the browser**

- Check out cool genes
- In the box that contains the chromosome name and coordinates, you can type in elements you want to search for.
- Try typing in: cpr-4, clec-47, zip-10, swt-6, asp-6
- Zoom in or out using the - to + scale on the far top right
- Scootch the browser using drag and drop behavior

<p align="center">
<img width="700" alt="igv screenshot 4" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/IGV-screenshot4.png">
</p>

**Try downloading an image file:**

- Click on **Save Image**
- Save a picture or vector file. Note - these vector files don't behave well for me.

## Bonus Take-Home Content 

### Visualizing data using UCSC Genome Browser

Info can be found here: [UCSC Genome Browser User's Guide](https://genome.ucsc.edu/goldenpath/help/hgTracksHelp.html)

### Visualizing data using IGV

IGV (Integrated Genome Viewer) is a stand-alone, downloadable program you can use to browse your RNA-seq generated genomics files.

[https://igv.org/doc/desktop/](https://igv.org/doc/desktop/)

#### Prepping .bw files for upload 

As part of the `RNAseq_analyzer.sh` pipeline, I wrote in steps to convert .sam files to sorted .bam files and to generate .bam index files.

- **file.sam –> file.bam** This compresses the .sam file into a binary file
- **file.bam –> file_sort.bam** This sorts the .bam file by chromosome location
- **file_sort.bam.bai** This makes a simple indexing reference file for the sorted .bam file
- **file.bam –> file.bw** This creates a bigwig file

These files can be downloaded from your location on summit (direct download, rsync, or cyberduck). They can then be opened with IGV.

First, we'll go through how to do this using IGV.

### IGV Exercise

- From the drop-down menu, select `C. elegans (ce11)`
- From JupyterHub, download `EG01_sort.bam` and `EGO01_sort.bam.bai`. You can do this by navigating to these files in the file structure, **right-clicking** on them, and selecting **Download**.
- In IGV: From **File**, select Load from File
- Within elect your EGO01_sort.bam file, making sure that the file EGO01_sort.bam.bai is located in the same directory.
- Repeat the process for one or two other samples.

**A cautionary note about .bam files and scaling**

You can not compare the heights of any genome browser plots until you have normalized their heights. This is because the height of each plot is proportional to the number of fragments that were sequenced overall. Until you normalize, .bam files from samples that were sequenced to 50 million reads will look twice as tall as those sequenced to 25 million reads.

**To normalize the samples:**

- Go to **View**
- Go to **Preferences**
- Go to **Tracks**
- Go to **Normalize Coverage Data**
- Click on **Normalize Coverage Data**
- Navigate to the **SAVE** box that is typically not visible at the bottom of the window.
- Click **SAVE**

**To remove autoscaling**

- Right click on the header for the track called **sample01_sort.bam Coverage**
- Unclick **autoscale**
- Click on **Set Data Range...**
- Select the desired height

**Exercise**

- Play around with the browser.
- Check out cool genes: gst-7, nex-1,
- Read about interesting genes you find.

[DESeq2]()
