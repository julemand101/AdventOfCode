// --- Day 16: Flawed Frequency Transmission ---
// https://adventofcode.com/2019/day/16

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day17.dart';
import 'package:test/test.dart';

final input = getInput(2019, 17).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(6448));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(-1));
    });
  }, skip: true);
}
