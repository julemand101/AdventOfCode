// --- Day 6: Universal Orbit Map ---
// https://adventofcode.com/2019/day/6

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day06.dart';
import 'package:test/test.dart';

final input = getInput(2019, 06).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          '''
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
'''
              .asLinesList,
        ),
        equals(42),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(253104));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          '''
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN
'''
              .asLinesList,
        ),
        equals(4),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(499));
    });
  });
}
