// --- Day 14: Reindeer Olympics ---
// https://adventofcode.com/2015/day/14

import 'package:advent_of_code_2015/day14.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 14).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
'''
              .asLines,
          partB: false,
          seconds: 1000,
        ),
        equals(1120),
      );
    });
    test('Solution', () {
      expect(solve(input, seconds: 2503, partB: false), equals(2655));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
'''
              .asLines,
          seconds: 1000,
          partB: true,
        ),
        equals(689),
      );
    });
    test('Solution', () {
      expect(solve(input, seconds: 2503, partB: true), equals(1059));
    });
  });
}
