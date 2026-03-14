// --- Day 9: Disk Fragmenter ---
// https://adventofcode.com/2024/day/9

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2024/day09.dart';
import 'package:test/test.dart';

final input = getInput(2024, 09).readAsLinesSync().first;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('2333133121414131402'), equals(1928));
    });
    test('Solution', () {
      expect(solveA(input), equals(6346871685398));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('2333133121414131402'), equals(2858));
    });
    test('Solution', () {
      expect(solveB(input), equals(6373055193464));
    });
  });
}
