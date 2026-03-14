// --- Day 13: Distress Signal ---
// https://adventofcode.com/2022/day/13

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day13.dart';
import 'package:test/test.dart';

final input = getInput(2022, 13).readAsLinesSync();

final example =
    r'''
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(13));
    });
    test('Solution', () {
      expect(solveA(input), equals(6072));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(140));
    });
    test('Solution', () {
      expect(solveB(input), equals(22184));
    });
  });
}
