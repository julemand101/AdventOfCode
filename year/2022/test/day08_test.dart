// --- Day 8: Treetop Tree House ---
// https://adventofcode.com/2022/day/8

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day08.dart';
import 'package:test/test.dart';

final input = getInput(2022, 08).readAsLinesSync();

final example =
    r'''
30373
25512
65332
33549
35390
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(21));
    });
    test('Solution', () {
      expect(solveA(input), equals(1814));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(8));
    });
    test('Solution', () {
      expect(solveB(input), equals(330786));
    });
  });
}
