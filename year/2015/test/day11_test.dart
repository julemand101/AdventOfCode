// --- Day 11: Corporate Policy ---
// https://adventofcode.com/2015/day/11

import 'package:advent_of_code_2015/day11.dart';
import 'package:test/test.dart';

const input = r'vzbxkghb';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(r'abcdefgh'), equals(r'abcdffaa'));
    });
    test('Example 2', () {
      expect(solveA(r'ghijklmn'), equals(r'ghjaabcc'));
    });
    test('Solution', () {
      expect(solveA(input), equals(r'vzbxxyzz'));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveA(solveA(input)), equals(r'vzcaabcc'));
    });
  });
}
