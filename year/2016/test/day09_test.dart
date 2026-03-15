// --- Day 9: Explosives in Cyberspace ---
// https://adventofcode.com/2016/day/9

import 'package:advent_of_code_2016/day09.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 09).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(r'ADVENT'), equals(6));
    });
    test('Example 2', () {
      expect(solveA(r'A(1x5)BC'), equals(7));
    });
    test('Example 3', () {
      expect(solveA(r'(3x3)XYZ'), equals(9));
    });
    test('Example 4', () {
      expect(solveA(r'A(2x2)BCD(2x2)EFG'), equals(11));
    });
    test('Example 5', () {
      expect(solveA(r'(6x1)(1x3)A'), equals(6));
    });
    test('Example 6', () {
      expect(solveA(r'X(8x2)(3x3)ABCY'), equals(18));
    });
    test('Solution', () {
      expect(solveA(input), equals(99145));
    });
  });
  group('Part One', () {
    test('Example 1', () {
      expect(solveB(r'(3x3)XYZ'), equals(9));
    });
    test('Example 1', () {
      expect(solveB(r'X(8x2)(3x3)ABCY'), equals(20));
    });
    test('Example 1', () {
      expect(solveB(r'(27x12)(20x12)(13x14)(7x10)(1x12)A'), equals(241920));
    });
    test('Example 1', () {
      expect(
        solveB(r'(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN'),
        equals(445),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(10943094568));
    });
  });
}
