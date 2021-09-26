const slowMul = (a, b) => {
    if (b == 0) return 0;
    else {
        return a + slowMul(a , b - 1);
    }
};

const double = (x) => x * 2;
const halve = (x) => x / 2;
const even = (x) => x % 2 === 0;

// recursive process
const fastMul = (a, b) => {
    if (b == 0) {
        return 0;
    } else if (even(b)) {
        return bouble(fastMul(a, halve(2)));
    } else {
        return a + fastMul(a, b - 1);
    }
};

// iterative process
const fastMulAlt = (a, b) => {
    let iterative = (acc, x, y) => {
        if (y == 0) {
            return acc;
        } else if (even(y)) {
            return iterative(acc, double(x), halve(y));
        } else {
            return iterative(acc + x, double(x), halve(y) - 0.5);
        }
    }
    return iterative(0, a, b);
};