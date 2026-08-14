// --- Day 15: Beacon Exclusion Zone ---
// https://adventofcode.com/2022/day/15

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

({Point sensorAtPoint, Point closestBeaconPoint}) parseLine(String line) {
  final match = regExp.firstMatch(line)!;

  return (
    sensorAtPoint: Point(int.parse(match[1]!), int.parse(match[2]!)),
    closestBeaconPoint: Point(int.parse(match[3]!), int.parse(match[4]!)),
  );
}

extension type const Point._(({int x, int y}) p) {
  const new(int x, int y) : this._((x: x, y: y));

  int get x => p.x;
  int get y => p.y;

  int manhattanDistanceTo(Point otherPoint) =>
      (x - otherPoint.x).abs() + (y - otherPoint.y).abs();
}
