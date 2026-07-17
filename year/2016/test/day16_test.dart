// --- Day 16: Dragon Checksum ---
// https://adventofcode.com/2016/day/16

import 'package:advent_of_code_2016/day16.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('10000', diskSize: 20), equals('01100'));
    });
    test('Solution', () {
      expect(
        solveA('01111001100111011', diskSize: 272),
        equals('11111000111110000'),
      );
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solveA('01111001100111011', diskSize: 35651584),
        equals('10111100110110100'),
      );
    });
  });
}
