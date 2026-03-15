// --- Day 12: Leonardo's Monorail ---
// https://adventofcode.com/2016/day/12

import 'package:advent_of_code_2016/day12.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input =
    '''
cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2
jnz 1 5
cpy 7 c
inc d
dec c
jnz c -2
cpy a c
inc a
dec b
jnz b -2
cpy c b
dec d
jnz d -6
cpy 19 c
cpy 14 d
inc a
dec d
jnz d -2
dec c
jnz c -5
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a
'''
              .asLinesList,
        ),
        equals(42),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(318077));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(9227731));
    });
  });
}
