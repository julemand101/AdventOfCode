// --- Day 14: Reindeer Olympics ---
// https://adventofcode.com/2015/day/14

import 'package:collection/collection.dart';

final regExp = RegExp(
  r'^(.+) can fly (\d+) km/s for (\d+) seconds, '
  r'but then must rest for (\d+) seconds.',
);

int solve(Iterable<String> input, {required int seconds, required bool partB}) {
  final deers = [
    for (final match in input.map(regExp.firstMatch).nonNulls)
      (
        name: match[1]!,
        speed: int.parse(match[2]!),
        flyingTime: int.parse(match[3]!),
        restingTime: int.parse(match[4]!),
      ),
  ];

  final isFlying = List.filled(deers.length, true, growable: false);
  final distance = List.filled(deers.length, 0, growable: false);
  final scores = List.filled(deers.length, 0, growable: false);
  final countdown = List.generate(
    deers.length,
    (i) => deers[i].flyingTime,
    growable: false,
  );

  for (var sec = 0; sec < seconds; sec++) {
    for (final (i, deer) in deers.indexed) {
      if (isFlying[i]) {
        distance[i] += deer.speed;
      }
      if (--countdown[i] == 0) {
        final state = (isFlying[i] = !isFlying[i]);
        countdown[i] = state ? deer.flyingTime : deer.restingTime;
      }
    }

    if (partB) {
      final maxDistance = distance.max;

      for (final (index, distance) in distance.indexed) {
        if (distance == maxDistance) {
          scores[index] += 1;
        }
      }
    }
  }

  return partB ? scores.max : distance.max;
}
