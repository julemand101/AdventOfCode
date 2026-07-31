// --- Day 11: Radioisotope Thermoelectric Generators ---
// https://adventofcode.com/2016/day/11

import 'package:advent_of_code_2016/day11.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 11).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
The first floor contains a hydrogen-compatible microchip and a lithium-compatible microchip.
The second floor contains a hydrogen generator.
The third floor contains a lithium generator.
The fourth floor contains nothing relevant.
'''
              .asLines,
        ),
        equals(11),
      );
    });
    test('Solution', () {
      expect(solve(input), equals(47));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solve(
          input,
          initFirstFloor: [
            Generator(r'elerium'),
            Chip(r'elerium'),
            Generator(r'dilithium'),
            Chip(r'dilithium'),
          ],
        ),
        equals(-1),
      );
    });
  }, skip: true);
}
