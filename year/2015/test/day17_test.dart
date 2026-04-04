// --- Day 17: No Such Thing as Too Much ---
// https://adventofcode.com/2015/day/17

import 'package:advent_of_code_2015/day17.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 17).readAsLinesSync();

final exampleInput =
    r'''
20
15
10
5
5 
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput, target: 25), equals(4));
    });
    test('Solution', () {
      expect(solveA(input, target: 150), equals(4372));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput, target: 25), equals(3));
    });
    test('Solution', () {
      expect(solveB(input, target: 150), equals(4));
    });
  });
}
