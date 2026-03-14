// --- Day 10: Adapter Array ---
// https://adventofcode.com/2020/day/10

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2020/day10.dart';
import 'package:test/test.dart';

final input = getInput(2020, 10).readAsLinesSync();

final example1 =
    r'''
16
10
15
5
1
11
7
19
6
12
4
'''
        .asLinesList;

final example2 =
    r'''
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example1), equals(7 * 5));
    });
    test('Example 2', () {
      expect(solveA(example2), equals(22 * 10));
    });
    test('Solution', () {
      expect(solveA(input), equals(1920));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example1), equals(8));
    });
    test('Example 2', () {
      expect(solveB(example2), equals(19208));
    });
    test('Solution', () {
      expect(solveB(input), equals(1511207993344));
    });
  });
}
