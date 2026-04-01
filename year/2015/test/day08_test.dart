// --- Day 8: Matchsticks ---
// https://adventofcode.com/2015/day/8

import 'package:advent_of_code_2015/day08.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 08).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
""
"abc"
"aaa\"aaa"
"\x27"
'''
              .asLines,
        ),
        equals(12),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(1371));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
""
"abc"
"aaa\"aaa"
"\x27"
'''
              .asLines,
        ),
        equals(19),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(2117));
    });
  });
}
