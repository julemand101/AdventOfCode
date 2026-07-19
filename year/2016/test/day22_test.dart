// --- Day 22: Grid Computing ---
// https://adventofcode.com/2016/day/22

import 'package:advent_of_code_2016/day22.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 22).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(872));
    });
  });
}
