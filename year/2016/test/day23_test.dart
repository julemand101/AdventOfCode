// --- Day 23: Safe Cracking ---
// https://adventofcode.com/2016/day/23

import 'package:advent_of_code_2016/day23.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input =
    '''
cpy a b
dec b
cpy a d
cpy 0 a
cpy b c
inc a
dec c
jnz c -2
dec d
jnz d -5
dec b
cpy b c
cpy c d
dec d
inc c
jnz d -2
tgl c
cpy -16 c
jnz 1 c
cpy 76 c
jnz 80 d
inc a
inc d
jnz d -2
inc c
jnz c -5
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solve(
          r'''
cpy 2 a
tgl a
tgl a
tgl a
cpy 1 a
dec a
dec a
'''
              .asLinesList,
        ),
        equals(3),
      );
    });
    test('Solution', () {
      expect(solve(input, eggs: 7), equals(11120));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solve(input, eggs: 12), equals(479007680));
    });
  });
}
