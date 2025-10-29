# Automating RNA-seq pipelines

OK, that was insanely slow.

We wrote out a single command line by hand. There were a lot of details. We needed to make no errors. You can probably imagine that this task becomes more cumbersome as your project gets bigger. It becomes harder to write a line of code error-free.

To guard against errors and streamline large projects, we need an **automation strategy**. This is the heart of pipeline building.

The key is to use the information in the `metadata` file to instruct a series of commands to loop over each field.

Let's create a metadata file.

**!!! Exercise:** Here is a metadata file for you. You can copy and paste it here.

- Navigate to `~/PROJ01_GomezOrte1/01_input`
- Create a new file called `metadata_gomezOrte.txt`
- Copy and paste:

```
SRR5832182_1.fastq	SRR5832182_2.fastq	EG01	01_Ecoli_15_1	Ecoli	15	1
SRR5832183_1.fastq	SRR5832183_2.fastq	EG02	02_Ecoli_15_2	Ecoli	15	2
SRR5832184_1.fastq	SRR5832184_2.fastq	EG03	03_Ecoli_15_3	Ecoli	15	3
SRR5832185_1.fastq	SRR5832185_2.fastq	EG04	04_Ecoli_20_1	Ecoli	20	1
SRR5832186_1.fastq	SRR5832186_2.fastq	EG05	05_Ecoli_20_2	Ecoli	20	2
SRR5832187_1.fastq	SRR5832187_2.fastq	EG06	06_Ecoli_20_3	Ecoli	20	3
SRR5832188_1.fastq	SRR5832188_2.fastq	EG07	07_Ecoli_25_2	Ecoli	25	1
SRR5832189_1.fastq	SRR5832189_2.fastq	EG08	08_Ecoli_25_1	Ecoli	25	2
SRR5832190_1.fastq	SRR5832190_2.fastq	EG09	09_Ecoli_25_3	Ecoli	25	3
SRR5832191_1.fastq	SRR5832191_2.fastq	EG10	10_Bsubtilis_15_1	Bsubtilis	15	1
SRR5832192_1.fastq	SRR5832192_2.fastq	EG11	11_Bsubtilis_15_2	Bsubtilis	15	2
SRR5832193_1.fastq	SRR5832193_2.fastq	EG12	12_Bsubtilis_15_3	Bsubtilis	15	3
SRR5832194_1.fastq	SRR5832194_2.fastq	EG13	13_Bsubtilis_20_1	Bsubtilis	20	1
SRR5832195_1.fastq	SRR5832195_2.fastq	EG14	14_Bsubtilis_20_2	Bsubtilis	20	2
SRR5832196_1.fastq	SRR5832196_2.fastq	EG15	15_Bsubtilis_20_3	Bsubtilis	20	3
SRR5832197_1.fastq	SRR5832197_2.fastq	EG16	16_Bsubtilis_25_1	Bsubtilis	25	1
SRR5832198_1.fastq	SRR5832198_2.fastq	EG17	17_Bsubtilis_25_2	Bsubtilis	25	2
SRR5832199_1.fastq	SRR5832199_2.fastq	EG18	18_Bsubtilis_25_3	Bsubtilis	25	3
```

- The Metadata document should be in the form:

| Column | Contents | Example |
| --- | --- | --- |
| 1 | 1st .fastq file | SRR5832182_1.fastq | 
| 2 | 1nd .fastq file | SRR5832182_2.fastq | 
| 3 | A short name for each sample - short alphnumeric sorting numbers & letters | EG01 | 
| 4 | A long name for each sample - with condition info | 01_Ecoli_15_1 | 
| 5 | condition #1 | 	Ecoli | 
| 6 | condition #2 ( the number of conditions you have will determine how many total column you will have | 15 | 
| 7 | replicate # | 1 | 

The key to our automation strategy is that we will loop over each row and parse each sample through a series of stereotyped commands.

A quick description of vocabulary:

- **samples** - each pair of .fastq files represents a sample
- **conditions** - There are two types of conditions in this study... diet and temperature
- **reps** - There are three reps for each condition combination

** Yay!** Let's see how we will automate the entire pipeline here:

Continue on to [Automation 2](3_2_Automation_2.md)
