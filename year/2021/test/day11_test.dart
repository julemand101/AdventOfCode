// --- Day 11: Dumbo Octopus ---
// https://adventofcode.com/2021/day/11

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day11.dart';
import 'package:test/test.dart';

final input =
    r'''
4341347643
5477728451
2322733878
5453762556
2718123421
4237886115
5631617114
2217667227
4236581255
4482627641
'''
        .asLinesList;

final example =
    r'''
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(1656));
    });
    test('Solution', () {
      expect(solveA(input), equals(1697));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(195));
    });
    test('Solution', () {
      expect(solveB(input), equals(344));
    });
  });
}
