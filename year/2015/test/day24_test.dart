// --- Day 24: It Hangs in the Balance ---
// https://adventofcode.com/2015/day/24

import 'package:advent_of_code_2015/day24.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 24).readAsLinesSync();

final example =
    r'''
1
2
3
4
5
7
8
9
10
11
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solve(example, groups: 3), equals(99));
    });
    test('Solution', () {
      expect(solve(input, groups: 3), equals(10439961859));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solve(example, groups: 4), equals(44));
    });
    test('Solution', () {
      expect(solve(input, groups: 4), equals(72050269));
    });
  });
}
