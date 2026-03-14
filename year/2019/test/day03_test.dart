// --- Day 3: Crossed Wires ---
// https://adventofcode.com/2019/day/3

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day03.dart';
import 'package:test/test.dart';

final input = getInput(2019, 03).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['R8,U5,L5,D3', 'U7,R6,D4,L4']), equals(6));
    });
    test('Example 2', () {
      expect(
        solveA(const [
          'R75,D30,R83,U83,L12,D49,R71,U7,L72',
          'U62,R66,U55,R34,D71,R55,D58,R83',
        ]),
        equals(159),
      );
    });
    test('Example 3', () {
      expect(
        solveA(const [
          'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51',
          'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7',
        ]),
        equals(135),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(293));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['R8,U5,L5,D3', 'U7,R6,D4,L4']), equals(30));
    });
    test('Example 2', () {
      expect(
        solveB(const [
          'R75,D30,R83,U83,L12,D49,R71,U7,L72',
          'U62,R66,U55,R34,D71,R55,D58,R83',
        ]),
        equals(610),
      );
    });
    test('Example 3', () {
      expect(
        solveB(const [
          'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51',
          'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7',
        ]),
        equals(410),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(27306));
    });
  });
}
