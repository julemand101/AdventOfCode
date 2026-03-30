// --- Day 6: Probably a Fire Hazard ---
// https://adventofcode.com/2015/day/6

import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';

typedef HandleInstruction = void Function(Grid grid, int x, int y);

int solveA(Iterable<String> input) => solve(
  input,
  turnOn: (grid, x, y) => grid.setValue(x, y, 1),
  turnOff: (grid, x, y) => grid.setValue(x, y, 0),
  toggle: (grid, x, y) => grid.toggleValue(x, y),
).list.where((value) => value == 1).length;

int solveB(Iterable<String> input) => solve(
  input,
  turnOn: (grid, x, y) => grid.increaseValue(x, y, 1),
  turnOff: (grid, x, y) => grid.decreaseValue(x, y, 1),
  toggle: (grid, x, y) => grid.increaseValue(x, y, 2),
).list.sum;

final regExp = RegExp(r'(\d+),(\d+) through (\d+),(\d+)');

Grid solve(
  Iterable<String> input, {
  required HandleInstruction turnOn,
  required HandleInstruction turnOff,
  required HandleInstruction toggle,
}) {
  final grid = Grid(1000, 1000);

  for (final line in input) {
    final match = regExp.firstMatch(line)!;
    final fromX = int.parse(match[1]!);
    final fromY = int.parse(match[2]!);
    final toX = int.parse(match[3]!);
    final toY = int.parse(match[4]!);

    if (line.startsWith('turn on')) {
      for (var y = fromY; y <= toY; y++) {
        for (var x = fromX; x <= toX; x++) {
          turnOn(grid, x, y);
        }
      }
    } else if (line.startsWith('turn off')) {
      for (var y = fromY; y <= toY; y++) {
        for (var x = fromX; x <= toX; x++) {
          turnOff(grid, x, y);
        }
      }
    } else if (line.startsWith('toggle')) {
      for (var y = fromY; y <= toY; y++) {
        for (var x = fromX; x <= toX; x++) {
          toggle(grid, x, y);
        }
      }
    } else {
      throw 'Unknown instruction: $line';
    }
  }

  return grid;
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;

  Grid(this.xSize, this.ySize) : list = Uint8List(xSize * ySize);

  int get(int x, int y) => list[_listIndexOf(x, y)];

  void setValue(int x, int y, int value) => list[_listIndexOf(x, y)] = value;

  void increaseValue(int x, int y, int value) =>
      list[_listIndexOf(x, y)] += value;

  void decreaseValue(int x, int y, int value) {
    final pos = _listIndexOf(x, y);
    final oldValue = list[pos];
    list[pos] = max(oldValue - value, 0);
  }

  void toggleValue(int x, int y) {
    final pos = _listIndexOf(x, y);
    list[pos] = list[pos] == 1 ? 0 : 1;
  }

  int _listIndexOf(int x, int y) => x + (y * xSize);
}
