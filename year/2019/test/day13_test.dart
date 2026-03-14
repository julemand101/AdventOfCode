// --- Day 13: Care Package ---
// https://adventofcode.com/2019/day/13

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day13.dart';
import 'package:test/test.dart';

final input = getInput(2019, 13).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(247));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(12954));
    });
  });
}
