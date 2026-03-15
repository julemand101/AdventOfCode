// --- Day 10: Balance Bots ---
// https://adventofcode.com/2016/day/10

import 'package:advent_of_code_2016/day10.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 10).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        // In this configuration, bot number 2 is responsible for comparing
        // value-5 microchips with value-2 microchips.
        solveA(
          r'''
value 5 goes to bot 2
bot 2 gives low to bot 1 and high to bot 0
value 3 goes to bot 1
bot 1 gives low to output 1 and high to bot 0
bot 0 gives low to output 2 and high to output 0
value 2 goes to bot 2
'''
              .asLines,
          valueA: 2,
          valueB: 5,
        ),
        equals(2),
      );
    });
    test('Solution', () {
      // Based on your instructions, what is the number of the bot that is
      // responsible for comparing value-61 microchips with value-17 microchips?
      expect(solveA(input, valueA: 61, valueB: 17), equals(47));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input, valueA: 61, valueB: 17), equals(2666));
    });
  });
}
