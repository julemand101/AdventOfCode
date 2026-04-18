// --- Day 25: Let It Snow ---
// https://adventofcode.com/2015/day/25

import 'package:advent_of_code_2015/day25.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(row: 6, column: 6), equals(27995004));
    });
    test('Solution', () {
      expect(solveA(row: 2981, column: 3075), equals(9132360));
    });
  });
}
