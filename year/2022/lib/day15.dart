// --- Day 15: Beacon Exclusion Zone ---
// https://adventofcode.com/2022/day/15

import 'dart:math';

int solveA(Iterable<String> input, {required int y}) {
  for (final (:sensorAtPoint, :closestBeaconPoint) in input.map(parseLine)) {
    final distance = sensorAtPoint.manhattanDistanceTo(closestBeaconPoint);

    if (sensorAtPoint.y + distance >= y) {
      print(sensorAtPoint);
    }
  }

  return 0;
}

RegExp regExp = RegExp(
  r'Sensor at x=(.+), y=(.+): closest beacon is at x=(.*), y=(.*)',
);

({Point<int> sensorAtPoint, Point<int> closestBeaconPoint}) parseLine(
  String line,
) {
  final match = regExp.firstMatch(line)!;

  return (
    sensorAtPoint: Point(int.parse(match[1]!), int.parse(match[2]!)),
    closestBeaconPoint: Point(int.parse(match[3]!), int.parse(match[4]!)),
  );
}

extension on Point<int> {
  int manhattanDistanceTo(Point<int> otherPoint) =>
      (x - otherPoint.x).abs() + (y - otherPoint.y).abs();
}
