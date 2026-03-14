// --- Day 4: Camp Cleanup ---
// https://adventofcode.com/2022/day/4

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day04.dart';
import 'package:test/test.dart';

final input = getInput(2022, 04).readAsLinesSync();

final example =
    r'''
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(2));
    });
    test('Solution', () {
      expect(solveA(input), equals(424));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(4));
    });
    test('Solution', () {
      expect(solveB(input), equals(804));
    });
  });
}
