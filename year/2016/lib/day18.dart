// --- Day 18: Like a Rogue ---
// https://adventofcode.com/2016/day/18

import 'dart:typed_data';

import 'package:collection/collection.dart';

extension on Uint8List {
  int getSafely(int index) => index >= 0 && index < length ? this[index] : 1;
}

int solveA(String input, {required int rows}) {
  var row = Uint8List(input.length)
    ..setAll(0, input.split('').map((letter) => letter == '.' ? 1 : 0));
  var newRow = Uint8List(row.length);
  var sum = row.sum;

  for (var i = 1; i < rows; i++) {
    for (var k = 0; k < newRow.length; k++) {
      newRow[k] = switch ((
        row.getSafely(k - 1),
        row.getSafely(k),
        row.getSafely(k + 1),
      )) {
        (0, 0, 1) || (1, 0, 0) || (0, 1, 1) || (1, 1, 0) => 0,
        _ => 1,
      };
    }

    sum += newRow.sum;
    (row, newRow) = (newRow, row);
  }

  return sum;
}
