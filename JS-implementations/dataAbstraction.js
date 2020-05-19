
/*
    Conceptualizing a simplified data structure (pair) representation as procedural entities.
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

const testCase1 = function() {
    let testPair = cons(1, 2);
    let testResult = car(testPair) == 1 && cdr(testPair) == 2 ? "test passed" : "test failed";
    return testResult;
}

/*
    Representing point(x, y) as a procedural representation using cons, car, and cdr.
*/

/*
    Constructor:
    @args: x, y coordinates
    @return: point
*/
const makePoint = function(x, y) {
    return cons(x, y);
};

/* 
    Selector:
    @args: point
    @return: xCoordinate
*/
const xCoordinate = function(p) {
    return car(p);
};

/*
    Selector:
    @args: point
    @return: yCoordinate
*/
const yCoordinate = function(p) {
    return cdr(p);
};

// Operations on point(x, y)
/*
    @args: p1(x1, y1), p2(x2, y2)
    @return: distance between two points in 2-d coordinate system.
*/
const distanceBetweenPoints = function(p1, p2) {
    let xCoordinateP1 = xCoordinate(p1);
    let yCoordinateP1 = yCoordinate(p1);

    let xCoordinateP2 = xCoordinate(p2);
    let yCoordinateP2 = yCoordinate(p2);

    return (squareRoot(
        square(xCoordinateP1 - xCoordinateP2) + square(yCoordinateP1 - yCoordinateP2)
    ));
};


/*
    Representing line segment as a pair of points(p1, p2) using cons, car, and cdr. 
*/

/*
    Constructor:
    @args: p1, p2 points
    @return: line segment made up of points p1, p2.
*/
const makeLineSegment = function(p1, p2) {
    return cons(p1, p2);
};

/* 
    Selector:
    @args: line segment
    @return: starting point of the line segment
*/
const startSegment = function(l1) {
    return car(l1);
};

/* 
    Selector:
    @args: line segment 
    @return: ending point of the line segment.
*/
const endSegment = function(l2) {
    return cdr(l2);
};

// Operations on a line segment.
/*
    @args: line segment l1
    @return: length of l1 in 2-d coordinate system.
*/
const lengthOfLineSegment = function(l1) {
    let startSegment = startSegment(l1);
    let endSegment = endSegment(l1);

    return distanceBetweenPoints(startSegment, endSegment);
};

/*
    Representing a triangle as an entity of three points. 
*/
const makeTriangle = function(p1, p2, p3) {
    return cons(p1, cons(p2, p3));
};

/* 
    Selector:
    @args: triangle
    @return: point(vertex 1) of triangle
*/
const vertex1 = function(t1) {
    return car(t1);
};

/* 
    Selector:
    @args: triangle
    @return: point(vertex 2) of triangle
*/
const vertex2 = function(t1) {
    return car(cdr(t1));
};

/* 
    Selector:
    @args: triangle
    @return: point(vertex 3) of triangle
*/
const vertex3 = function(t1) {
    return cdr(cdr(t1));
};

const perimeterOfTriangle = function(t1) {
    let lengthOfSide1 = distanceBetweenPoints(vertex1(t1), vertex2(t1));
    let lengthOfSide2 = distanceBetweenPoints(vertex2(t1), vertex3(t1));
    let lengthOfSide3 = distanceBetweenPoints(vertex3(t1), vertex1(t1));

    return (lengthOfSide1 + lengthOfSide2 + lengthOfSide3);
}

const areaOfTriangle = function(t1) {
    let p = perimeterOfTriangle(t1) / 2;

    let a = distanceBetweenPoints(vertex1(t1), vertex2(t1));
    let b = distanceBetweenPoints(vertex2(t1), vertex3(t1));
    let c = distanceBetweenPoints(vertex3(t1), vertex1(t1));

    return (sqrt(p * (p - a) * (p - b) * (p - c)));
};


















