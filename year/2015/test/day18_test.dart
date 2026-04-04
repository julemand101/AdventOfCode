// --- Day 18: Like a GIF For Your Yard ---
// https://adventofcode.com/2015/day/18

import 'package:advent_of_code_2015/day18.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 18).readAsLinesSync();

final exampleInput =
    r'''
.#.#.#
...##.
#....#
..#...
#.#..#
####..
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solve(exampleInput, steps: 4, partB: false), equals(4));
    });
    test('Solution', () {
      expect(solve(input, steps: 100, partB: false), equals(768));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solve(exampleInput, steps: 5, partB: true), equals(17));
    });
    test('Solution', () {
      expect(solve(input, steps: 100, partB: true), equals(781));
    });
  });
}
