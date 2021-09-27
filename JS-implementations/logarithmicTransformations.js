
/* fibonacci series transformations
    a <- a + b
    b <- a 
*/

// tail recursive process
const fibRecur = (n) => {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return fibRecur(n - 1) + fibRecur(n - 2);
    }
};

// iterative process
const fibAlt = (n) => {
    let fibIter = (a, b, count) => {
        if (count == 1) {
            return b;
        } else {
            return fibIter(a + b, a, count - 1);
        }
    }
    return fibIter(1, 0, n);
};

/*
    General Case: 
    a <- bq + aq + ap
    b <- bp + aq
    fibonacci series is a special case where p = 0 and q = 1

    First Transformation
    a' = (p + q)a + qb
    b' = qa + pb

    Second Transformation
    a" = (p + q)a' + qb' = (p^2 + 2pq + 2q^2)a + (2pq + q^2)b
    b" = qa' + pb' = (2pq + q^2)a + (p^2 + q^2)b
*/

const fib = (n) => {
    let square = (n) => n * n;
    
    let fibIter = (a, b, p, q, count) => {
        if (count == 0) {
            return b;
        } else if (count % 2 == 0) {
            return fibIter(a, b, (square(p) + square(q)), (2 * p * q + square(q)), count / 2);
        } else {
            return fibIter((b*q + a*q + a*p), (b*p + a*q), p, q, count - 1);
        }
    };

    return fibIter(1, 0, 0, 1, n);
};


