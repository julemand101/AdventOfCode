// --- Day 6: Lanternfish ---
// https://adventofcode.com/2021/day/6

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day06.dart';
import 'package:test/test.dart';

final input = getInput(2021, 06).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('3,4,3,1,2'), equals(5934));
    });
    test('Solution', () {
      expect(solveA(input), equals(388419));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('3,4,3,1,2'), equals(26984457539));
    });
    test('Solution', () {
      expect(solveB(input), equals(1740449478328));
    });
  });
}
