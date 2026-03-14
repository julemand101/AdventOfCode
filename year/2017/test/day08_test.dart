// --- Day 8: I Heard You Like Registers ---
// https://adventofcode.com/2017/day/8

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day08.dart';

final input = getInput(2017, 08).readAsLinesSync();

final List<String> example =
    '''
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(1));
    });
    test('Solution', () {
      expect(solveA(input), equals(5143));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(10));
    });
    test('Solution', () {
      expect(solveB(input), equals(6209));
    });
  });
}
