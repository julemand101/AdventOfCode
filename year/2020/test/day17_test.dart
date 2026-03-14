// --- Day 17: Conway Cubes ---
// https://adventofcode.com/2020/day/17

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day17.dart';
import 'package:test/test.dart';

final input =
    r'''
.#.#.#..
..#....#
#####..#
#####..#
#####..#
###..#.#
#..##.##
#.#.####
'''
        .asLinesList;

final example =
    r'''
.#.
..#
###
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(112));
    });
    test('Solution', () {
      expect(solveA(input), equals(375));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(848));
    });
    test('Solution', () {
      expect(solveB(input), equals(2192));
    });
  });
}
