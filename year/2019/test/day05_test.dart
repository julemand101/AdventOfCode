// --- Day 5: Sunny with a Chance of Asteroids ---
// https://adventofcode.com/2019/day/5

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day05.dart';
import 'package:test/test.dart';

final input = getInput(2019, 05).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(7839346));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(447803));
    });
  });
}
