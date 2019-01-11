
var map = function(proc, array) {
    var resultArray = [];

    for (var i = 0; i < array.length; i++) {
        resultArray[i] = proc(array[i]);
    }

    return resultArray;
};

map((x => (x * x)), [1, 2, 3]);

var reverse = function(array) {
    var length = array.length;
    var reversedArray = [];

    for (var i = 0; i < array.length; i++) {
        reversedArray[length - (i + 1)] = array[i];
    } 

    return reversedArray;
}

var deepReverse = function(array) {
    if (Array.isArray(array)) {
       return reverse(map(deepReverse, array));
    } else {
        return array
    }
}