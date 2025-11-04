# Cleaning up an RNA-seq project on ALPINE

**!!! Reminder:** Scratch space should be used for all compute jobs run on Alpine. This high-performance scratch directory is not backed up, and is not appropriate for long-term storage. **Data may be purged at any time subject to overall system needs. Files are automatically removed 90 days after their initial creation.**

We want to save our results **locally**: 
1. Follow the instructions to Clean Up the Project on github
2. create a tarball out of the whole project
3. Use rsync to download your tarball to a local computer
4. Unzip on your local computer

ALPINE maintenance days are on **Wednesdays!**
- Sign up for maintenance notifications

**Final Exam Project**
- Start early
- Common pitfalls
  - Typos
  - Paths
- Metadata
  - HW assignment 4
- .gff files versis .gtf files
  - About .gff files 
- Thoughts on chatGPT are in the "Syllabus" 

## Recommended Acknowledgments 

- Reference all software, packages, and resources
- Include software and package versions
- Use NCBI GEO and SRA Toolkit
- Upload your .gtf files with your raw data! So helpful!
- Reference R
- Reference ALPINE
- Reference your organism's data hub.
- Acknowledge this class if you use any adapted scripts in publications. Just include the class in the Acknowledgments or reference the github repository in Materials & Methods.
- Feel free to use all materials in this class freely. Feel free to adapt and change any materials as it suits your needs. Just acknowledge the class and relevant githubs somewhere.

## Recommended additional trainings

**Best Practices**
- [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)
- [A Quick Guide to Organizing Computational Biology Projects](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)
- [Gene name errors are widespread in the scientific literature](https://pmc.ncbi.nlm.nih.gov/articles/PMC4994289/)

**Clustering**
- [Stats Lab Dublin Hierarchical Clustering (1 of 5 videos)](https://www.youtube.com/watch?v=3cub1laiFeU)

**RNA-seq resources**
- [Kasper Hansen's Statistics for Genomics youtube video](https://www.youtube.com/watch?v=C8RNvWu7pAw&t=2366s)
- [DESeq2 Vignette](https://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html)
- [Simon Anders CSHL Lecture of DESeq2](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/DESeq2-Anders.pdf)

