// --- Day 20: A Regular Map ---
// https://adventofcode.com/2018/day/20

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day20.dart';

final input = getInput(2018, 20).readAsStringSync();

const examples = [
  r'^WNE$',
  r'^ENWWW(NEEE|SSE(EE|N))$',
  r'^ENNWSWW(NEWS|)SSSEEN(WNSE|)EE(SWEN|)NNN$',
  r'^ESSWWN(E|NNENN(EESS(WNSE|)SSS|WWWSSSSE(SW|NNNE)))$',
  r'^WSSEESWWWNW(S|NENNEEEENN(ESSSSW(NWSW|SSEN)|WSWWN(E|WWS(E|SS))))$',
];

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(examples[0]), equals(3));
    });
    test('Example 2', () {
      expect(solveA(examples[1]), equals(10));
    });
    test('Example 3', () {
      expect(solveA(examples[2]), equals(18));
    });
    test('Example 4', () {
      expect(solveA(examples[3]), equals(23));
    });
    test('Example 5', () {
      expect(solveA(examples[4]), equals(31));
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  }, skip: true);
}
