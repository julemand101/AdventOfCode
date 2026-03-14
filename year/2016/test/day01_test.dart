// --- Day 1: No Time for a Taxicab ---
// https://adventofcode.com/2016/day/1

import 'package:advent_of_code_2016/day01.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 01).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('R2, L3'), equals(5));
    });
    test('Example 2', () {
      expect(solveA('R2, R2, R2'), equals(2));
    });
    test('Example 3', () {
      expect(solveA('R5, L5, R5, R3'), equals(12));
    });
    test('Solution', () {
      expect(solveA(input), equals(298));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('R8, R4, R4, R8'), equals(4));
    });
    test('Solution', () {
      expect(solveB(input), equals(158));
    });
  });
}
