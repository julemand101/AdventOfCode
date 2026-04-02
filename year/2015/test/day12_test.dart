// --- Day 12: JSAbacusFramework.io ---
// https://adventofcode.com/2015/day/12

import 'package:advent_of_code_2015/day12.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 12).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('[1,2,3]'), equals(6));
    });
    test('Example 2', () {
      expect(solveA('{"a":2,"b":4}'), equals(6));
    });
    test('Example 3', () {
      expect(solveA('[[[3]]]'), equals(3));
    });
    test('Example 4', () {
      expect(solveA('{"a":{"b":4},"c":-1}'), equals(3));
    });
    test('Example 5', () {
      expect(solveA('{"a":[-1,1]}'), equals(0));
    });
    test('Example 6', () {
      expect(solveA('[-1,{"a":1}]'), equals(0));
    });
    test('Example 7', () {
      expect(solveA('[]'), equals(0));
    });
    test('Example 8', () {
      expect(solveA('{}'), equals(0));
    });
    test('Solution', () {
      expect(solveA(input), equals(119433));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('[1,2,3]'), equals(6));
    });
    test('Example 2', () {
      expect(solveB('[1,{"c":"red","b":2},3]'), equals(4));
    });
    test('Example 3', () {
      expect(solveB('{"d":"red","e":[1,2,3,4],"f":5}'), equals(0));
    });
    test('Example 4', () {
      expect(solveB('[1,"red",5]'), equals(6));
    });
    test('Solution', () {
      expect(solveB(input), equals(68466)); // NOT 53673 (too low)
    });
  });
}
