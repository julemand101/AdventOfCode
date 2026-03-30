// --- Day 6: Probably a Fire Hazard ---
// https://adventofcode.com/2015/day/6

import 'package:advent_of_code_2015/day06.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 06).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['turn on 0,0 through 999,999']), equals(1_000_000));
    });
    test('Example 2', () {
      expect(solveA(const ['toggle 0,0 through 999,0']), equals(1_000));
    });
    test('Example 3', () {
      expect(
        solveA(const [
          'turn on 0,0 through 999,999',
          'turn off 499,499 through 500,500',
        ]),
        equals(1_000_000 - 4),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(377891));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['turn on 0,0 through 0,0']), equals(1));
    });
    test('Example 2', () {
      expect(solveB(const ['toggle 0,0 through 999,999']), equals(2_000_000));
    });
    test('Solution', () {
      expect(solveB(input), equals(14110788));
    });
  });
}
