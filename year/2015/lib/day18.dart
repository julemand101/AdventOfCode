// --- Day 18: Like a GIF For Your Yard ---
// https://adventofcode.com/2015/day/18

import 'dart:typed_data';

int solve(List<String> input, {required int steps, required bool partB}) {
  var grid = Grid(input[0].length, input.length, partB);

  for (final (y, line) in input.indexed) {
    for (var x = 0; x < line.length; x++) {
      grid.setValue(x, y, line[x] == '#');
    }
  }

  var next = Grid(grid.xSize, grid.ySize, partB);

  for (var step = 0; step < steps; step++) {
    for (var y = 0; y < grid.ySize; y++) {
      for (var x = 0; x < grid.xSize; x++) {
        final count = grid.turnedOnLightsAround(x, y);

        if (grid.get(x, y)) {
          next.setValue(x, y, count == 2 || count == 3);
        } else {
          next.setValue(x, y, count == 3);
        }
      }
    }

    (grid, next) = (next, grid);
  }

  var count = 0;
  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0; x < grid.xSize; x++) {
      if (grid.get(x, y)) count++;
    }
  }

  return count;
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;
  final bool partB;

  Grid(this.xSize, this.ySize, this.partB) : list = Uint8List(xSize * ySize);

  bool get(int x, int y) {
    // Simulate stuck on corners
    if (partB &&
        ((x == 0 && y == 0) ||
            (x == xSize - 1 && y == 0) ||
            (x == 0 && y == ySize - 1) ||
            (x == xSize - 1 && y == ySize - 1))) {
      return true;
    }

    if (x < 0 || x >= xSize || y < 0 || y >= ySize) {
      return false;
    }
    return list[_listIndexOf(x, y)] == 1;
  }

  void setValue(int x, int y, bool value) =>
      list[_listIndexOf(x, y)] = value ? 1 : 0;

  int _listIndexOf(int x, int y) => x + (y * xSize);

  int turnedOnLightsAround(int x, int y) {
    var sum = 0;

    if (get(x - 1, y - 1)) sum++;
    if (get(x, y - 1)) sum++;
    if (get(x + 1, y - 1)) sum++;

    if (get(x - 1, y)) sum++;
    if (get(x + 1, y)) sum++;

    if (get(x - 1, y + 1)) sum++;
    if (get(x, y + 1)) sum++;
    if (get(x + 1, y + 1)) sum++;

    return sum;
  }

  @override
  String toString() {
    final sb = StringBuffer();

    for (var y = 0; y < ySize; y++) {
      for (var x = 0; x < xSize; x++) {
        sb.write(get(x, y) ? '#' : '.');
      }
      sb.writeln();
    }

    return sb.toString();
  }
}
