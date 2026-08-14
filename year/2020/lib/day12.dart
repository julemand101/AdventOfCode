// --- Day 12: Rain Risk ---
// https://adventofcode.com/2020/day/12

const directionMap = {
  'N': Point(0, -1),
  'S': Point(0, 1),
  'E': Point(1, 0),
  'W': Point(-1, 0),
};

const facingMap = {0: 'E', 90: 'S', 180: 'W', 270: 'N'};

extension type const Point._(({int x, int y}) p) {
  const new(int x, int y) : this._((x: x, y: y));

  int get x => p.x;

  int get y => p.y;

  Point operator +(Point other) => Point(x + other.x, y + other.y);

  Point operator *(int factor) => Point(p.x * factor, p.y * factor);
}

Point rotate(Point point, int degrees) => (degrees % 360 == 0)
    ? point
    : rotate(Point(point.y * -1, point.x), (degrees % 360) - 90);

int solveA(Iterable<String> input) {
  var position = Point(0, 0);
  var facing = 0;

  for (final line in input) {
    final action = line[0];
    final value = int.parse(line.substring(1));

    if (directionMap.containsKey(action)) {
      position += directionMap[action]! * value;
    } else if (action == 'L') {
      facing -= value;
    } else if (action == 'R') {
      facing += value;
    } else if (action == 'F') {
      position += directionMap[facingMap[facing % 360]!]! * value;
    } else {
      throw Exception('Could not understand: $line');
    }
  }

  return position.x.abs() + position.y.abs();
}

int solveB(Iterable<String> input) {
  var waypointPosition = Point(10, -1);
  var shipPosition = Point(0, 0);

  for (final line in input) {
    final action = line[0];
    final value = int.parse(line.substring(1));

    if (directionMap.containsKey(action)) {
      waypointPosition += directionMap[action]! * value;
    } else if (action == 'L') {
      waypointPosition = rotate(waypointPosition, -value);
    } else if (action == 'R') {
      waypointPosition = rotate(waypointPosition, value);
    } else if (action == 'F') {
      shipPosition += waypointPosition * value;
    } else {
      throw Exception('Could not understand: $line');
    }
  }

  return shipPosition.x.abs() + shipPosition.y.abs();
}
