// --- Day 14: Docking Data ---
// https://adventofcode.com/2020/day/14

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day14.dart';
import 'package:test/test.dart';

final input = getInput(2020, 14).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(const [
          r'mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X',
          r'mem[8] = 11',
          r'mem[7] = 101',
          r'mem[8] = 0]',
        ]),
        equals(165),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(14722016054794));
    }, tags: 'data');
  });
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveB(const [
          r'mask = 000000000000000000000000000000X1001X',
          r'mem[42] = 100',
          r'mask = 00000000000000000000000000000000X0XX',
          r'mem[26] = 1',
        ]),
        equals(208),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(3618217244644));
    }, tags: 'data');
  });
}
