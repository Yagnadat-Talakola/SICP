
/*
    Greatest Common Divisors: GCD(a , b) -> the largest integer that divides both a and b with no remainder.
    
    EUCLID's ALGORITHM
    If r is the remainder when a is divided by b, then the common divisors of a and b are precisely the same
    as the common divisors of b and r. 

    GCD(a, b) = GCD(b, r)

    The function below generates an iterative process, whose number of steps grows as the logarithm of the numbers
    involved.
*/

const gcdAlgo = (a, b) => {
    let remainder = () => {
        return a % b;
    };
    
    if (b == 0) {
        return a;
    } else {
        return gcdAlgo(b, remainder(a, b));
    }
};


/*
    Testing for Primality
*/

// The straightforward way of finding the smallest divisor of a given number, n. 
const smallestDivisor = (n) => {
    let square = (x) => x * x;

    let divides = (x, y) => x % y === 0;

    let findDivisor = (testDivisor) => {
        if (square(testDivisor) > n) {
            return n;
        } else if (divides(n, testDivisor)) {
            return testDivisor;
        } else {
            return findDivisor(testDivisor + 1);
        }
    }
    // 2 being the starting divisor to begin with. 
    return findDivisor(2);
};

// Prime function 
const isPrime =  (n) => smallestDivisor(n) === n;
