# Tabulation How To

How to write a line of featureCounts code.

**NOTE:** For our previous steps, like fastp and hisat2, we operated on each sample individually. So, if we have 18 samples in our dataset, the goal would be to run fastp 18 times, once for each sample. featureCounts is different. In this step, we will merge together all the samples. We will only run featureCounts once and that single step will take ALL the samples as input. Here is a visual summary of that concept:

<p align="center">
<img width="700" alt="featureCounts idea" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/featurecounts_idea.jpg">
</p>
