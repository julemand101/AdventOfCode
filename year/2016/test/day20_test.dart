// --- Day 20: Firewall Rules ---
// https://adventofcode.com/2016/day/20

import 'package:advent_of_code_2016/day20.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 20).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
5-8
0-2
4-7
'''
              .asLines,
        ),
        equals(3),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(23923783));
    });
  });
}
