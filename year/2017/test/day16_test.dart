// --- Day 16: Permutation Promenade ---
// https://adventofcode.com/2017/day/16

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day16.dart';

final input = getInput(2017, 16).readAsStringSync();

final example = 's1,x3/4,pe/b';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(programCount: 5, danceMoves: example), equals(r'baedc'));
    });
    test('Solution', () {
      expect(
        solveA(programCount: 16, danceMoves: input),
        equals(r'dcmlhejnifpokgba'),
      );
    });
  });

  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(programCount: 5, danceMoves: example, times: 2),
        equals(r'ceadb'),
      );
    });
    test('Example 2 (bonus)', () {
      expect(
        solveB(programCount: 5, danceMoves: example, times: 4),
        equals(r'abcde'),
      );
    });
    test('Example 3 (bonus)', () {
      expect(
        solveB(programCount: 5, danceMoves: example, times: 0),
        equals(r'abcde'),
      );
    });
    test('Solution', () {
      expect(
        solveB(programCount: 16, danceMoves: input, times: 1000000000),
        equals(r'ifocbejpdnklamhg'),
      );
    });
  });
}
