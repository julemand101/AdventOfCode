// --- Day 13: Mine Cart Madness ---
// https://adventofcode.com/2018/day/13

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day13.dart';

final input = getInput(2018, 13).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
/->-\
|   |  /----\
| /-+--+-\  |
| | |  | v  |
\-+-/  \-+--/
  \------/
'''
              .asLinesList,
        ),
        equals('7,3'),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals('26,92'));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
/>-<\
|   |
| /<+-\
| | | v
\>+</ |
  |   ^
  \<->/
'''
              .asLinesList,
        ),
        equals('6,4'),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals('86,18'));
    });
  });
}
