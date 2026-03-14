// --- Day 11: Space Police ---
// https://adventofcode.com/2019/day/11

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day11.dart';
import 'package:test/test.dart';

final input = getInput(2019, 11).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(1883));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solveB(input),
        equals('''
  ██  ███  █  █  ██  █  █ ███  ████ █  █
 █  █ █  █ █  █ █  █ █  █ █  █ █    █  █
 █  █ █  █ █  █ █    █  █ █  █ ███  ████
 ████ ███  █  █ █ ██ █  █ ███  █    █  █
 █  █ █    █  █ █  █ █  █ █ █  █    █  █
 █  █ █     ██   ███  ██  █  █ █    █  █
'''),
      );
    });
  });
}
