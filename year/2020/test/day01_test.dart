// --- Day 1: Report Repair ---
// https://adventofcode.com/2020/day/1

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day01.dart';
import 'package:test/test.dart';

final input = getInput(2020, 01).readAsLinesSync();

final example =
    r'''
1721
979
366
299
675
1456
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(514579));
    });
    test('Solution', () {
      expect(solveA(input), equals(972576));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(241861950));
    });
    test('Solution', () {
      expect(solveB(input), equals(199300880));
    });
  });
}
