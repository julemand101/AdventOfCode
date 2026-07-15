// --- Day 14: One-Time Pad ---
// https://adventofcode.com/2016/day/14

import 'package:advent_of_code_2016/day14.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(r'abc'), equals(22728));
    });
    test('Solution', () {
      expect(solveA(r'ahsbgdzn'), equals(23890));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(r'abc'), equals(22551));
    });
    test('Solution', () {
      expect(solveB(r'ahsbgdzn'), equals(22696));
    });
  });
}
