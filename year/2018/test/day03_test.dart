// --- Day 3: No Matter How You Slice It ---
// https://adventofcode.com/2018/day/3

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day03.dart';

final input = getInput(2018, 03).readAsLinesSync();

final example =
    r'''
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(4));
    });
    test('Solution', () {
      expect(solveA(input), equals(111935));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(3));
    });
    test('Solution', () {
      expect(solveB(input), equals(650));
    });
  });
}
