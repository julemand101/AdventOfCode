// --- Day 18: Like a Rogue ---
// https://adventofcode.com/2016/day/18

import 'package:advent_of_code_2016/day18.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 18).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('..^^.', rows: 3), equals(6));
    });
    test('Example 2', () {
      expect(solveA('.^^.^.^^^^', rows: 10), equals(38));
    });
    test('Solution', () {
      expect(solveA(input, rows: 40), equals(1961));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveA(input, rows: 400000), equals(20000795));
    });
  });
}
