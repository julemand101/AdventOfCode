// --- Day 10: Pipe Maze ---
// https://adventofcode.com/2023/day/10

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2023/day10.dart';
import 'package:test/test.dart';

final input = getInput(2023, 10).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
.....
.S-7.
.|.|.
.L-J.
.....
'''
              .toLinesList(),
        ),
        equals(4),
      );
    });
    test('Example 2', () {
      expect(
        solveA(
          r'''
..F7.
.FJ|.
SJ.L7
|F--J
LJ...
'''
              .toLinesList(),
        ),
        equals(8),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  }, skip: true);
}
