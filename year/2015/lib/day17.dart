// --- Day 17: No Such Thing as Too Much ---
// https://adventofcode.com/2015/day/17

import 'package:collection/collection.dart';

int solveA(Iterable<String> input, {required int target}) => combinations(
  input.map(int.parse).toList(growable: false),
  target,
  [],
  0,
).length;

int solveB(Iterable<String> input, {required int target}) {
  var lowestLength = 10000000;
  var count = 0;

  for (final combo in combinations(
    input.map(int.parse).toList(growable: false),
    target,
    [],
    0,
  )) {
    final comboLength = combo.length;

    if (comboLength < lowestLength) {
      lowestLength = comboLength;
      count = 1;
    } else if (comboLength == lowestLength) {
      count++;
    }
  }

  return count;
}

Iterable<List<int>> combinations(
  List<int> containers,
  int target,
  List<int> progress,
  int restPos,
) sync* {
  final sum = progress.sum;

  if (sum == target) {
    yield progress;
  } else if (sum < target) {
    for (var i = restPos; i < containers.length; i++) {
      yield* combinations(
        containers,
        target,
        progress..add(containers[i]),
        i + 1,
      );
      progress.removeLast();
    }
  }
}
