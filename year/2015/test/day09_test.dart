// --- Day 9: All in a Single Night ---
// https://adventofcode.com/2015/day/9

import 'package:advent_of_code_2015/day09.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 09).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141
'''
              .asLines,
        ),
        equals(605),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(117));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141
'''
              .asLines,
        ),
        equals(982),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(909));
    });
  });
}
