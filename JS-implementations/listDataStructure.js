
/*
    Creating a list data structure using pairs, conceptualized as procedures; cons, car, cdr.
*/

const cons = function(a, b) {
    return function(pick) {
        if (pick == 1) return a;
        if (pick == 2) return b;
    };
};

const car = function(pair) {
    return (pair(1));
};

const cdr = function(pair) {
    return (pair(2));
};

const list = function(...n) {
    let argumentArray = n;
    
    let buildList = function(arr) {
        if (typeof(arr) !== 'object' || arr.length == 0) return cons(arr, "end");
        return cons(arr.shift(), buildList(arr));
    };
    return buildList(argumentArray);
};

const testCase = function() {
    let testList = list(1, 2, 3);

    let firstElement = car(testList);
    let secondElement = car(cdr(testList));
    let thirdElement = car(cdr(cdr(testList)));

    return firstElement == 1 && secondElement == 2 && thirdElement == 3 ? "success" : "failure";
};

testCase();
