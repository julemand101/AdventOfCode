// --- Day 19: An Elephant Named Joseph ---
// https://adventofcode.com/2016/day/19

import 'package:advent_of_code_2016/day19.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(5), equals(3));
    });
    test('Solution', () {
      expect(solveA(3005290), equals(1816277));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(5), equals(2));
    });
    test('Solution', () {
      expect(solveB(3005290), equals(1410967));
    });
  });
}
