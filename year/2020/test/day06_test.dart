// --- Day 6: Custom Customs ---
// https://adventofcode.com/2020/day/6

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day06.dart';
import 'package:test/test.dart';

final input = getInput(2020, 06).readAsLinesSync();

final example =
    r'''
abc

a
b
c

ab
ac

a
a
a
a

b
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(11));
    });
    test('Solution', () {
      expect(solveA(input), equals(6416));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(6));
    });
    test('Solution', () {
      expect(solveB(input), equals(3050));
    });
  });
}
