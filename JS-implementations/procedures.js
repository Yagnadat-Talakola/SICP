const newIf = function(predicate, thenClause, elseClause) {
    if (predicate) {
        return thenClause();
    } else {
       return elseClause();
    }
};

const sqrtIter = function(guess, x) {
    return newIf(goodEnough(guess, x), guess, sqrtIter(improve(guess, x), x));
};

const newSqrtIter = function(guess, x) {
    if (goodEnough(guess, x)) {
        return guess;
    } else {
        return sqrtIter(improve(guess, x), x);
    }
}
const sqrt = function(x) {
    return newSqrtIter(1, x);
}

const improve = function(guess, x) {
    return average(guess, x / guess);
};

const average = function(x, y) {
    return (x + y) / 2;
};

const goodEnough = function(guess, x) {
    if (Math.abs(square(guess) - x) < 0.001) {
        return true;
    } else {
        return false;
    }
};

const square = function(x) {
    return x * x;
};

const sum = function(a, b) {
    if (a == 0) {
        return b;
    } else {
        return increment(sum(decrement(a), b));
    }
};

const increment = function(x) {
    return x + 1;
};

const decrement = function(x) {
    return x - 1;
};

const altSum = function(a, b) {
    if (a == 0) {
        return b;
    } else {
        return sum(decrement(a), increment(b));
    }
};

// computing fibonnacci sequence in a recursive process (tree recursion)
const fibonacci = function(n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
};


// computing fibonnacci sequence in a iterative process
const altFibonacci = function(n) {
    return fibonacciIter(1, 0, n);
};

const fibonacciIter = function(a, b, count) {
    if (count == 0) {
        return b;
    } else {
        return fibonacciIter((a + b), a, (count - 1));
    }

};

const pascal = function(row, col) {
    if (col == 1 || col == row) return 1;
    if (col == 0 || row == 0) return 0;
    else return (pascal(row - 1, col - 1) + pascal(row - 1, col));
}



// compute sum of terms from position a to b
const sum = function(term, a, next, b) {
    if (a > b) return 0;
    return term(a) + sum (term, next(a), next, b);
}

const cubeTerm = function(x) {
    return x * x * x;
}

const increment = function(x) {
    return x + 1;
}

const sumOfCubes = function(a, b) {
    return sum(cubeTerm, a, increment, b);
}

const product = function(term, a, next, b) {
    if (a > b) return 1;
    return (term(a) * product(term, next(a), next, b));
}

const accumulate = function(combiner, nullValue, term, a, next, b) {
    if (a > b) return nullValue;
    return combiner(term(a), accumulate(combiner, nullValue, term, next(a), next, b));
}

const add = function(a, b) {
    return a + b;
}

const multiply = function(a, b) {
    return a * b;
}

const identity = function(x) {
    return x;
}

const sumAlt = function(a, b) {
    return accumulate(add, 0, identity, a, increment, b);
} 

const productAlt = function(a, b) {
    return accumulate(multiply, 1, identity, a, increment, b);
}

const filteredAccmulate = function(filter, combiner, nullValue, term, a, next, b) {
    if (a > b) return nullValue;
    if (filter(term(a))) {
        return accumulate(combiner, nullValue, term, a, next, b);
    }
}

const avgDamp = function(f) {
    return (x) => (x + f(x)) / 2;
}

const compose = function(f, g) {
    return (x) => f(g(x));
}

const repeated = function(f, n) {
    return function(x) {
        if (n == 1) return f(x);
        return compose(f, repeated(f, n - 1))(x);
    }
}

const testCase = function() {
    return repeated(square, 2)(5) == 625 ? "success" : "failure";
};

testCase();

/*
    f: method for telling if a guess is good enough. f(guess) returns true if guess is good enough.
    g: method for improving guess
    @return: procedure that takes guess as argument, and keeps improving the guess until it is good enough. 

*/
const iterativeImprove = function(f, g) {
    return function(guess) {
        if (f(guess)) {
            return guess;
        } else {
            return iterativeImprove(f, g)(g(guess));
        }
    }
}

/*
    n: number of disks (n being the largest disk)
    source, target, spare: pegs
    Objective is to move n pegs from source to target.  
*/
const towerOfHanoi = function(n, source, target, spare) {
    if (n == 0) return "done";
    return (
        towerOfHanoi(n - 1, source, spare, target),
        console.log(n, source, target),
        towerOfHanoi(n - 1, spare, target, source)
    );
}
