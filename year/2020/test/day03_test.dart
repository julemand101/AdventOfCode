// --- Day 3: Toboggan Trajectory ---
// https://adventofcode.com/2020/day/3

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day03.dart';
import 'package:test/test.dart';

final input = getInput(2020, 03).readAsLinesSync();

final example =
    r'''
..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(7));
    });
    test('Solution', () {
      expect(solveA(input), equals(216));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(336));
    });
    test('Solution', () {
      expect(solveB(input), equals(6708199680));
    });
  });
}
