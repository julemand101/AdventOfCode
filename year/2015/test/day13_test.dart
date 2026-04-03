// --- Day 13: Knights of the Dinner Table ---
// https://adventofcode.com/2015/day/13

import 'package:advent_of_code_2015/day13.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 13).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David.
Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David.
Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David.
David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol.
'''
              .asLines,
          partB: false,
        ),
        equals(330),
      );
    });
    test('Solution', () {
      expect(solve(input, partB: false), equals(618));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, partB: true), equals(601));
    });
  });
}
