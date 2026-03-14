// --- Day 7: The Treachery of Whales ---
// https://adventofcode.com/2021/day/7

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day07.dart';
import 'package:test/test.dart';

final input = getInput(2021, 07).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('16,1,2,0,4,2,7,1,2,14'), equals(37));
    });
    test('Solution', () {
      expect(solveA(input), equals(351901));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('16,1,2,0,4,2,7,1,2,14'), equals(168));
    });
    test('Solution', () {
      expect(solveB(input), equals(101079875));
    });
  });
}
