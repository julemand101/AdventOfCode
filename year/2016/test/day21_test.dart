// --- Day 21: Scrambled Letters and Hash ---
// https://adventofcode.com/2016/day/21

import 'package:advent_of_code_2016/day21.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 21).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
swap position 4 with position 0
swap letter d with letter b
reverse positions 0 through 4
rotate left 1 step
move position 1 to position 4
move position 3 to position 0
rotate based on position of letter b
rotate based on position of letter d
'''
              .asLines,
          scrambleInput: r'abcde',
        ),
        equals(r'decab'),
      );
    });
    test('Solution', () {
      expect(solveA(input, scrambleInput: r'abcdefgh'), equals('bfheacgd'));
    });
  });
}
