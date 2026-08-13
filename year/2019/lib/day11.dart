// --- Day 11: Space Police ---
// https://adventofcode.com/2019/day/11

import 'dart:math';

import 'intcode_computer.dart';

enum Direction {
  up,
  right,
  down,
  left;

  Direction changeDirection(int move) {
    const int left = 0;
    const int right = 1;

    if (move != left && move != right) {
      throw Exception('$move is not a valid move!');
    }

    return switch (this) {
      Direction.up => (move == left) ? Direction.left : Direction.right,
      Direction.right => (move == left) ? Direction.up : Direction.down,
      Direction.down => (move == left) ? Direction.right : Direction.left,
      Direction.left => (move == left) ? Direction.down : Direction.up,
    };
  }
}

extension type Point._(({int x, int y}) p) {
  factory(int x, int y) => Point._((x: x, y: y));

  int get x => p.x;

  int get y => p.y;

  Point move(Direction direction) => switch (direction) {
    Direction.up => Point(x, y - 1),
    Direction.right => Point(x + 1, y),
    Direction.down => Point(x, y + 1),
    Direction.left => Point(x - 1, y),
  };
}

int solveA(String intcodeProgram) => paint(intcodeProgram, 0).length;

String solveB(String intcodeProgram) {
  final area = paint(intcodeProgram, 1);

  var maxX = 0, maxY = 0;
  for (final mapEntry in area.entries) {
    if (mapEntry.value == 1) {
      maxX = max(maxX, mapEntry.key.x);
      maxY = max(maxY, mapEntry.key.y);
    }
  }

  final grid = List.generate(
    maxY + 1,
    (_) => List.generate(maxX + 1, (_) => ' '),
  );

  for (final mapEntry in area.entries) {
    if (mapEntry.value == 1) {
      grid[mapEntry.key.y][mapEntry.key.x] = '█';
    }
  }

  final sb = StringBuffer();
  for (final line in grid) {
    sb.writeAll(line);
    sb.writeln();
  }

  return sb.toString();
}

Map<Point, int> paint(String intcodeProgram, int startColor) {
  final computer = IntcodeComputer.fromString(intcodeProgram);
  final panels = <Point, int>{};

  var currentPosition = Point(0, 0);
  var currentDirection = Direction.up;

  final input = <int>[startColor];
  final outputPair = <int>[];

  for (final out in computer.compute(input: input, removeFromList: false)) {
    outputPair.add(out);

    if (outputPair.length == 2) {
      final color = outputPair[0];
      final leftOrRight = outputPair[1];

      panels[currentPosition] = color;
      currentDirection = currentDirection.changeDirection(leftOrRight);
      currentPosition = currentPosition.move(currentDirection);

      // Change input to color of new position
      input[0] = panels.putIfAbsent(currentPosition, () => 0);
      outputPair.clear();
    }
  }

  return panels;
}
