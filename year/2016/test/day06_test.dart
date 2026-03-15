// --- Day 6: Signals and Noise ---
// https://adventofcode.com/2016/day/6

import 'package:advent_of_code_2016/day06.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 06).readAsLinesSync();

final example =
    r'''
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals('easter'));
    });
    test('Solution', () {
      expect(solveA(input), equals(r'qrqlznrl'));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals('advent'));
    });
    test('Solution', () {
      expect(solveB(input), equals(r'kgzdfaon'));
    });
  });
}
