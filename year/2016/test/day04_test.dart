// --- Day 4: Security Through Obscurity ---
// https://adventofcode.com/2016/day/4

import 'package:advent_of_code_2016/day04.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 04).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
'''
              .asLines,
        ),
        equals(1514),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(409147));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        getDecryptedName(r'qzmt-zixmtkozy-ivhz', 343),
        equals('very encrypted name'),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(991));
    });
  });
}
