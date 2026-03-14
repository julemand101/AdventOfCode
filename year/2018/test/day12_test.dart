// --- Day 12: Subterranean Sustainability ---
// https://adventofcode.com/2018/day/12

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day12.dart';

final input = getInput(2018, 12).readAsLinesSync();

final example =
    r'''
initial state: #..#.#..##......###...###

...## => #
..#.. => #
.#... => #
.#.#. => #
.#.## => #
.##.. => #
.#### => #
#.#.# => #
#.### => #
##.#. => #
##.## => #
###.. => #
###.# => #
####. => #
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(325));
    });
    test('Solution', () {
      expect(solveA(input), equals(2840));
    });
  });

  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(2000000001684));
    });
  });
}
