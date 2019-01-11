
var append = function(list1, list2) {
    var resultList = list1;

    if (list2.length == 0) {
        return resultList;
    } else {
        resultList.push(list2[0])
        append(resultList, list2.slice(1, list2.length));
    }
    return resultList;
}

var flattenArray = function(array) {
    
    var elementCheck = array[0];
    var flatArray = [];
    if (Array.isArray(elementCheck) && elementCheck !== null) {
        return flattenArray(elementCheck);
    } else if (array.length > 0 && elementCheck !== null) {
        flatArray.push(elementCheck);
        return append(flatArray, flattenArray(array.slice(1, array.length)));
    } else {
        return flatArray;
    }
}