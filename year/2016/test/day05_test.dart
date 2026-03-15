// --- Day 5: How About a Nice Game of Chess? ---
// https://adventofcode.com/2016/day/5

import 'package:advent_of_code_2016/day05.dart';
import 'package:test/test.dart';

const input = r'wtnhxymk';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('abc'), equals('18f47a30'));
    });
    test('Solution', () {
      expect(solveA(input), equals('2414bc77'));
    });
  }, skip: true);
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('abc'), equals('05ace8e3'));
    });
    test('Solution', () {
      expect(solveB(input), equals('437e60fc'));
    });
  });
}
