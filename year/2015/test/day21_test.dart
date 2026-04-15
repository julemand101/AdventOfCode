// --- Day 21: RPG Simulator 20XX ---
// https://adventofcode.com/2015/day/21

import 'package:advent_of_code_2015/day21.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 21).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        fight(
          player: (hitPoints: 8, damage: 5, armor: 5),
          boss: (hitPoints: 12, damage: 7, armor: 2),
        ),
        equals(Winner.player),
      );
    });
    test('Solution', () {
      expect(solveA(boss: (hitPoints: 104, damage: 8, armor: 1)), equals(78));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(boss: (hitPoints: 104, damage: 8, armor: 1)), equals(148));
    });
  });
}
