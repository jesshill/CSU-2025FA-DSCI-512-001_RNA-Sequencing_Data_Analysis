Merged multiple bigwig (.bw) files together for upload to UCSC Genome browser using the following script.

This script uses:
- [bigwigmerge](https://bioconda.github.io/recipes/ucsc-bigwigmerge/README.html)
- [bedgraphtobigwig](https://bioconda.github.io/recipes/ucsc-bedgraphtobigwig/README.html)
- A chrom sizes file. The C. elegans chroms sizes file can be found [here](https://hgdownload.soe.ucsc.edu/goldenPath/ce11/bigZips/)
  - called `ce11.chrom.sizes`
    - We are just going to make this file, you dont need to download it (see the data below)
  - each organism has its own. Typically downloadable. You can also just make your own. They look like this: 

```
$ more ce11.chrom.sizes 
chrV    20924180
chrX    17718942
chrIV   17493829
chrII   15279421
chrI    15072434
chrIII  13783801
chrM    13794
```

So you will need to nano `ce11.chrom.sizes` and make this file by copying and pasting the chromosome names and sizes into it. Do this in you `04_samtools` directory.
```
chrV    20924180
chrX    17718942
chrIV   17493829
chrII   15279421
chrI    15072434
chrIII  13783801
chrM    13794
```

While in your `04_samtools` directory and before we make our merge script, we need to install a few ucsc tools

So make sure you are on a compile node and your 2025dsci environment is activated!

```
$ conda install bioconda::ucsc-bedgraphtobigwig

$ conda install bioconda::ucsc-bigwigmerge
```

Now, still in your `04_samtools` directory, nano a new bash script called `merge_bw_script.sh`

Copy and past the code below. 

```
#!/bin/bash
 
# Use bigwigMerge
# Usage: bigWigMerge in1.bw in2.bw .. inN.bw out.bedGraph
 
bigWigMerge EG01_sort.bw EG02_sort.bw EG03_sort.bw Ecoli_15.bedGraph
bigWigMerge EG04_sort.bw EG05_sort.bw EG06_sort.bw Ecoli_20.bedGraph
bigWigMerge EG07_sort.bw EG08_sort.bw EG09_sort.bw Ecoli_25.bedGraph
bigWigMerge EG10_sort.bw EG11_sort.bw EG12_sort.bw Bsubtilis_15.bedGraph
bigWigMerge EG13_sort.bw EG14_sort.bw EG15_sort.bw Bsubtilis_20.bedGraph
bigWigMerge EG16_sort.bw EG17_sort.bw EG18_sort.bw Bsubtilis_25.bedGraph
 
 
 
# Use bedgraphtobigwig
# Usage: bedGraphToBigWig in.bedGraph chrom.sizes out.bw
 
bedgraphtobigwig Ecoli_15.bedGraph ce11.chrom.sizes Ecoli_15_merged.bw
bedgraphtobigwig Ecoli_20.bedGraph ce11.chrom.sizes Ecoli_20_merged.bw
bedgraphtobigwig Ecoli_25.bedGraph ce11.chrom.sizes Ecoli_25_merged.bw
bedgraphtobigwig Bsubtilis_15.bedGraph ce11.chrom.sizes Bsubtilis_15_merged.bw
bedgraphtobigwig Bsubtilis_20.bedGraph ce11.chrom.sizes Bsubtilis_20_merged.bw
bedgraphtobigwig Bsubtilis_25.bedGraph ce11.chrom.sizes Bsubtilis_25_merged.bw
```

Again, this script will need to be in your '04_samtools' directory, where the files are located!

You will run the shell script from '04_samtools' with the following syntax:
```
$ bash merge_bw_script.sh
```
