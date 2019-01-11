
var average = function(a, b) {
    return (a + b) / 2;
}

/**
 * checks if the supplied arguments are within the given tolerance.
 * @param {real number} guess 
 * @param {real number} nextGuess 
 * @returns {boolean} true if within tolerance, else false. 
 */

var closeEnough = function(guess, nextGuess) {
    if (abs(guess - nextGuess) < 0.0001) {
        return true;
    } else {
        return false;
    }
}

/**
 * computes the roots of a function. 
 * x is a root of f if f(x) = 0.
 * for more info, look at SICP/Ch1/roots-of-equation-half-interval.rkt in the repo.
 * @param {function} func 
 * @param {negative real number} negPoint 
 * @param {positive real number} posPoint
 * @return {real number} x where f(x) = 0 or close to zero as defined by closeEnough function. 
 */

var rootsOfEquation = function(func, negPoint, posPoint) {
    var midPoint = average(negPoint, posPoint);

    if (closeEnough(negPoint, posPoint)) {
        return midPoint;
    } else {

        var testResult = func(midPoint);
        if (testResult > 0) {
            return rootsOfEquation(func, negPoint, midPoint);
        } else if (testResult < 0) {
            return rootsOfEquation(func, midPoint, posPoint);
        } else {
            return midPoint;
        }
    }
}

/**
 * checks the sign of values computed of the arguments and calls rootsOfEquation function with correct order of arguments.
 * @param {function} func 
 * @param {real number} a 
 * @param {real number} b 
 * @returns {real number} roots of equation computed by rootsOfEquation function.
 */

var halfInterval = function(func, a, b) {
    var aValue = func(a);
    var bValue = func(b);
    
    if (aValue < 0 && bValue > 0) {
        return rootsOfEquation(func, a, b);
    } else if (aValue > 0 && bValue < 0) {
       return rootsOfEquation(func, b, a);
    } else {
        return "provided arguments have same sign values. Cannot compute roots.";
    }
}