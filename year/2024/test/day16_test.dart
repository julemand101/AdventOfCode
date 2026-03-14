// --- Day 16: Reindeer Maze ---
// https://adventofcode.com/2024/day/16

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2024/day16.dart';
import 'package:test/test.dart';

final input = getInput(2024, 16).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############
'''
              .toLinesList(),
        ),
        equals(7036),
      );
    });
    test('Example 2', () {
      expect(
        solveA(
          r'''
#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################
'''
              .toLinesList(),
        ),
        equals(11048),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(93436));
    });
  });
}
