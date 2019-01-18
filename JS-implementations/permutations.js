
var map = function(proc, list) {
    var mappedList = [];
    for (var i = 0; i < list.length; i++) {
        mappedList[i] = proc(list[i]);
    }
    return mappedList; 
}

var accumulate = function(proc, initial, list) {
    var result = [];
    for (var i = 0; i < list.length; i=i+2) {
        if (list[i + 1]) {
            result = proc(result, proc(list[i], list[i + 1])); 
        } else {
            result = proc(result, proc(list[i], initial));
        }
    }
    return result;
}

