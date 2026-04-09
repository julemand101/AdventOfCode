// --- Day 20: Infinite Elves and Infinite Houses ---
// https://adventofcode.com/2015/day/20

import 'package:advent_of_code_2015/day20.dart';
import 'package:test/test.dart';

const input = 34000000;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(10), equals(1));
    });
    test('Example 2', () {
      expect(solveA(30), equals(2));
    });
    test('Example 3', () {
      expect(solveA(40), equals(3));
    });
    test('Example 4', () {
      expect(solveA(60), equals(4));
    });
    test('Example 5', () {
      expect(solveA(70), equals(4));
    });
    test('Example 6', () {
      expect(solveA(80), equals(6));
    });
    test('Example 7', () {
      expect(solveA(120), equals(6));
    });
    test('Example 8', () {
      expect(solveA(130), equals(8));
    });
    test('Example 9', () {
      expect(solveA(150), equals(8));
    });
    test('Solution', () {
      expect(solveA(input), equals(786240));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(831600));
    });
  });
}
