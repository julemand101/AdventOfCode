// --- Day 7: Internet Protocol Version 7 ---
// https://adventofcode.com/2016/day/7

import 'package:advent_of_code_2016/day07.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 07).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const [r'abba[mnop]qrst']), equals(1));
    });
    test('Example 2', () {
      expect(solveA(const [r'abcd[bddb]xyyx']), equals(0));
    });
    test('Example 3', () {
      expect(solveA(const [r'aaaa[qwer]tyui']), equals(0));
    });
    test('Example 4', () {
      expect(solveA(const [r'ioxxoj[asdfgh]zxcvbn']), equals(1));
    });
    test('Solution', () {
      expect(solveA(input), equals(110));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const [r'aba[bab]xyz']), equals(1));
    });
    test('Example 2', () {
      expect(solveB(const [r'xyx[xyx]xyx']), equals(0));
    });
    test('Example 3', () {
      expect(solveB(const [r'aaa[kek]eke']), equals(1));
    });
    test('Example 4', () {
      expect(solveB(const [r'zazbz[bzb]cdb']), equals(1));
    });
    test('Solution', () {
      expect(solveB(input), equals(242));
    });
  });
}
