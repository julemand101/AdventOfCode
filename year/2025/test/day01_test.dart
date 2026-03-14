// --- Day 1: Secret Entrance ---
// https://adventofcode.com/2025/day/1

import 'package:advent_of_code_2025/day01.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2025, 01).readAsLinesSync();

final example =
    r'''
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(3));
    });
    test('Solution', () {
      expect(solveA(input), equals(969));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(6));
    });
    test('Solution', () {
      expect(solveB(input), equals(5887));
    });
  });
}
