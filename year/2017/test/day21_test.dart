// --- Day 21: Fractal Art ---
// https://adventofcode.com/2017/day/21

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day21.dart';

final input = getInput(2017, 21).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          '''
../.# => ##./#../...
.#./..#/### => #..#/..../..../#..#
'''
              .asLinesList,
          iterations: 2,
        ),
        equals(12),
      );
    });
    test('Solution', () {
      expect(solve(input, iterations: 5), equals(150));
    });
  });

  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, iterations: 18), equals(2606275));
    });
  });
}
