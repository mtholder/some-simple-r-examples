#                 1111111111222222222233333333334444444444555555555566666666667777
#        1234567890123456789012345678901234567890123456789012345678901234567890123   
data <- "ACGTAACGTCGCGCGCTAACGCTAGCTAGCTAGCGGCTATATATATATAAGCGATGCTGCATGCTAGCGCTGC";
#                 *******                     ************                        
# desired output:
#   10, 7
#   38, 12
seq.list <- strsplit(data,'')[[1]];
n <- length(seq.list)

to.print.indices <- c();
to.print.lengths <- c();
i <- 3
while (i <= n) {
    running.count <- 0;
    while (seq.list[i] == seq.list[i-2]) {
        running.count <- running.count + 1;
        i <- 1 + i;
    }
    if (running.count > 2) {
        f <- seq.list[i - running.count - 2];
        s <- seq.list[i - running.count - 1];
        cat(i - running.count - 2, " ", running.count + 2, " ", paste(f, s, sep=""), "\n");
    }
    i <- 1 + i;
}
