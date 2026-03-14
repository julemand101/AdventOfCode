// --- Day 13: Packet Scanners ---
// https://adventofcode.com/2017/day/13

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day13.dart';

final input = getInput(2017, 13).readAsLinesSync();

final example =
    r'''
0: 3
1: 2
4: 4
6: 4
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(24));
    });
    test('Solution', () {
      expect(solveA(input), equals(2160));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(10));
    });
    test('Solution', () {
      expect(solveB(input), equals(3907470));
    });
  });

  group('Part Two - with isolates', () {
    const chunkSize = 1000;

    test('Example 1', () {
      expect(solveBWithIsolates(example, chunkSize), completion(equals(10)));
    });
    test('Solution', () {
      expect(solveBWithIsolates(input, chunkSize), completion(equals(3907470)));
    });
  });
}
