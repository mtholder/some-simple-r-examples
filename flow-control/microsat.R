#                 1111111111222222222233333333334444444444555555555566666666667777
#        1234567890123456789012345678901234567890123456789012345678901234567890123   
data <- "ACGTAACGTCGCGCGCTAACGCTAGCTAGCTAGCGGCTATATATATATAAGCGATGCTGCATGCTAGCGCTGC";
#                 *******                     ************                        
# desired output:
#   10, 7
#   38, 12
seq.list <- strsplit(data,'')[[1]];
n <- length(seq.list)
running.count <- 0;
to.print.indices <- c();
to.print.lengths <- c();
for (i in 3 : n) {
    if (seq.list[i] == seq.list[i-2]) {
        running.count <- running.count + 1;
    } else {
        if (running.count > 2) {
            to.print.indices = c(to.print.indices, i - running.count - 2);
            to.print.lengths = c(to.print.lengths, running.count + 2);
        }
        running.count <- 0;
    }
}

for (j in 1:length(to.print.indices)) {
    cat(to.print.indices[j], " ", to.print.lengths[j], "\n")
}
