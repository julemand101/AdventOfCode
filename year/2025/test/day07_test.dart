// --- Day 7: Laboratories ---
// https://adventofcode.com/2025/day/7

import 'package:advent_of_code_2025/day07.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2025, 07).readAsLinesSync();

final example =
    r'''
.......S.......
...............
.......^.......
...............
......^.^......
...............
.....^.^.^.....
...............
....^.^...^....
...............
...^.^...^.^...
...............
..^...^.....^..
...............
.^.^.^.^.^...^.
...............
'''
        .asLines
        .toList(growable: false);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(21));
    });
    test('Solution', () {
      expect(solveA(input), equals(1518));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(40));
    });
    test('Solution', () {
      expect(solveB(input), equals(25489586715621));
    });
  });
}
