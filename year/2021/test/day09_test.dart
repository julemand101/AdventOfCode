// --- Day 9: Smoke Basin ---
// https://adventofcode.com/2021/day/9

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day09.dart';
import 'package:test/test.dart';

final input = getInput(2021, 09).readAsLinesSync();

final example =
    r'''
2199943210
3987894921
9856789892
8767896789
9899965678
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(15));
    });
    test('Solution', () {
      expect(solveA(input), equals(631));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(1134));
    });
    test('Solution', () {
      expect(solveB(input), equals(821560));
    });
  });
}
