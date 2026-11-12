// --- Day 6: Tuning Trouble ---
// https://adventofcode.com/2022/day/6

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day06.dart';
import 'package:test/test.dart';

final input = getInput(2022, 06).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(r'mjqjpqmgbljsphdztnvjfqwrcgsmlb'), equals(7));
    });
    test('Example 2', () {
      expect(solveA(r'bvwbjplbgvbhsrlpgdmjqwftvncz'), equals(5));
    });
    test('Example 3', () {
      expect(solveA(r'nppdvjthqldpwncqszvftbrmjlhg'), equals(6));
    });
    test('Example 4', () {
      expect(solveA(r'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg'), equals(10));
    });
    test('Example 5', () {
      expect(solveA(r'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'), equals(11));
    });
    test('Solution', () {
      expect(solveA(input), equals(1779));
    }, tags: 'data');
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(r'mjqjpqmgbljsphdztnvjfqwrcgsmlb'), equals(19));
    });
    test('Example 2', () {
      expect(solveB(r'bvwbjplbgvbhsrlpgdmjqwftvncz'), equals(23));
    });
    test('Example 3', () {
      expect(solveB(r'nppdvjthqldpwncqszvftbrmjlhg'), equals(23));
    });
    test('Example 4', () {
      expect(solveB(r'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg'), equals(29));
    });
    test('Example 5', () {
      expect(solveB(r'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'), equals(26));
    });
    test('Solution', () {
      expect(solveB(input), equals(2635));
    }, tags: 'data');
  });
}
