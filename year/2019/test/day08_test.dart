// --- Day 8: Space Image Format ---
// https://adventofcode.com/2019/day/8

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day08.dart';
import 'package:test/test.dart';

final input = getInput(2019, 08).readAsStringSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(1950));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solveB(input),
        equals('''
████ █  █  ██  █  █ █    
█    █ █  █  █ █  █ █    
███  ██   █  █ ████ █    
█    █ █  ████ █  █ █    
█    █ █  █  █ █  █ █    
█    █  █ █  █ █  █ ████ '''),
      );
    });
  });
}
