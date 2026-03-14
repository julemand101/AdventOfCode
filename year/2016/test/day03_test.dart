// --- Day 3: Squares With Three Sides ---
// https://adventofcode.com/2016/day/3

import 'package:advent_of_code_2016/day03.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 03).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['5 10 25']), equals(0));
    });
    test('Solution', () {
      expect(solveA(input), equals(869));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(1544));
    });
  });
}
