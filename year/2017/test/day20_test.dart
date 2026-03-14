// --- Day 20: Particle Swarm ---
// https://adventofcode.com/2017/day/20

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day20.dart';

final input = getInput(2017, 20).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          '''
p=< 3,0,0>, v=< 2,0,0>, a=<-1,0,0>
p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>
'''
              .asLinesList,
        ),
        equals(0),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(170));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          '''
p=<-6,0,0>, v=< 3,0,0>, a=< 0,0,0>
p=<-4,0,0>, v=< 2,0,0>, a=< 0,0,0>
p=<-2,0,0>, v=< 1,0,0>, a=< 0,0,0>
p=< 3,0,0>, v=<-1,0,0>, a=< 0,0,0>
'''
              .asLinesList,
        ),
        equals(1),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(571));
    });
  });
}
