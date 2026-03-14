// --- Day 8: Handheld Halting ---
// https://adventofcode.com/2020/day/8

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day08.dart';
import 'package:test/test.dart';

final input = getInput(2020, 08).readAsLinesSync();

final example =
    r'''
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(5));
    });
    test('Solution', () {
      expect(solveA(input), equals(1317));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(8));
    });
    test('Solution', () {
      expect(solveB(input), equals(1033));
    });
  });
}
