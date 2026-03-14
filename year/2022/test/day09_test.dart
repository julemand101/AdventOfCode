// --- Day 9: Rope Bridge ---
// https://adventofcode.com/2022/day/9

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day09.dart';
import 'package:test/test.dart';

final input = getInput(2022, 09).readAsLinesSync();

final example =
    r'''
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(13));
    });
    test('Solution', () {
      expect(solveA(input), equals(6503));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(1));
    });
    test('Example 2', () {
      expect(
        solveB(
          '''
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
'''
              .asLinesList,
        ),
        equals(36),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(2724));
    });
  });
}
