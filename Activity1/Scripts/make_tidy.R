#!/usr/bin/env Rscript
# "tidy" a very specific data set

# function that does the work
tidy_the_data <-
    function(x)
{
    data.frame(strain=c(rep(x[4:5,1], each=ncol(x)-1),
                        rep(x[8:9,1], each=ncol(x)-1)),
               genotype=c(rep(x[3,3], (ncol(x)-1)/2),
                          rep(x[3,6], (ncol(x)-1)/2),
                          rep(x[7,3], (ncol(x)-1)/2),
                          rep(x[7,6], (ncol(x)-1)/2)),
               treatment_time=c(rep(x[2,1], (ncol(x)-1)*2),
                                rep(x[6,1], (ncol(x)-1)*2)),
               date=rep(unlist(x[1,-1]), 4),
               response=as.numeric(c(unlist(x[4,-1]),
                                     unlist(x[5,-1]),
                                     unlist(x[8,-1]),
                                     unlist(x[9,-1]))),
               stringsAsFactors=FALSE)
}


# grab command line arguments
args = commandArgs(trailingOnly=TRUE)
if(length(args) < 2) {
    stop("Give input and output file names")
} else {
    ifile = args[1]
    ofile = args[2]

    # read the data
    dat <- read.csv(ifile, header=FALSE, stringsAsFactors=FALSE)

    # tidy the data
    tidy_dat <- tidy_the_data(dat)

    # write the data to a file
    write.table(tidy_dat, file=ofile, row.names=FALSE,
                col.names=TRUE, sep=",", quote=FALSE)
}