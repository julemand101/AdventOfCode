// --- Day 23: Opening the Turing Lock ---
// https://adventofcode.com/2015/day/23

import 'package:advent_of_code_2015/day23.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 23).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
inc a
jio a, +2
tpl a
inc a
'''
              .asLines,
        ).a,
        equals(2),
      );
    });
    test('Solution', () {
      expect(solve(input).b, equals(307));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, registerA: 1).b, equals(160));
    });
  });
}
