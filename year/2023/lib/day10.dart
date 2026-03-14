// --- Day 10: Pipe Maze ---
// https://adventofcode.com/2023/day/10

import 'dart:typed_data';

const verticalPipe = 124; // |
const horizontalPipe = 45; // -
const northAndEastBend = 76; // L
const northAndWestBend = 74; // J
const southAndWestBend = 55; // 7
const southAndEastBend = 70; // F
const ground = 46; // .
const startingPosition = 83; // S

int solveA(List<String> input) {
  final grid = Grid(input.first.length + 2, input.length + 2)
    ..setFromInput(input);

  final alreadyVisited = <Point>{grid.startingPoint};
  final nextPoints = <Point>[];

  print(alreadyVisited);
  print(nextPoints);

  return 0;
}

extension type const Point._(({int x, int y}) _point) {
  const Point(int x, int y) : this._((x: x, y: y));

  int get x => _point.x;
  int get y => _point.y;

  Point operator +(Point other) => Point(x + other.x, y + other.y);

  Point operator -(Point other) => Point(x - other.x, y - other.y);
}

class Grid {
  final int length, height;
  final Uint8List _list;
  late final Point startingPoint;

  Grid(this.length, this.height) : _list = Uint8List(length * height);

  int getByPoint(Point p) => get(p.x, p.y);
  int get(int x, int y) => _list[_getPos(x, y)];

  void setByPoint(Point p, int value) => set(p.x, p.y, value);
  void set(int x, int y, int value) => _list[_getPos(x, y)] = value;

  int _getPos(int x, int y) => x + (y * length);

  void setFromInput(List<String> input, {int padding = 0}) {
    for (final (y, line) in input.indexed) {
      for (var x = 0; x < line.length; x++) {
        final codeUnit = line.codeUnitAt(x);
        set(x + padding, y + padding, codeUnit);

        if (codeUnit == startingPosition) {
          startingPoint = Point(x + padding, y + padding);
        }
      }
    }
  }
}
