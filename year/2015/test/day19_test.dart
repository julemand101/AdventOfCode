// --- Day 19: Medicine for Rudolph ---
// https://adventofcode.com/2015/day/19

import 'package:advent_of_code_2015/day19.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 19).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
H => HO
H => OH
O => HH

HOH
'''
              .asLines,
        ),
        equals(4),
      );
    });
    test('Example 2', () {
      expect(
        solveA(
          r'''
H => HO
H => OH
O => HH

HOHOHO
'''
              .asLines,
        ),
        equals(7),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(576));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(207));
    });
  });
}
