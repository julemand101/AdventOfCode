// --- Day 16: Chronal Classification ---
// https://adventofcode.com/2018/day/16

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day16.dart';

final input = getInput(2018, 16).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          '''
Before: [3, 2, 1, 1]
9 2 1 2
After:  [3, 2, 2, 1]
'''
              .asLinesList,
        ),
        equals(1),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(567));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(610));
    });
  });
}
