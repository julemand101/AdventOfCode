// --- Day 23: Coprocessor Conflagration ---
// https://adventofcode.com/2017/day/23

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day23.dart';

final input = getInput(2017, 23).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(3025));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(915));
    });
  });
}
