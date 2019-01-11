
var map = function(proc, list) {
    
    var mappedResult = [];
    if (list.length == 0) {
        return mappedResult;
    } else {
        mappedResult.push(proc(list[0]));
        return mappedResult.concat(map(proc, list.slice(1, list.length)));
    }
}

var filter = function(pred, list) {
    
    var filteredResult = [];
    if (list.length == 0) {
        return filteredResult;
    } else {
        if (pred(list[0])) {
            filteredResult.push(list[0]);
        }
        return filteredResult.concat(filter(pred, list.slice(1, list.length)));
    }
}

var forEach = function(proc, list) {
    if (list.length == 0) {
        console.log("completed processing of all elements in the input list");
        return;
    }
    proc(list[0]);
    forEach(proc, list.slice(1, list.length));
}

var accumulate = function(ops, initial, list) {

    if (list.length == 0) {
        return initial;
    } else {
        return ops(list[0], accumulate(ops, initial, list.slice(1, list.length)));
    }
}
