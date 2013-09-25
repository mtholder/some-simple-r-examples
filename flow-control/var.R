data <- c(2.0, 3.3, 4.1, 5.0);

n <- length(data);
s <- 0;
for (i in 1 : n) {
    cat(paste(i, " ", data[i], "\n"));
    s <- s + data[i];
}
cat(paste("sum is ", s, "\n"));
m <- s/n

cat(paste("mean is ", m, "\n"));

sum.sq.dev <- 0.0;
for (i in 1 : n) {
    dev <- data[i] - m;
    sq.dev <- dev*dev;
    sum.sq.dev <- sum.sq.dev + sq.dev;
}

cat(paste("sum of squared dev is ", sum.sq.dev, "\n"));
sample.var <- sum.sq.dev/(n - 1)
cat(paste("sample variance ", sample.var, "\n"));
sample.sd <- sqrt(sample.var)
cat(paste("sample standard deviation  ", sample.sd, "\n"));


cat("\n\nArray \n")
cat(paste("faster mean =", sum(data)/length(data), "\n"));
m = sum(data)/length(data)
faster.sq.dev = (data - m)**2
faster.sum.sq.dev = sum((data - m)**2)
cat(paste("faster squared dev =", faster.sum.sq.dev, "\n"));
cat(paste("faster var =", faster.sum.sq.dev/(n - 1), "\n"));
cat(paste("faster sd =", sqrt(faster.sum.sq.dev/(n - 1)), "\n"));


cat("\n\nBuiltins \n")
cat(paste("fastest sum =", sum(data), "\n"));
cat(paste("faster mean =", mean(data), "\n"));
cat(paste("faster var =", var(data), "\n"));
cat(paste("faster sd =", sd(data), "\n"));
