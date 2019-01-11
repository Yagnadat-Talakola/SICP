
var computeFunction = function(f, g) {
    return function(x) {
        return (f(g(x)));
    };
}

var square = function(x) {
    return (x * x);
}

var cube = function(x) {
    return (x * x * x);
}

var squareFn = computeFunction(square);
squareFn(2);

var applyFn = computeFunction(square, cube);
applyFn(2);
