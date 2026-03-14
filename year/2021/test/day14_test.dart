// --- Day 14: Extended Polymerization ---
// https://adventofcode.com/2021/day/14

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2021/day14.dart';
import 'package:test/test.dart';

final input = getInput(2021, 14).readAsLinesSync();

final example =
    r'''
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(1588));
    });
    test('Solution', () {
      expect(solveA(input), equals(4517));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(2188189693529));
    });
    test('Solution', () {
      expect(solveB(input), equals(4704817645083));
    });
  });
}
