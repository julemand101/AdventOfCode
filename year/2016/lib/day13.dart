// --- Day 13: A Maze of Twisty Little Cubicles ---
// https://adventofcode.com/2016/day/13

import 'dart:collection';

typedef Point = ({int x, int y});

extension on Point {
  Point get up => (x: x, y: y - 1);

  Point get down => (x: x, y: y + 1);

  Point get left => (x: x - 1, y: y);

  Point get right => (x: x + 1, y: y);
}

int solveA(int input, {required Point target}) =>
    solve(input, (point, _) => point == target).steps;

int solveB(int input) => solve(input, (_, value) => value == 50).mapLength;

({int steps, int mapLength}) solve(
  int input,
  bool Function(Point point, int value) stopWhen,
) {
  final map = <Point, int>{(x: 1, y: 1): 0};
  final queue = Queue<Point>()..add((x: 1, y: 1));

  while (queue.isNotEmpty) {
    final point = queue.removeFirst();
    final value = map[point]!;

    if (stopWhen(point, value)) {
      return (steps: value, mapLength: map.length);
    }

    void handlePoint(Point p) {
      if (!isWall(p.x, p.y, input) && !map.containsKey(p)) {
        map[p] = value + 1;
        queue.add(p);
      }
    }

    handlePoint(point.up);
    handlePoint(point.down);
    handlePoint(point.left);
    handlePoint(point.right);
  }

  throw 'Failed finding result';
}

bool isWall(int x, int y, int input) =>
    x < 0 ||
    y < 0 ||
    countSetBits((x * x + 3 * x + 2 * x * y + y + y * y) + input).isOdd;

// TODO: Can be replaced with int.oneBitCount in Dart 3.13
int countSetBits(int n) {
  int count = 0;
  while (n != 0) {
    n &= (n - 1);
    count++;
  }
  return count;
}
