// --- Day 9: Sensor Boost ---
// https://adventofcode.com/2019/day/9

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2019/day09.dart';
import 'package:advent_of_code_2019/intcode_computer.dart';
import 'package:test/test.dart';

final input = getInput(2019, 09).readAsStringSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      var program = "109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99";
      expect(
        IntcodeComputer.fromString(program).compute().join(','),
        equals(program),
      );
    });
    test('Example 2', () {
      expect(
        IntcodeComputer.fromString(
          '1102,34915192,34915192,7,4,7,99,0',
        ).compute().first.toString().length,
        equals(16),
      );
    });
    test('Example 3', () {
      expect(
        IntcodeComputer.fromString('104,1125899906842624,99').compute().first,
        equals(1125899906842624),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(2453265701));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(80805));
    });
  });
}
