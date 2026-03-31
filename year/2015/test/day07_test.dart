// --- Day 7: Some Assembly Required ---
// https://adventofcode.com/2015/day/7

import 'package:advent_of_code_2015/day07.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 07).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
'''
              .asLines,
        ),
        equals(<String, int>{
          'd': 72,
          'e': 507,
          'f': 492,
          'g': 114,
          'h': 65412,
          'i': 65079,
          'x': 123,
          'y': 456,
        }),
      );
    });
    test('Solution', () {
      expect(solveA(input)['a'], equals(3176));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solveB(input, overrideWireB: solveA(input)['a']!)['a'],
        equals(14710),
      );
    });
  });
}
