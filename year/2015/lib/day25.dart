// --- Day 25: Let It Snow ---
// https://adventofcode.com/2015/day/25

int solveA({required int column, required int row}) {
  var value = 20151125;

  for (var i = 2; true; i++) {
    for (var x = 1, y = i; x <= i; x++, y--) {
      value = (value * 252533).remainder(33554393);

      if (x == column && y == row) {
        return value;
      }
    }
  }
}
