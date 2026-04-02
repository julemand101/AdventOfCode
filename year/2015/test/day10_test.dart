// --- Day 10: Elves Look, Elves Say ---
// https://adventofcode.com/2015/day/10

import 'package:advent_of_code_2015/day10.dart';
import 'package:test/test.dart';

const input = '3113322113';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solve('1'), equals(2));
    });
    test('Example 2', () {
      expect(solve('11'), equals(2));
    });
    test('Example 3', () {
      expect(solve('21'), equals(4));
    });
    test('Example 4', () {
      expect(solve('1211'), equals(6));
    });
    test('Example 5', () {
      expect(solve('111221'), equals(6));
    });
    test('Solution', () {
      expect(solve(input, iterations: 40), equals(329356));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, iterations: 50), equals(4666278));
    });
  });
}
