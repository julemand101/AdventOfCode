// --- Day 16: Reindeer Maze ---
// https://adventofcode.com/2024/day/16

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2024/day16.dart';
import 'package:test/test.dart';

final input = getInput(2024, 16).readAsLinesSync();

final exampleMaze1 =
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
        .toLinesList();

final exampleMaze2 =
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
        .toLinesList();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleMaze1), equals(7036));
    });
    test('Example 2', () {
      expect(solveA(exampleMaze2), equals(11048));
    });
    test('Solution', () {
      expect(solveA(input), equals(93436));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleMaze1), equals(45));
    });
    test('Example 2', () {
      expect(solveB(exampleMaze2), equals(64));
    });
    test('Solution', () {
      expect(solveB(input), equals(-1));
    });
  });
}
