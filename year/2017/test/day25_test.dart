// --- Day 25: The Halting Problem ---
// https://adventofcode.com/2017/day/25

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day25.dart';

final input = getInput(2017, 25).readAsLinesSync();

final List<String> example =
    '''
Begin in state A.
Perform a diagnostic checksum after 6 steps.
In state A:
  If the current value is 0:
    - Write the value 1.
    - Move one slot to the right.
    - Continue with state B.
  If the current value is 1:
    - Write the value 0.
    - Move one slot to the left.
    - Continue with state B.
In state B:
  If the current value is 0:
    - Write the value 1.
    - Move one slot to the left.
    - Continue with state A.
  If the current value is 1:
    - Write the value 1.
    - Move one slot to the right.
    - Continue with state A.
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solve(example), equals(3));
    });
    test('Solution', () {
      expect(solve(input), equals(4230));
    });
  });
}
