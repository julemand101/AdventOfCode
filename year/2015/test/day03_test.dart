// --- Day 3: Perfectly Spherical Houses in a Vacuum ---
// https://adventofcode.com/2015/day/3

import 'package:advent_of_code_2015/day03.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 03).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('>'), equals(2));
    });
    test('Example 2', () {
      expect(solveA('^>v<'), equals(4));
    });
    test('Example 3', () {
      expect(solveA('^v^v^v^v^v'), equals(2));
    });
    test('Solution', () {
      expect(solveA(input), equals(2592));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('^v'), equals(3));
    });
    test('Example 2', () {
      expect(solveB('^>v<'), equals(3));
    });
    test('Example 3', () {
      expect(solveB('^v^v^v^v^v'), equals(11));
    });
    test('Solution', () {
      expect(solveB(input), equals(2360));
    });
  });
}
