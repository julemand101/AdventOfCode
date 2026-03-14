// --- Day 5: Supply Stacks ---
// https://adventofcode.com/2022/day/5

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day05.dart';
import 'package:test/test.dart';

final input = getInput(2022, 05).readAsLinesSync();

final example =
    r'''
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals('CMZ'));
    });
    test('Solution', () {
      expect(solveA(input), equals('LJSVLTWQM'));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals('MCD'));
    });
    test('Solution', () {
      expect(solveB(input), equals('BRQWDBBJM'));
    });
  });
}
