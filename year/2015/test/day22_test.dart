// --- Day 22: Wizard Simulator 20XX ---
// https://adventofcode.com/2015/day/22

import 'package:advent_of_code_2015/day22.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2015, 22).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(
        solve(bossHitPoints: 58, bossDamage: 9, hardMode: false),
        equals(1269),
      );
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solve(bossHitPoints: 58, bossDamage: 9, hardMode: true),
        equals(1309),
      );
    });
  });
}
