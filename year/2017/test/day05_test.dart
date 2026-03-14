// --- Day 5: A Maze of Twisty Trampolines, All Alike ---
// https://adventofcode.com/2017/day/5

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day05.dart';

final input = getInput(2017, 05).readAsLinesSync();

final example =
    r'''
0
3
0
1
-3
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(5));
    });
    test('Solution', () {
      expect(solveA(input), equals(372671));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(10));
    });
    test('Solution', () {
      expect(solveB(input), equals(25608480));
    });
  });
}
