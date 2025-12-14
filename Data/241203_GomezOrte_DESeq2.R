#######################################

#__Date:__ December
#__Author:__ Erin Osborne Nishimura
#__Script:__ 241203_GomezOrte.R
#__Project:__ To analyze RNA-seq in a project that compares yeast grown in rich media v. acetic acid media at different time points
#__Developed with the following versions:__ 
# 
# + R (4.3.1)
# + DESeq2 (1.42.0)   
# + corrplot (0.95)
# + RColorBrewer (1.1-3)
# + pheatmap (1.0.12)
# + apeglm (1.24.0)
# + tidyerse (2.0.0)

######################################


######### FOR FIRST TIME USE ONLY ##############
######### After use, comment this section ##############

# If you don't have bioconductor, install it.
if (!require("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
BiocManager::install

# # If are runnign R 4.1, and the above didn't work, try using bioconductor vesion 3.16. If you're using R 4.0 or below and the above didn't work, try to use "3.11" for R version 4.0
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install(version = "3.16")


# Install DESeq2:
if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")

BiocManager::install("DESeq2")


# Install 'apeglm'
# This helps you do some advanced modeling
BiocManager::install("apeglm")

# Install corrplot:
# This helps draw a nice correlation matrix
install.packages("corrplot")

# Install pretty heatmap - pheatmap: https://cran.r-project.org/web/packages/pheatmap/index.html
# This package and one called complexHeatmap are my favorites for plotting heatmaps
install.packages("pheatmap")

# Install RColorBrewer: https://cran.r-project.org/web/packages/RColorBrewer/index.html
# You want pretty colors, right?!
install.packages("RColorBrewer")

# Install Tidyverse: https://www.tidyverse.org/ 
# Nothing will make your life better than Tidyverse! You'll feel more organized 
install.packages("tidyverse")

######### DONE WITH: FIRST TIME USE ONLY SECTION ########################
######### ONCE YOU HAVE COMPLETED THAT SECTION ONCE, COMMENT IT OUT #####


###########  LOAD PACKAGE  #####################

# Do this every time.
# Load packages:
library(DESeq2)
library(corrplot)
library(RColorBrewer)
library(pheatmap)
library(apeglm)
#library(tidyverse) # causes some minor conflicts, but you can install this later for creating plots

#################################################

sessionInfo()


###########  READ IN THE DATA  #####################

# import the counts data
getwd()

# CHANGE THIS LINE: Set it to your own scripts directory!!!:
# --> Go over to the "Files" section in the lower right window
# --> Navigate to your SCRIPTS directory
# --> click on the Wheel/Cog Icon
# --> Select "Set as Working Directory"
# --> Copy and paste the line of code that is generated into your script for futue use
#setwd("/set/to/your/scripts/directory")




# CHANGE THIS LINE: Set this line of code so it inputs YOUR counts file!!!:
# Replace "../01_input/2024-11-20_merged_counts.txt" so it matches your counts file info
getwd()
countsData <- read.table(file = "../01_input/2024-11-20_merged_counts.txt", header = TRUE, row.names = 1) 
help(read.table)
# :!: EXERCISE



head(countsData)
dim(countsData)
class(countsData)

# CHANGE THIS LINE: 
# Read in the metadata 
# Replace "../01_input/metadata_gomezOrte.txt" with your metadata file
metadata1 <- read.table(file = "../01_input/metadata_gomezOrte.txt", header = FALSE) # import the data
metadata1


# Organize the metadata file by adding somme column headers
# EXAM PROJECT INSTRUCTIONS - change this line of code to match your metadata file in your exam project
colnames(metadata1) <- c("fasta1", "fasta2", "names1", "names2", "food", "temp", "rep")
metadata1

# Exercise: Looking at the metadata1 object and countsData objects (try head, dim, str, class, colnames):


# Organize the countsData file.
# Notice that the countsData file doesn't have any column headers:
head(countsData)

# Let's give countsData some columns names. The first names will be... chr', 'start', etc...
# The last names will be names for each sample. We can pull those names from metadata1:
as.vector(metadata1$names2)



# Re-name countsData columns headers:
ColHead <- colnames(countsData)
countColNum <- dim(countsData)[2]

#Remove all the extra content in each sample name
samplenames <- str_sub(ColHead[6:countColNum],42,-5)
samplenames

descriptions <- metadata1[which(metadata1$names1 %in% samplenames), 4]
descriptions
#Rename each column 
colnames(countsData) <- c("chr", "start", "stop", "strand", "length", descriptions)

# :!: EXERCISE: Now look at the top of countsData again usign head():




################### COUNT MATRIX INPUT ###################

# In this section we will prepare our input data for analysis.
# In the instruction for DESeq2, it states: "We read in a count matrix, which we will name cts, and the sample information table, which we will name coldata."

# OK, our task will be to generate a table called "cts" out of the countsData table.
# Subset the countsData 
head(countsData)
dim(countsData)

# There are countColNum number of columns in this dataset
countColNum <- dim(countsData)[2]

head(countsData[,6:countColNum])
dim(countsData[,6:countColNum])

## DOUBLE CHECK IT - Double check it - do those last two lines of code make sense? Will this sub-setting code capture all of our data?


# Save just the subset as an object called cts:
cts <- as.matrix(countsData[,6:countColNum])
head(cts)

# Yay, we made cts

# Next we need to make an information called coltable. We can make this out of the metadata table.
# EXAM PROJECT INSTRUCTIONS - Hack the next lines of code to produce a coldata file that matches your data structure
class(metadata1)
# Reorganize the metadata table so the names2 column are now row headers
metadata1
rownames(metadata1)<- metadata1$names2
metadata1

coldata <- metadata1[,c("food", "temp", "rep")]
coldata$food <- as.factor(coldata$food)
coldata$temp <- as.factor(coldata$temp)
coldata$rep <- as.factor(coldata$rep)
str(coldata)



# Yay! Now we have coldata! This is a new metadata object where we have just selected the type of information that is critical for deseq2 to use.

# One thing we need to explicitly check. The rownames of coldata need to exactly match the colnames of cts.
rownames(coldata)
colnames(cts)

#DOUBLE CHECK IT: Check that the names match  --> Should be TRUE
all(rownames(coldata) == colnames(cts))


# Next we will create an ddsHTSeq object out of cts and coldata:
# This will set a base design for your experiment:
# Load all the _counts.txt files and to attach them to the metadata.
# EXAM PROJECT INSTRUCTIONS - Use a design structure that matches your biological question

dds <- DESeqDataSetFromMatrix(countData = cts,
                              colData = coldata,
                              design = ~ food + temp)

# This analyzes the dataset by food (first) and temp (second)
# Alternatively, if you have just wild-type v. mutant and that condition is called "genotype", you could do something like this:
#dds <- DESeqDataSetFromMatrix(countData = cts,
#                              colData = coldata,
#                              design = ~ genotype)


################# PRE-FILTERING -- FILTER FOR PRESENT GENES: ################# 
# Not necessary, but helps keep things fast. 
# Exclude all samples that have less than 10 reads:
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

# Exercise: How many did we exclude?
dim(dds)

str(dds)

################### NOTE ON FACTOR LEVELS ###################
# Organize the categories into an order based on what makes sense:
# EXAM PROJECT INSTRUCTIONS - You will need to hack this to determine which order makes sense for your project:
dds$treatment <- factor(dds$food, levels = c("Ecoli","Bsubtilis"))
#dds$temp <- factor(dds$temp, levels = c("15", "20", "25"))



# PERFORM DESEQ2 analysis:
####### This is where the magic happens! ########### 
# This will transform dds into a specialized object with many more fields filled in.
dds <- DESeq(dds)



# Exercise: Check the output (class, str, dim, plotDispEsts) by adding the object dds inside the parentheses:
#Write out your own code here:
class(dds)
str(dds)
dim(dds)
plotDispEsts(dds)


# Here is a demonstration of the size Factor scaling that was calculated (sizeFactor):
dds$sizeFactor



# Demo: Access the normalized counts using counts(x, normalized = TRUE)
# Demo: Access the raw count info using counts(x, normalized = FALSE)
# Both of these datasets are good supplemental tables for papers
head(counts(dds, normalized = TRUE))
head(counts(dds, normalized = FALSE))

##### CORRELATION MATRICES:

#Take r-stabilized log transformations of all the normalized count data. This will help with the problem that the data is noisy and it will help with the problem that the data is spread across a wide range of values.
rld <- rlog(dds, blind=FALSE)  #Take the r-stabilized log transformed data:

# Calculate the distances between each sample
sampleDists <- dist(t(assay(rld))) # calculate distance matrices:


sampleDistMatrix <- as.matrix(sampleDists) #convert from data.frame -> matrix
rownames(sampleDistMatrix) <- colnames(rld) # Add some labels
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #Pick some pretty colors

# Draw the heatmap
par(mfrow=c(1,1))
p <- pheatmap(sampleDistMatrix,
              clustering_distance_rows=sampleDists,
              clustering_distance_cols=sampleDists,
              col=colors) # Plot the heatmap

# Save the CORRELATION MATRIX as a .pdf file


pdf("../03_output/corr_matrix_plots.pdf", height = 6, width = 7)
par(mfrow=c(1,1))
p

dev.off() # Do you see "null device"
dev.off() #-> sometimes you need a second dev.off until you see "null device"

## QUESTIONS - What can we conclude about this plot? Which condition makes a bigger impact on the transcriptome? Diet or temp? 



############## DIFFERENTIAL EXPRESSION ANALYSIS #####################

# calculate the statistically significant differences between E.coli and B. subtilis diets
# EXAM PROJECT INSTRUCTIONS - Set your contrast expression: Contrast - a character vector with exactly three elements: the name of a factor in the design formula, the name of the numerator level for the fold change, and the name of the denominator level for the fold change (simplest case)
# EXAM PROJECT INSTRUCTIONS - Set your lfcThreshold to a value of your choosing. This will set whether you want to exclude any genes as significant because their fold change is too low. Default is 0. That means, take all statistically significant genes. In this dataset, I selected 0.5 because there were A LOT of significant genes and I'd like to reduce the number.
# EXAM PROJECT INSTRUCTIONS - Set your alpha value. This is your p-value cut-off for significance. The default is 0.1. 

res_EcolVBsubt <- results(dds,
                            lfcThreshold = 0.5,
                            alpha = 0.1,
                            contrast=c("food", "Ecoli", "Bsubtilis"))
summary(res_EcolVBsubt)

# NOTE - If you only had 1 condition term and you want to use the default settings, this will work...
#results_table_default <- results(dds)

##### MA PLOTS:

# Plot the the default MA-plot
## PROJECT EXAM INSTRUCTIONS - Change the labels and y-lims range to match your dataset
## PROJECT EXAM INSTRUCTIONS - Explore how changing your lfcThreshold and alpha value change your output summary and MA Plot

par(mfrow=c(1,1))
plotMA(res_EcolVBsubt, main="E.coli v. B. subtilus \nunshrunken", ylim = c(-7,7), 
       ylab = "log fold change (ratio of normalized E.coli / B.subtilis)",
       xlab = "means of normalized counts")


##################  Exploring and exporting results ##################  

##### KNOWN GENES:

# Check known genes to make sure everything is working as predicted. Check out :WBGene00018393 # aka msra-1
# EXAM PROJECT INSTRUCTIONS - This is optional - can you plot a gene of interest? 

plotCounts(dds, gene=which(rownames(res_EcolVBsubt) == "WBGene00018393"), intgroup="treatment")
plotCounts(dds, gene=which(rownames(res_EcolVBsubt) == "WBGene00018393"), intgroup=c("treatment", "time"))

## Enrichment: Look up these genes on the Genome Browser: http://genome.ucsc.edu/s/Erin%20Osborne/GomezOrte_191210
## --> Search for msra-1 (Which is WBGene00018393)



##### VOLCANO PLOTS:###################


# Volcano plots are nice ways of displaying the fold change against the p-value.
resultsNames(dds)

# we will use this object to draw the Volcano plot:
res_EcolVBsubt

# EXAM PROJECT INSTRUCTIONS -- SET YOUR ADJUSTED P VALUE AND log2FoldChange TO YOUR DESIRED LEVELS HERE.
significantLFC <- rbind(subset(res_EcolVBsubt, padj < 0.1 & log2FoldChange > 0.5  ), subset(res_EcolVBsubt, padj < 0.1 & log2FoldChange < -0.5 )) # Identify significantly changing genes

significant_points_to_plot <-res_EcolVBsubt[which(rownames(res_EcolVBsubt) %in% rownames(significantLFC)),] 

# We will set the top limit of the plot as 100. I'll need to find all the points that exceed that measure:
maxedout <- subset(res_EcolVBsubt, padj < 10e-100)

#Draw plot:
par(mfrow=c(1,1)) # one plot only 

# Draw the plot
plot(res_EcolVBsubt$log2FoldChange, -log10(res_EcolVBsubt$padj),
     main="Volcano plot", xlab="Effect size: log2(fold-change)", ylab="-log10(adjusted p-value)", pch=20, cex = 0.4, ylim = c(0, 100), xlim = c(-6,6), col = "#00000030")

# Add points
points(maxedout$log2FoldChange, rep(102, length(maxedout$log2FoldChange)), 
       pch=17, cex = 0.4, ylim = c(0, 100), col = "red")

points(significant_points_to_plot$log2FoldChange, -log10(significant_points_to_plot$padj),
       pch=20, cex = 0.4, ylim = c(0, 100), col = "#FF000030")

# Add lines
abline(v=0, col = "blue")
abline(v=0.5, col = "blue", lty = "dashed")
abline(v=-0.5, col = "blue", lty = "dashed")
abline(h=-log10(0.1), col = "blue", lty = "dashed")

## Save the VOLCANO PLOT as a .pdf
pdf("../03_output/volcanoplot.pdf", width = 6, height = 6)

par(mfrow=c(1,1)) # one plot only 

# Draw the plot
# Draw the plot
plot(res_EcolVBsubt$log2FoldChange, -log10(res_EcolVBsubt$padj),
     main="Volcano plot", xlab="Effect size: log2(fold-change)", ylab="-log10(adjusted p-value)", pch=20, cex = 0.4, ylim = c(0, 100), xlim = c(-6,6), col = "#00000030")

# Add points
points(maxedout$log2FoldChange, rep(102, length(maxedout$log2FoldChange)), 
       pch=17, cex = 0.4, ylim = c(0, 100), col = "red")

points(significant_points_to_plot$log2FoldChange, -log10(significant_points_to_plot$padj),
       pch=20, cex = 0.4, ylim = c(0, 100), col = "#FF000030")


# Add lines
abline(v=0, col = "blue")
abline(v=0.5, col = "blue", lty = "dashed")
abline(v=-0.5, col = "blue", lty = "dashed")
abline(h=-log10(0.1), col = "blue", lty = "dashed")


dev.off() 
dev.off()


############## GETTING LISTS OF SIGNIFICANTLY CHANGING GENES #####################

# We will use the set of significantly changing genes from our variance shrunken analysis:
#Remember we calculated this above as:
#res_EcolVBsubt <- results(dds,
#                          lfcThreshold = 0.5,
#                          alpha = 0.1,
#                          contrast=c("food", "Ecoli", "Bsubtilis"))

res_EcolVBsubt


# Check the results table:
summary(res_EcolVBsubt)
head(res_EcolVBsubt)


# Select the significant subset of genes that are up-regulated in acetic acid
Up_in_e.coli <- subset(res_EcolVBsubt, padj < 0.1 & log2FoldChange > 0.5)
Up_in_e.coli <- Up_in_e.coli[order(Up_in_e.coli$padj),] #order them

head(Up_in_e.coli) # Check them
dim(Up_in_e.coli)

# Select the significant subset of genes that are down-regulated in acetic acid
Down_in_e.coli <- subset(res_EcolVBsubt, padj < 0.1 & log2FoldChange < -0.5)
Down_in_e.coli <- Down_in_e.coli[order(Down_in_e.coli$padj),]

head(Down_in_e.coli)
dim(Down_in_e.coli)

# Save these lists to output files:
write(rownames(Up_in_e.coli), file = "../03_output/Genes Up in E.coli.txt", sep = "\n")
write(rownames(Down_in_e.coli), file = "../03_output/Genes Down in E.coli.txt", sep = "\n")
write(rownames(res_EcolVBsubt), file = "../03_output/all_present_genes.txt", sep = "\n") # sometimes you need a control/background set of genes, too.

# Fun thing to do. See what KEGG pathways or GO Ontology terms are associated with your different lists of genes.
# Go to DAVID: https://david.ncifcrf.gov/
#      Click on "Start Analysis
#      Copy and paste your WBGENEID list into the "Upload" tab and "A: Paste a list" field
#      Under "Step 2: Select Identifier" select "WORMBASE_GENE_ID"
#      Under "Step 3:" select "Gene List"
#      Submit

############## MAKE HIERARCHICALLY CLUSTERED HEATMAPS OF ALL CHANGING GENES #####################

# Remember we assessed statistically significantly changing genes as...

#res_EcolVBsubt <- results(dds,
#                          lfcThreshold = 0.5,
#                          alpha = 0.1,
#                          contrast=c("food", "Ecoli", "Bsubtilis"))

res_EcolVBsubt

# Next, let's see what genes differ between the temperatures:
# Get 20 v 15 C differentially expressed genes:
res_20v15_2 <- results(dds,
                       lfcThreshold = 0.5,
                       alpha = 0.1,
                       contrast=c("temp", "20", "15"))

# Get 25 v 15 C differentially expressed genes:
res_25v15_2 <- results(dds,
                       lfcThreshold = 0.5,
                       alpha = 0.1,
                       contrast=c("temp", "25", "15"))

# Get 25 v 20 C differentially expressed genes:
res_25v20_2 <- results(dds,
                       lfcThreshold = 0.5,
                       alpha = 0.1,
                       contrast=c("temp", "25", "20"))

#Subset each results table for just the differentially expressed genes:
# I'm making this a little more stringent 


sign_food <- subset(res_EcolVBsubt, padj < 0.1)
dim(subset(res_EcolVBsubt, padj < 0.1))

sign_20v15 <- subset(res_20v15_2, padj < 0.1)
sign_25v15 <- subset(res_25v15_2, padj < 0.1)
sign_25v20 <- subset(res_25v20_2, padj < 0.1)

#Determine how many genes were captured and merge them:
changing_genes <- rbind(sign_food, sign_20v15, sign_25v15, sign_25v20)

dim(changing_genes)
length(unique(rownames(changing_genes)))
# Get all r-stabilized log values of all the data:
rdl_all <- assay(rlog(dds, blind=FALSE))

#Subset just the changing genes:
changing_lrt_rdl <- subset(rdl_all, rownames(rdl_all) %in% rownames(changing_genes))
dim(changing_lrt_rdl)
head(changing_lrt_rdl)

# Make sure it is in matrix form:
class(changing_lrt_rdl)

# Draw a heat map
# Scale by row, listed below as scale = "row". This is really important. It sets the mean of every row to 0 and the standard deviation of every row to 1:
p <- pheatmap(changing_lrt_rdl, 
              scale="row", 
              color = colorRampPalette(c("blue", "white", "red"), space = "Lab")(100),
              cluster_rows=TRUE, 
              cluster_cols=TRUE, 
              clustering_distance_rows = "euclidean", 
              clustering_method = "complete",
              show_rownames = FALSE)

p
help(pheatmap)
# Tip: If euclidean doesn't look good, try "correlation" other clustering distances
# Tip: If complete doesn't look good, try other methods
# Save the clustered heatmap plot as a .pdf:

pdf("../03_output/clustered_genes.pdf", width = 6, height = 8)

p

dev.off()
dev.off()





############## ADVANCED OPTIONAL TOPICS
#######PERFORM LOG FOLD CHANGE SHRINKAGE FOR VISUALIZATION

# An input requirement of the lfcShrink function is a coef term. This is pulled from the resultsNames of dds:
# An additional method that is appropriate in some datasets is to perform lfcshrinkage. This uses modeling to adjust the values of normalized read numbers. This helps improve plotting and prepares the data for some statsitcsal analysis. This creates "homoskedactic" data. 

# First check what your options are for results Names. 
# These are the comparisons you can make easily. It can be tricky to structure comparisons using lfcShrink that aren't listed. You may need to prepare your coldata and cts matrices slightly differently or to following lfcShirnk instructions.

resultsNames(dds)

resLFC_EcolVBsubt <- lfcShrink(dds, coef="food_Ecoli_vs_Bsubtilis", res = res_EcolVBsubt)

summary(resLFC_EcolVBsubt)


# Exercise 2: Inspect the results object called resLFC_EcolVBsubt (head, dim, summary, str):


##### MA PLOTS:

# Plot the the default MA-plot and the shrunken MA Plot


par(mfrow=c(1,2))
plotMA(res_EcolVBsubt, main="E.coli v. B. subtilus \nunshrunken", ylim = c(-7,7), 
       ylab = "log fold change (ratio of normalized E.coli / B.subtilis)",
       xlab = "means of normalized counts")

plotMA(resLFC_EcolVBsubt, main="E.coli v. B. subtilus \nshrunken", ylim = c(-7,7), 
       ylab = "log fold change (ratio of normalized E.coli / B.subtilis)",
       xlab = "means of normalized counts")


# Save the plots

# Make a folder ../03_output
pdf("../03_output/MAplots.pdf", height = 6, width = 11)

par(mfrow=c(1,2)) # This changes how many plot panels you can generate
plotMA(res_EcolVBsubt, main="E.coli v. B. subtilus \nunshrunken", ylim = c(-7,7), 
       ylab = "log fold change (ratio of normalized E.coli / B.subtilis)",
       xlab = "means of normalized counts")

plotMA(resLFC_EcolVBsubt, main="E.coli v. B. subtilus \nshrunken", ylim = c(-7,7), 
       ylab = "log fold change (ratio of normalized E.coli / B.subtilis)",
       xlab = "means of normalized counts")


dev.off() 
dev.off() #Note: sometimes you need 2x dev.off() lines of code to really truly escape out of the .pdf printer













# Get versions
sessionInfo()

# Please cite R in your publications when using it
citation()

