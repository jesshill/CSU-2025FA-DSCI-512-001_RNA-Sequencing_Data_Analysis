# Differential expression analysis with DESeq2

## References

It is easy to follow the DESeq2 instructions even if you are not very familiar with R. Most of the commands in the .R script we'll use today are verbatim taken from the Vignette:

- [http://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html](http://bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html)
- Most recent vignettes are always linked to the [DESeq2 webpage](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) under “Documentation”;
- Tip: Download your own copy of the instructions because they are difficult to find again.

## Differential Expression Analysis with DESeq2

we will use **DESeq2**, an **R package**, that we will run in **RStudio**.

**What is R?**

**R** is both a programming language and a free software environment for statistical computing and graphics.

- Open source
- Supported by the R Foundation for Statistical Computing
- It is an alternative to the [**S** statistical computing language](https://en.wikipedia.org/wiki/S_(programming_language))
- Benefits of R
  - Wide usage
  - Numerous packages are available for specialized tasks
  - Specialized for statistics with statistical tests and formulas built-in
  - Beautiful integration with LaTeχ (Pronounced La Tech because that's a Chi not an X) to produce lovely documentation (package knitr).
- [Base R cheatsheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)
- [All the cheatsheets](https://posit.co/resources/cheatsheets/)
- [Quick R guide](https://www.datacamp.com/doc/r/category/r-documentation)

**What is R Studio?**

Rstudio is a dedicated **IDE (Integrated Development Environment)** for R. Think of it as a slick little wrapper that R runs inside. It should look a little similar to JupyterHub in that there are dedicated windows for different things like 1) code, 2) code execution, 3) plots, 4) help, 5) file structure, etc.

## Exercise - Analyze Gomez-Orté Dataset in R using DESeq2

Today we will do everything on your local computer. You won't need to log into ALPINE.

**Start a project on your laptop**

- Navigate to a directory on your local laptop/desktop using your Finder (Mac) or Explorer (PC)
- Start a DESeq2 project
- Give the project directory a name like DSCI512_DESeq2

**Initiate some sub-directories**

- `01_input`
- `02_scripts`
- `03_output`

Download these input files from ALPINE:

- Your metadata file:
  - `~/01_input/metadata_gomezOrte.txt`
- Your merged counts.txt file:
  - `~/DSCI512/PROJ01_GomezOrte/03_output/<DATE>_output/03_feature/2024-<mo>-<da>_merged_counts.txt`

NOTE: if you DON“T have your own counts file, you can “borrow” an old one from [here](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/2024-11-20_merged_counts.txt)

**Download script**

- Same directory as above
- Download [241203_GomezOrte_DESeq2.R](https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Data/251110_GomezOrte_DESeq2.R) and place it in your `02_scripts` directory

explore the files you have acquired. 

**Where did these files come from? What will you need for your final exam project?**

- You'll need your `metadata.txt` file. Located on ALPINE under `01_input`
- You'll need your `counts.txt` file. This is the output from featureCounts. It is saved as... `~/03_output/<DATE>_output/03_feature/counts.txt`
- You'll hack a copy of this same DESeq2 script to suit your needs.

## RStudio

- Open the script file in Rstudio
- We will switch over to the DESeq2 script file now.

### Learning objectives:

- Learn about DESeq2 and **what it does**.
- Know the **five steps** of what DESeq2 does.
- Understand that DESeq2 does not use a Poisson distribution to model the spread of the data. Instead it uses a **negative binomial distribution** because RNA-seq data naturally is **overdispersed**.
- Understand why **multiple testing correction** is required and that the **Benjamini-Hochberg Correction** is the type that is used by DESeq2.
- Know how to read and interpret three types of plots:
  - [MA-plot](https://en.wikipedia.org/wiki/MA_plot)
  - [Volcano plot](https://en.wikipedia.org/wiki/Volcano_plot_(statistics))
  - [Distance matrix plot](https://en.wikipedia.org/wiki/Distance_matrix)
  - [Heatmaps and hierarchical clustering](http://www.opiniomics.org/you-probably-dont-understand-heatmaps/)

### Citations

Please cite all the software you use in your RNA-seq data analysis in any published works:

- fastp, hisat2, featureCounts, samtools, etc.
- Please cite R: [citing R](https://ropensci.org/blog/2021/11/16/how-to-cite-r-and-r-packages/)
- Please cite all R packages you used
- Please acknowledge and cite ALPINE in your published works: [citing ALPINE](https://www.colorado.edu/rc/resources/citations)

### Extra stuff 

**knitr and beautiful output**

you can create beautiful documents with R that are self-contained reports of your analysis.

- Start a new document in Rstudio. Instead of initiating an .R document, initiate an .Rmd document (R markdown).
- Example Rmarkdown code:
  - [https://gist.github.com/jeromyanglim/2716336](https://gist.github.com/jeromyanglim/2716336)
  - [https://rmarkdown.rstudio.com/gallery.html](https://rmarkdown.rstudio.com/gallery.html)
- [knitr in a knutshell](https://kbroman.org/knitr_knutshell/pages/Rmarkdown.html)
- The .Rmd file generates the .html report (.pdf) reports are also possible.
  - [R Markdown cheat sheet](https://rmarkdown.rstudio.com/lesson-15.HTML)
  - [https://rmarkdown.rstudio.com/lesson-1.html](https://rmarkdown.rstudio.com/lesson-1.html)

**Reproducible research**

Creating beautiful reports is part of the Reproducible research approach.

- Reproducible research guide 







