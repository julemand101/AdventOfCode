// --- Day 13: Knights of the Dinner Table ---
// https://adventofcode.com/2015/day/13

import 'dart:math';

final linePattern = RegExp(
  r'^(.+) would (lose|gain) (\d+) happiness units by sitting next to (.+).',
);

int solve(Iterable<String> input, {required bool partB}) {
  final potentialHappiness = <(String, String), int>{
    for (final match in input.map(linePattern.firstMatch).nonNulls)
      (match[1]!, match[4]!):
          int.parse(match[3]!) * (match[2] == 'gain' ? 1 : -1),
  };

  final guests = [
    ...{for (final (p1, _) in potentialHappiness.keys) p1},
    if (partB) 'myself',
  ];

  var maxScore = 0;
  for (final seating in combinations(guests, [])) {
    var score =
        (potentialHappiness[(seating.first, seating.last)] ?? 0) +
        (potentialHappiness[(seating.first, seating[1])] ?? 0) +
        (potentialHappiness[(seating.last, seating[seating.length - 2])] ?? 0) +
        (potentialHappiness[(seating.last, seating.first)] ?? 0);

    for (var i = 1; i < seating.length - 1; i++) {
      score +=
          (potentialHappiness[(seating[i], seating[i - 1])] ?? 0) +
          (potentialHappiness[(seating[i], seating[i + 1])] ?? 0);
    }

    maxScore = max(maxScore, score);
  }

  return maxScore;
}

Iterable<List<String>> combinations(
  List<String> names,
  List<String> progress,
) sync* {
  if (names.isEmpty) {
    yield progress;
  }

  for (var i = 0; i < names.length; i++) {
    final element = names.removeAt(i);
    yield* combinations(names, progress..add(element));
    progress.removeLast();
    names.insert(i, element);
  }
}
