// --- Day 20: Firewall Rules ---
// https://adventofcode.com/2016/day/20

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) {
  final list = [
    for (final [from, to] in input.map((line) => line.split('-')))
      (int.parse(from), int.parse(to)),
  ]..sortBy((entry) => entry.$1);

  var currentMinimum = 0;

  for (final (from, to) in list) {
    if (currentMinimum >= from && currentMinimum <= to) {
      currentMinimum = to + 1;
    }
  }

  return currentMinimum;
}

int solveB(Iterable<String> input, {int validValuesLength = 4294967295}) {
  final boolList = BoolList(validValuesLength + 1);

  for (final [from, to] in input.map((line) => line.split('-'))) {
    boolList.fillRange(int.parse(from), int.parse(to) + 1, true);
  }

  var count = 0;

  for (var i = 0; i < boolList.length; i++) {
    if (!boolList[i]) {
      count++;
    }
  }

  return count;
}
