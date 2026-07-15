// --- Day 13: A Maze of Twisty Little Cubicles ---
// https://adventofcode.com/2016/day/13

import 'package:advent_of_code_2016/day13.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(10, target: (x: 7, y: 4)), equals(11));
    });
    test('Solution', () {
      expect(solveA(1358, target: (x: 31, y: 39)), equals(96));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(1358), equals(141));
    });
  });
}
