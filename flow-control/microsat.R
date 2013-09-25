#                 1111111111222222222233333333334444444444555555555566666666667777
#        1234567890123456789012345678901234567890123456789012345678901234567890123   
data <- "ACGTAACGTCGCGCGCTAACGCTAGCTAGCTAGCGGCTATATATATATAAGCGATGCTGCATGCTAGCGCTGC";
#                 *******                     ************                        
# desired output:
#   10, 7
#   38, 
seq.list = strsplit(data,'')[[1]];
n = length(seq.list)
for (i in 1 : n) {
    cat(seq.list[[i]], "\n")
}
