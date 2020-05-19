
/*
    each cell can hold either 0 (white) or 1 (black).
    @args: currentCell, leftNeighbor, rightNeighbor
    @return: new cell value. 
*/

const rule110 = function(currentCell, leftNeighbor, rightNeighbor) {
    let newCellValue = "0";
    if (currentCell == "1" && leftNeighbor == "1" && rightNeighbor == "1") {
        newCellValue = "0";
    }
    if (currentCell == "1" && leftNeighbor == "1" && rightNeighbor == "0") {
        newCellValue = "1";
    }
    if (currentCell == "0" && leftNeighbor == "1" && rightNeighbor == "1") {
        newCellValue = "1";
    }
    if (currentCell == "0" && leftNeighbor == "1" && rightNeighbor == "0") {
        newCellValue = "0";
    }
    if (currentCell == "1" && leftNeighbor == "0" && rightNeighbor == "1") {
        newCellValue = "1";
    }
    if (currentCell == "1" && leftNeighbor == "0" && rightNeighbor == "0") {
        newCellValue = "1";
    }
    if (currentCell == "0" && leftNeighbor == "0" && rightNeighbor == "1") {
        newCellValue = "1";
    }
    if (currentCell == "0" && leftNeighbor == "0" && rightNeighbor == "0") {
        newCellValue = "0";
    }

    return newCellValue;  
}

/*
    @args: fn: rule, a procedure of rules to be implemented on each cell. 
    @return: updated grid with new cell values.

*/
const cellularAutomata = function(rule, cells, steps) {
    
    let intializeGrid = function() {
        let arr = [];
        for (let i = 0; i < cells; i++) {
            arr[i] = "0";
        }
        return arr;
    };

    let startState = function() {
        let grid = intializeGrid(cells);
        grid[Math.round(cells / 2)] = "1";
        return grid;
    };

    let grid = startState();
    let updatedGrid = [];
    let step = 0;

    //grid traversal
    while (step < steps) {

        for (let cell = 1; cell < cells.length - 1; cell++) {
            let leftNeighbor = grid[cell - 1];
            let currentCell =  grid[cell];
            let rightNeighbor = grid[cell + 1];
            
            grid[col] = rule(currentCell, leftNeighbor, rightNeighbor);
        }

        updatedGrid.push(grid);
        grid = updatedGrid[step];
        step++;
    }
    return updatedGrid;
}

