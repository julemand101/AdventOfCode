// --- Day 12: Hill Climbing Algorithm ---
// https://adventofcode.com/2022/day/12

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day12.dart';
import 'package:test/test.dart';

final input = getInput(2022, 12).readAsLinesSync();

final example =
    r'''
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(31));
    });
    test('Solution', () {
      expect(solveA(input), equals(528));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(29));
    });
    test('Solution', () {
      expect(solveB(input), equals(522));
    });
  });
}
