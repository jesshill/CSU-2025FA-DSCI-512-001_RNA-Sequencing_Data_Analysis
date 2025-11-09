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

- For more hints on locating .gtf or .gff files, see...

<details>
  <summary>Get the .gtf file</summary>

---

Content here

---

</details>

4. Let's explore the HISAT2 manual.

- What are the default minimum and maximum intron lengths for HISAT2?
- Do you expect these default settings to be appropriate for your organism?
