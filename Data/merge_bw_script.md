merged multiple bigwig (.bw) files together for upload to UCSC Genome browser using the following script.

This script uses:
- [bigwigmerge](https://bioconda.github.io/recipes/ucsc-bigwigmerge/README.html)
- [bedgraphtobigwig](https://bioconda.github.io/recipes/ucsc-bedgraphtobigwig/README.html)
- A chrom sizes file. The C. elegans chroms sizes file can be found [here](https://hgdownload.soe.ucsc.edu/goldenPath/ce11/bigZips/)
  - called ce11.chrom.sizes
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

Here is the code I wrote to do the merging:

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
