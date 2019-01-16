
var accumulate = function(ops, initial, list) {

    if (list.length == 0) {
        return initial;
    } else {
        return ops(list[0], accumulate(ops, initial, list.slice(1, list.length)));
    }
}

var foldRight = function(ops, initial, list) {
    return accumulate(ops, initial, list);
}

var foldLeft = function(ops, initial, list) {
    var iter = function(result, rest) {
        if (rest.length == 0) {
            return result;
        } else {
            return iter(ops(result, rest[0]), rest.slice(1, list.length)); 
        }
    }
    return iter(initial, list);
}

foldLeft((x, y) => x * y, 1, [1, 2, 3]);

// reverse procedure implemented using foldRight
var reverse = function(list) {
   return foldRight((x, y) => [y].concat([x]), null, list);
}


