// --- Day 13: Claw Contraption ---
// https://adventofcode.com/2024/day/13

import 'package:collection/collection.dart';

final buttonRegExp = RegExp(r'X\+(\d+), Y\+(\d+)');
final prizeRegExp = RegExp(r'X=(\d+), Y=(\d+)');

const costAButton = 3;
const costBButton = 1;

int solveA(Iterable<String> input) => solve(input, partB: false);

int solveB(Iterable<String> input) => solve(input, partB: true);

int solve(Iterable<String> input, {required bool partB}) {
  var sum = 0;

  for (final chunk
      in input
          .where((line) => line.isNotEmpty)
          .splitBefore((line) => line.startsWith('Button A:'))) {
    final buttonA = buttonRegExp.firstMatch(chunk[0])!;
    final ax = int.parse(buttonA[1]!);
    final ay = int.parse(buttonA[2]!);

    final buttonB = buttonRegExp.firstMatch(chunk[1])!;
    final bx = int.parse(buttonB[1]!);
    final by = int.parse(buttonB[2]!);

    final prize = prizeRegExp.firstMatch(chunk[2])!;
    final px = int.parse(prize[1]!) + (partB ? 10000000000000 : 0);
    final py = int.parse(prize[2]!) + (partB ? 10000000000000 : 0);

    final aButton = ((by * px) - (bx * py)) / ((ax * by) - (ay * bx));
    final bButton = ((ax * py) - (ay * px)) / ((ax * by) - (ay * bx));

    if (aButton > 0 &&
        bButton > 0 &&
        (aButton % 1) == 0 && // Checking if double values are whole
        (bButton % 1) == 0 &&
        (partB || (aButton <= 100 && bButton <= 100))) {
      sum += (aButton.toInt() * costAButton) + (bButton.toInt() * costBButton);
    }
  }

  return sum;
}
