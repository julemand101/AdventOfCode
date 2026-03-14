// --- Day 7: Amplification Circuit ---
// https://adventofcode.com/2019/day/7

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day07.dart';
import 'package:test/test.dart';

final input = getInput(2019, 07).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(117312));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(1336480));
    });
  });
}
