// --- Day 4: Ceres Search ---
// https://adventofcode.com/2024/day/4

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2024/day04.dart';
import 'package:test/test.dart';

final input = getInput(2024, 04).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
'''
              .asLinesList,
        ),
        equals(18),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(2685));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
'''
              .asLinesList,
        ),
        equals(9),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(2048));
    });
  });
}
