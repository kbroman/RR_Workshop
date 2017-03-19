# make figures showing the ugly and tidy Excel files for Activity 1

library(broman)

# read data
ugly <- read.table("../Activity1/Activity1.csv", sep=",",
                 header=FALSE, stringsAsFactors=FALSE,
                 blank.lines.skip=FALSE,
                 colClasses=character())

# restore two blank lines
ugly <- rbind(rep("", ncol(ugly)),
              ugly[1:5,],
              rep("", ncol(ugly)),
              ugly[-(1:5),])


pdf("Figs/activity1_ugly.pdf", height=6, width=8, pointsize=14)
excel_fig(ugly, col_names=FALSE)
dev.off()

tidy <- read.csv("../Activity1/Activity1_tidy.csv",
                 header=TRUE, stringsAsFactors=FALSE,
                 colClasses=character())

pdf("Figs/activity1_tidy.pdf", height=5, width=8, pointsize=12)
excel_fig(tidy[1:9,])
dev.off()
