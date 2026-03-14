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
) => switch (regExp.firstMatch(line)!.groups([1, 2, 3, 4]).cast<String>()) {
  [final x1, final y1, final x2, final y2] => (
    sensorAtPoint: Point(int.parse(x1), int.parse(y1)),
    closestBeaconPoint: Point(int.parse(x2), int.parse(y2)),
  ),
  _ => throw Exception('Could not parse: $line'),
};

extension on Point<int> {
  int manhattanDistanceTo(Point<int> otherPoint) =>
      (x - otherPoint.x).abs() + (y - otherPoint.y).abs();
}
