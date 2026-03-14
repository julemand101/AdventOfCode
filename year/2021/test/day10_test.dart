// --- Day 10: Syntax Scoring ---
// https://adventofcode.com/2021/day/10

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day10.dart';
import 'package:test/test.dart';

final input = getInput(2021, 10).readAsLinesSync();

final example =
    r'''
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(26397));
    });
    test('Solution', () {
      expect(solveA(input), equals(392097));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(288957));
    });
    test('Solution', () {
      expect(solveB(input), equals(4263222782));
    });
  });
}
