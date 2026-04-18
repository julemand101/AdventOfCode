// --- Day 24: It Hangs in the Balance ---
// https://adventofcode.com/2015/day/24

import 'package:collection/collection.dart';
import 'package:trotter/trotter.dart';

int solve(Iterable<String> input, {required int groups}) {
  final packages = input.map(int.parse).toList(growable: false);
  final splitSum = packages.sum ~/ groups;

  for (var i = 1; i <= packages.length; i++) {
    if (packages
            .combinations(i)
            .iterable
            .where((list) => list.sum == splitSum)
            .map((list) => list.reduce((a, b) => a * b))
            .minOrNull
        case final minQuantumEntanglement?) {
      return minQuantumEntanglement;
    }
  }

  throw 'Did not find solution!';
}
