// --- Day 9: Encoding Error ---
// https://adventofcode.com/2020/day/9

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day09.dart';
import 'package:test/test.dart';

final input = getInput(2020, 09).readAsLinesSync();

final example =
    r'''
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example, preambleSize: 5), equals(127));
    });
    test('Solution', () {
      expect(solveA(input), equals(393911906));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example, preambleSize: 5), equals(62));
    });
    test('Solution', () {
      expect(solveB(input), equals(59341885));
    });
  });
}
