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












