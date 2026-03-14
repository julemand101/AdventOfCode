// --- Day 22: Sporifica Virus ---
// https://adventofcode.com/2017/day/22

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day22.dart';

final input = getInput(2017, 22).readAsLinesSync();

final List<String> example =
    '''
..#
#..
...
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example, burstsOfActivity: 0), equals(0));
    });
    test('Example 2', () {
      expect(solveA(example, burstsOfActivity: 1), equals(1));
    });
    test('Example 3', () {
      expect(solveA(example, burstsOfActivity: 2), equals(1));
    });
    test('Example 4', () {
      expect(solveA(example, burstsOfActivity: 7), equals(5));
    });
    test('Example 5', () {
      expect(solveA(example, burstsOfActivity: 10000), equals(5587));
    });
    test('Solution', () {
      expect(solveA(input, burstsOfActivity: 10000), equals(5433));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example, burstsOfActivity: 100), equals(26));
    });
    test('Example 2', () {
      expect(solveB(example, burstsOfActivity: 10000000), equals(2511944));
    });
    test('Solution', () {
      expect(solveB(input, burstsOfActivity: 10000000), equals(2512599));
    });
  });
}
