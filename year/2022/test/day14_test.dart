// --- Day 14: Regolith Reservoir ---
// https://adventofcode.com/2022/day/14

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day14.dart';
import 'package:test/test.dart';

final input = getInput(2022, 14).readAsLinesSync();

final example =
    r'''
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(24));
    });
    test('Solution', () {
      expect(solveA(input), equals(768));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(93));
    });
    test('Solution', () {
      expect(solveB(input), equals(26686));
    });
  });
}
