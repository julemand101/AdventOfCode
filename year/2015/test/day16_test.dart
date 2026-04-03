// --- Day 16: Aunt Sue ---
// https://adventofcode.com/2015/day/16

import 'package:advent_of_code_2015/day16.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 16).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solve(input, partB: false), equals(103));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, partB: true), equals(405));
    });
  });
}
