// --- Day 2: Rock Paper Scissors ---
// https://adventofcode.com/2022/day/2

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day02.dart';
import 'package:test/test.dart';

final input = getInput(2022, 02).readAsLinesSync();

final example =
    r'''
A Y
B X
C Z
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(15));
    });
    test('Solution', () {
      expect(solveA(input), equals(8392));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(12));
    });
    test('Solution', () {
      expect(solveB(input), equals(10116));
    });
  });
}
