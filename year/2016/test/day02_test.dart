// --- Day 2: Bathroom Security ---
// https://adventofcode.com/2016/day/2

import 'package:advent_of_code_2016/day02.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 02).readAsLinesSync();

final example =
    r'''
ULL
RRDDD
LURDL
UUUUD
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals("1985"));
    });
    test('Solution', () {
      expect(solveA(input), equals("45973"));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals("5DB3"));
    });
    test('Solution', () {
      expect(solveB(input), equals("27CA4"));
    });
  });
}
