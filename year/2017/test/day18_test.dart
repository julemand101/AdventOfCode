// --- Day 18: Duet ---
// https://adventofcode.com/2017/day/18

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day18.dart';

final input = getInput(2017, 18).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          '''
set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2
'''
              .asLinesList,
        ),
        equals(4),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(4601));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          '''
snd 1
snd 2
snd p
rcv a
rcv b
rcv c
rcv d
'''
              .asLinesList,
        ),
        equals(3),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(6858));
    });
  });
}
