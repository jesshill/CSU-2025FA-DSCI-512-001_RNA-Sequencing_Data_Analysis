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

**Start a project on your laptop:**

- Navigate to a directory on your local laptop/desktop using your Finder (Mac) or Explorer (PC)
- Start a DESeq2 project
- Give the project directory a name like DSCI512_DESeq2

**Initiate some sub-directories:**

- `01_input`
- `02_scripts`
- `03_output`

Download these input files from ALPINE:

- Your metadata file:
  - `~/01_input/metadata_gomezOrte.txt`
- Your merged counts.txt file:
  - `~/DSCI512/PROJ01_GomezOrte/03_output/<DATE>_output/03_feature/2024-<mo>-<da>_merged_counts.txt`

NOTE: if you DON“T have your own counts file, you can “borrow” an old one from [here]()

**Download script:**






















