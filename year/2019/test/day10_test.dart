// --- Day 10: Monitoring Station ---
// https://adventofcode.com/2019/day/10

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day10.dart';
import 'package:test/test.dart';

final input = getInput(2019, 10).readAsLinesSync();

final example =
    r'''
.#..##.###...#######
##.############..##.
.#.######.########.#
.###.#######.####.#.
#####.##.#.##.###.##
..#####..#.#########
####################
#.####....###.#.#.##
##.#################
#####.##.###..####..
..######..##.#######
####.##.####...##..#
.#####..#.######.###
##...#.##########...
#.##########.#######
.####.#.###.###.#.##
....##.##.###..#####
.#.#.###########.###
#.#.#.#####.####.###
###.##.####.##.#..##    
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          '''
.#..#
.....
#####
....#
...##
'''
              .asLinesList,
        ),
        equals(8),
      );
    });
    test('Example 2', () {
      expect(
        solveA(
          '''
......#.#.
#..#.#....
..#######.
.#.#.###..
.#..#.....
..#....#.#
#..#....#.
.##.#..###
##...#..#.
.#....####
'''
              .asLinesList,
        ),
        equals(33),
      );
    });
    test('Example 3', () {
      expect(
        solveA(
          '''
#.#...#.#.
.###....#.
.#....#...
##.#.#.#.#
....#.#.#.
.##..###.#
..#...##..
..##....##
......#...
.####.###.
'''
              .asLinesList,
        ),
        equals(35),
      );
    });
    test('Example 4', () {
      expect(
        solveA(
          '''
.#..#..###
####.###.#
....###.#.
..###.##.#
##.##.#.#.
....###..#
..#.#..#.#
#..#.#.###
.##...##.#
.....#.#..
'''
              .asLinesList,
        ),
        equals(41),
      );
    });
    test('Example 5', () {
      expect(solveA(example), equals(210));
    });
    test('Solution', () {
      expect(solveA(input), equals(280));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(802));
    });
    test('Solution', () {
      expect(solveB(input), equals(706));
    });
  });
}
