// --- Day 6: Chronal Coordinates ---
// https://adventofcode.com/2018/day/6

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day06.dart';

final input = getInput(2018, 06).readAsLinesSync();

final example =
    r'''
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(17));
    });
    test('Solution', () {
      expect(solveA(input), equals(3569));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example, 32), equals(16));
    });
    test('Solution', () {
      expect(solveB(input, 10000), equals(48978));
    });
  });
}
