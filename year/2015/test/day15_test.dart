// --- Day 15: Science for Hungry People ---
// https://adventofcode.com/2015/day/15

import 'package:advent_of_code_2015/day15.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 15).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
'''
              .asLines,
          partB: false,
        ),
        equals(62842880),
      );
    });
    test('Solution', () {
      expect(solve(input, partB: false), equals(21367368));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
'''
              .asLines,
          partB: true,
        ),
        equals(57600000),
      );
    });
    test('Solution', () {
      expect(solve(input, partB: true), equals(1766400));
    });
  });
}
