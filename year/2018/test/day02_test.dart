// --- Day 2: Inventory Management System ---
// https://adventofcode.com/2018/day/2

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2018/day02.dart';

final input = getInput(2018, 02).readAsLinesSync();

final example =
    r'''
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
'''
              .asLinesList,
        ),
        equals(12),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(8118));
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(
          r'''
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
'''
              .asLinesList,
        ),
        equals(r'fgij'),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(r'jbbenqtlaxhivmwyscjukztdp'));
    });
  });
}
