// --- Day 4: The Ideal Stocking Stuffer ---
// https://adventofcode.com/2015/day/4

import 'package:advent_of_code_2015/day04.dart';
import 'package:test/test.dart';

const input = r'ckczppom';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(r'abcdef'), equals(609043));
    });
    test('Example 2', () {
      expect(solveA(r'pqrstuv'), equals(1048970));
    });
    test('Solution', () {
      expect(solveA(input), equals(117946));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(3938038));
    });
  });
}
