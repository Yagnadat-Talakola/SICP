
/**
 * @returns {real number} absolute value of a given integer.
 * @param {real number} v 
 */
var abs = function(v) {
    if (v >= 0) {
        return v;
    } else {
        return -v;
    }
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
 * computes the fixed-point of a function. 
 * fixed-point of a function is x, if f(x) = x
 * @param {function} func 
 * @param {real number} firstGuess. The first supplied guess. 
 * @returns {real number} fixed point of the function. 
 */

var fixedPoint = function(func, firstGuess) {
    var nextGuess = func(firstGuess);

    if (closeEnough(firstGuess, nextGuess)) {
        return nextGuess;
    } else {
        return fixedPoint(func, nextGuess);
    }
}