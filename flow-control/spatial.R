data = matrix(c(1,0,0,0,1,0,0,0,0,0,
                0,1,0,1,0,1,0,0,1,0,
                1,1,0,0,0,0,1,0,0,0,
                1,1,1,0,0,0,1,0,0,0,
                0,1,1,1,0,0,0,1,0,0,
                1,0,1,1,1,0,1,1,1,1,
                1,1,0,1,0,1,0,1,1,1,
                0,0,0,1,1,0,1,0,1,0,
                0,1,1,0,0,0,1,1,0,0,
                1,0,0,0,1,1,1,0,0,0),
              nrow=10,
              ncol=10);

# Imagine the matrix represents presence/absence across a
# geographic space. The row and columm index corresponds
# to the pixels longitudinal and latitudinal offset.
# The goal is to calculate a "clumping" score for the matrix
# that is the product over each cell, x, of:
#              \epsilon + \sum_{i\in N_x} I(i == x)
# score(x) =  ----------------------------------------
#                        | N_x | + 2 \epsilon
# where:
#    N_x is the set of cells that neighbor x
#   | N_x | is the size of this set (3 for corner cells, 5 for 
#               cells on the side, and 8 of other cells).
#   \epsilon is a positive # (we'll use .1)
#   I(i == x) is an "indicator" function that is 1 if the cell
#               x and the cell i have the same value. It is 0
#                if the cells differ.
#
# If \epsilon is 1. The score function can be thought of as
# a simple model that  states that "probability of a cell being 1
# is the proportion of neighbors who display 1".
# As epsilon increases, we nudge the probability of 0 or 1 closer
# to 0.5
#
# The value for the matrix is the product of this score for each cell
epsilon <- 0.1;
total.score = 1.0;
for (r in 1 : nrow(data)) {
    row <- data[r,]
    top.or.bottom <- r == 1 || r == nrow(data);
    for (c in 1 : length(row)) {
        cell <- row[c];
        left.or.right <- c == 1 || c == length(row);
        if (left.or.right) {
            if (top.or.bottom) {
                num.neighbors = 3; # corner
            } else {
                num.neighbors = 5; # left or right side
            }
        } else if (top.or.bottom) {
            num.neighbors = 5; # top or bottom side
        } else {
            num.neighbors = 8;
        }
        num.matching <- 0;
        if (r > 1) {
            prev.row <- data[(r - 1),];
            if (prev.row[c] == cell) {
                num.matching <- num.matching + 1;
            }
            if (c > 1 && prev.row[c - 1] == cell) {
                num.matching <- num.matching + 1;
            }
            if (c < length(prev.row) && prev.row[c + 1] == cell) {
                num.matching <- num.matching + 1;
            }
        }
        if (r < nrow(data)) {
            nr = r + 1;
            next.row <- data[nr,];
            if (next.row[c] == cell) {
                num.matching <- num.matching + 1;
            }
            if (c > 1 && next.row[c - 1] == cell) {
                num.matching <- num.matching + 1;
            }
            if (c < length(next.row) && next.row[c + 1] == cell) {
                num.matching <- num.matching + 1;
            }
        }
        if (c > 1 && cell == row[c - 1]) {
            num.matching <- num.matching + 1;
        }
        if (c < length(row) && cell == row[c + 1]) {
            num.matching <- num.matching + 1;
        }
        cell.score <- (epsilon + num.matching)/(2*epsilon + num.neighbors);
        total.score <- total.score * cell.score;
        #cat(r, " ", c, " ", cell, " ", num.neighbors, " ", num.matching, "\n");
    }
}
cat('score = ', total.score);