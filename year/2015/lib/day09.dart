// --- Day 9: All in a Single Night ---
// https://adventofcode.com/2015/day/9

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => solve(input).min;

int solveB(Iterable<String> input) => solve(input).max;

final linePattern = RegExp(r'^(.+) to (.+) = (\d+)');

Iterable<int> solve(Iterable<String> input) {
  final nodes = <String, List<({String city, int distance})>>{};

  for (final line in input) {
    final match = linePattern.firstMatch(line)!;

    final from = match[1]!;
    final to = match[2]!;
    int distance = int.parse(match[3]!);

    nodes
      ..update(
        from,
        (nodes) => nodes..add((city: to, distance: distance)),
        ifAbsent: () => [(city: to, distance: distance)],
      )
      ..update(
        to,
        (nodes) => nodes..add((city: from, distance: distance)),
        ifAbsent: () => [(city: from, distance: distance)],
      );
  }

  return nodes.keys
      .map((city) => getRouteDistances(nodes, [city], 0))
      .flattened;
}

Iterable<int> getRouteDistances(
  Map<String, List<({String city, int distance})>> nodes,
  List<String> visitedCities,
  int currentLength,
) sync* {
  // We have visited every city
  if (visitedCities.length == nodes.length) {
    yield currentLength;
  }

  for (final route in nodes[visitedCities.last]!.where(
    (route) => !visitedCities.contains(route.city),
  )) {
    yield* getRouteDistances(
      nodes,
      visitedCities..add(route.city),
      currentLength + route.distance,
    );
    visitedCities.removeLast();
  }
}
