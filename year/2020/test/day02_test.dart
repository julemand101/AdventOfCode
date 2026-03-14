// --- Day 2: Password Philosophy ---
// https://adventofcode.com/2020/day/2

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day02.dart';
import 'package:test/test.dart';

final input = getInput(2020, 02).readAsLinesSync();

final example =
    r'''
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(2));
    });
    test('Solution', () {
      expect(solveA(input), equals(643));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(1));
    });
    test('Solution', () {
      expect(solveB(input), equals(388));
    });
  });
}
