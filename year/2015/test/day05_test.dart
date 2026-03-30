// --- Day 5: Doesn't He Have Intern-Elves For This? ---
// https://adventofcode.com/2015/day/5

import 'package:advent_of_code_2015/day05.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 05).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const [r'ugknbfddgicrmopn']), equals(1));
    });
    test('Example 2', () {
      expect(solveA(const [r'aaa']), equals(1));
    });
    test('Example 3', () {
      expect(solveA(const [r'jchzalrnumimnmhp']), equals(0));
    });
    test('Example 4', () {
      expect(solveA(const [r'haegwjzuvuyypxyu']), equals(0));
    });
    test('Example 5', () {
      expect(solveA(const [r'dvszwmarrgswjxmb']), equals(0));
    });
    test('Solution', () {
      expect(solveA(input), equals(236));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const [r'qjhvhtzxzqqjkmpb']), equals(1));
    });
    test('Example 2', () {
      expect(solveB(const [r'xxyxx']), equals(1));
    });
    test('Example 3', () {
      expect(solveB(const [r'uurcxstgmygtbstg']), equals(0));
    });
    test('Example 4', () {
      expect(solveB(const [r'ieodomkazucvgmuy']), equals(0));
    });
    test('Solution', () {
      expect(solveB(input), equals(51)); // not 11
    });
  });
}
