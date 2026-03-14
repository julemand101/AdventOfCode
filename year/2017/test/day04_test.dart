// --- Day 4: High-Entropy Passphrases ---
// https://adventofcode.com/2017/day/4

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day04.dart';

final input = getInput(2017, 04).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA([r'aa bb cc dd ee']), equals(1)); // valid
    });
    test('Example 2', () {
      expect(solveA([r'aa bb cc dd aa']), equals(0)); // invalid
    });
    test('Example 3', () {
      expect(solveA([r'aa bb cc dd aaa']), equals(1)); // valid
    });
    test('Solution', () {
      expect(solveA(input), equals(386));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB([r'abcde fghij']), equals(1)); // valid
    });
    test('Example 2', () {
      expect(solveB([r'abcde xyz ecdab']), equals(0)); // invalid
    });
    test('Example 3', () {
      expect(solveB([r'a ab abc abd abf abj']), equals(1)); // valid
    });
    test('Example 4', () {
      expect(solveB([r'iiii oiii ooii oooi oooo']), equals(1)); // valid
    });
    test('Example 5', () {
      expect(solveB([r'oiii ioii iioi iiio']), equals(0)); // invalid
    });
    test('Solution', () {
      expect(solveB(input), equals(208));
    });
  });
}
