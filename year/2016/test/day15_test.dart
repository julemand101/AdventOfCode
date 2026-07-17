// --- Day 15: Timing is Everything ---
// https://adventofcode.com/2016/day/15

import 'package:advent_of_code_2016/day15.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 15).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Disc #1 has 5 positions; at time=0, it is at position 4.
Disc #2 has 2 positions; at time=0, it is at position 1.
'''
              .asLines,
        ),
        equals(5),
      );
    });
    test('Solution', () {
      expect(solve(input), equals(16824));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solve(
          input.followedBy([
            'Disc #7 has 11 positions; at time=0, it is at position 0.',
          ]),
        ),
        equals(3543984),
      );
    });
  });
}
