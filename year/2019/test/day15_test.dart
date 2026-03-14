// --- Day 15: Oxygen System ---
// https://adventofcode.com/2019/day/15

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day15.dart';
import 'package:test/test.dart';

final input = getInput(2019, 15).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(308));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(328));
    });
  });
}
