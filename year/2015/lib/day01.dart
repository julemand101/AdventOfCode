// --- Day 1: Not Quite Lisp ---
// https://adventofcode.com/2015/day/1

import 'dart:typed_data';

final openBracket = '('.codeUnitAt(0);

int solveA(Uint8List input) => solve(input).floor;

int solveB(Uint8List input) => solve(input).firstBasementPosition!;

({int floor, int? firstBasementPosition}) solve(Uint8List input) {
  int floor = 0;
  int? firstBasementPosition;

  for (final (index, char) in input.indexed) {
    floor += char == openBracket ? 1 : -1;

    if (floor == -1) {
      firstBasementPosition ??= index + 1;
    }
  }

  return (floor: floor, firstBasementPosition: firstBasementPosition);
}
