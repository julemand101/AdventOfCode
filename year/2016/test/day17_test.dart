// --- Day 17: Two Steps Forward ---
// https://adventofcode.com/2016/day/17

import 'package:advent_of_code_2016/day17.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solve(r'ihgpwlah'), equals(r'DDRRRD'));
    });
    test('Example 2', () {
      expect(solve(r'kglvqrro'), equals(r'DDUDRLRRUDRD'));
    });
    test('Example 3', () {
      expect(solve(r'ulqzkmiv'), equals(r'DRURDRUDDLLDLUURRDULRLDUUDDDRR'));
    });
    test('Solution', () {
      expect(solve(r'veumntbg'), equals(r'DDRRULRDRD'));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solve(r'ihgpwlah', partB: true).length, equals(370));
    });
    test('Example 2', () {
      expect(solve(r'kglvqrro', partB: true).length, equals(492));
    });
    test('Example 3', () {
      expect(solve(r'ulqzkmiv', partB: true).length, equals(830));
    });
    test('Solution', () {
      expect(solve(r'veumntbg', partB: true).length, equals(536));
    });
  });
}
