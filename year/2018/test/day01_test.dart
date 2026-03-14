// --- Day 1: Chronal Calibration ---
// https://adventofcode.com/2018/day/1

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day01.dart';

final input = getInput(2018, 01).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['+1', '+1', '+1']), equals(3));
    });
    test('Example 2', () {
      expect(solveA(const ['+1', '+1', '-2']), equals(0));
    });
    test('Example 3', () {
      expect(solveA(const ['-1', '-2', '-3']), equals(-6));
    });
    test('Solution', () {
      expect(solveA(input), equals(406));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['+1', '-1']), equals(0));
    });
    test('Example 2', () {
      expect(solveB(const ['+3', '+3', '+4', '-2', '-4']), equals(10));
    });
    test('Example 3', () {
      expect(solveB(const ['-6', '+3', '+8', '+5', '-6']), equals(5));
    });
    test('Example 4', () {
      expect(solveB(const ['+7', '+7', '-2', '-7', '-4']), equals(14));
    });
    test('Solution', () {
      expect(solveB(input), equals(312));
    });
  });
}
