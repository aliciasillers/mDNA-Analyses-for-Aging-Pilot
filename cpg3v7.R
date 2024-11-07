#finds DMRs in the CpG context between generation 3 and generation 7 using bulked samples

#load packages
library("methylKit")
library("dplyr")
library("genomation")

#specify data
samplelist <- list("A3", "B3", "A7", "B7")
treatmentlist <- as.numeric(list(1, 1, 2, 2))
my.methRawList=processBismarkAln( location = list("bismarkout/sort_S4.1_bismark_bt2_pe.bam", "bismarkout/sort_S5.1_bismark_bt2_pe.bam", "bismarkout/sort_S7.1_bismark_bt2_pe.bam", "bismarkout/sort_S8.1_bismark_bt2_pe.bam"), sample.id=samplelist, treatment = treatmentlist, assembly="farr1", read.context="CpG")

#create methylkit object
#methyl <- methRead(my.methRawList, sample.id = samplelist, assembly = "farr1", treatment = treatmentlist, context = "CpG", dbtype = >

#check
getMethylationStats(my.methRawList[[1]], plot = FALSE, both.strands = FALSE)
getMethylationStats(my.methRawList[[4]], plot = FALSE, both.strands = FALSE)

#filter
filt.meth <- filterByCoverage(my.methRawList, lo.count = 2)

#merge
meth <- unite(filt.meth, destrand = FALSE)
head(meth)
dim(meth)

#dmr analysis
dmrs <- calculateDiffMeth(meth, mc.cores = 2)
dmr25 <- getMethylDiff(dmrs, difference = 25, qvalue = 0.01)
hyper25 <- getMethylDiff(dmrs, difference = 25, qvalue = 0.01, type = "hyper")
hypo25 <- getMethylDiff(dmrs, difference = 25, qvalue = 0.01, type = "hypo")
bedgraph(dmr25, file.name = "cpgdmrs3v7.bedgraph", col.name = "meth.diff")
cpgdmrs <- as.data.frame(bedgraph(dmr25, col.name = "meth.diff")) %>% arrange(desc(abs(meth.diff)))
write.table(cpgdmrs, "cpgdmrs3v7.tsv", sep = '\t', quote = FALSE, row.names = FALSE)

#annotation
filepath <- "../Genome/Nomenclature_Update/farr1_updated.gene_models.gtf"
gff <- gffToGRanges(filepath, ensembl = FALSE)
head(gff)
grl1 <- as(split(gff, gff$type), "GRangesList")
annotateWithFeatures(target = as(dmr25, "GRanges"), feature = grl1)
