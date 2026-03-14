// --- Day 12: Digital Plumber ---
// https://adventofcode.com/2017/day/12

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day12.dart';

final input = getInput(2017, 12).readAsLinesSync();

final List<String> example =
    '''
0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(6));
    });
    test('Solution', () {
      expect(solveA(input), equals(113));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(2));
    });
    test('Solution', () {
      expect(solveB(input), equals(202));
    });
  });
}
