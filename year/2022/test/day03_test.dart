// --- Day 3: Rucksack Reorganization ---
// https://adventofcode.com/2022/day/3

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day03.dart';
import 'package:test/test.dart';

final input = getInput(2022, 03).readAsLinesSync();

final example =
    r'''
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(157));
    });
    test('Solution', () {
      expect(solveA(input), equals(7766));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(70));
    });
    test('Solution', () {
      expect(solveB(input), equals(2415));
    });
  });
}
