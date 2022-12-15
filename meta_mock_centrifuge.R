x <- read.table("report_even.tsv", header = T, sep = "\t")
x <- x[x$numUniqueReads>1,]
x <- x[order(x$numReads, decreasing = T),]
x <- x[x$taxRank=="species",]

y <- read.table("report_log.tsv", header = T, sep = "\t")
y <- y[y$numUniqueReads>1,]
y <- y[order(y$numReads, decreasing = T),]
y <- y[y$taxRank=="species",]
