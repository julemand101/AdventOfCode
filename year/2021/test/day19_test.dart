// --- Day 19: Beacon Scanner ---
// https://adventofcode.com/2021/day/19

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day19.dart';
import 'package:test/test.dart';

final input = getInput(2021, 19).readAsLinesSync();
final example = getInput(2021, 19, example: true).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(79));
    });
    test('Solution', () {
      expect(solveA(input), equals(381));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(3621));
    });
    test('Solution', () {
      expect(solveB(input), equals(12201));
    });
  });
}
