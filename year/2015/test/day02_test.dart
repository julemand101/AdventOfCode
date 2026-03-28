// --- Day 2: I Was Told There Would Be No Math ---
// https://adventofcode.com/2015/day/2

import 'package:advent_of_code_2015/day02.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 02).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['2x3x4']), equals(58));
    });
    test('Example 2', () {
      expect(solveA(const ['1x1x10']), equals(43));
    });
    test('Solution', () {
      expect(solveA(input), equals(1586300));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['2x3x4']), equals(34));
    });
    test('Example 2', () {
      expect(solveB(const ['1x1x10']), equals(14));
    });
    test('Solution', () {
      expect(solveB(input), equals(3737498));
    });
  });
}
