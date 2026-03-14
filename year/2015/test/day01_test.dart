// --- Day 1: Not Quite Lisp ---
// https://adventofcode.com/2015/day/1

import 'package:advent_of_code_2015/day01.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 01).readAsBytesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('(())'.asBytes), equals(0));
      expect(solveA('()()'.asBytes), equals(0));
    });
    test('Example 2', () {
      expect(solveA('((('.asBytes), equals(3));
      expect(solveA('(()(()('.asBytes), equals(3));
    });
    test('Example 3', () {
      expect(solveA('))((((('.asBytes), equals(3));
    });
    test('Example 4', () {
      expect(solveA('())'.asBytes), equals(-1));
      expect(solveA('))('.asBytes), equals(-1));
    });
    test('Example 5', () {
      expect(solveA(')))'.asBytes), equals(-3));
      expect(solveA(')())())'.asBytes), equals(-3));
    });
    test('Solution', () {
      expect(solveA(input), equals(74));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(')'.asBytes), equals(1));
    });
    test('Example 2', () {
      expect(solveB('()())'.asBytes), equals(5));
    });
    test('Solution', () {
      expect(solveB(input), equals(1795));
    });
  });
}
