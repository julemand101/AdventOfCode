// --- Day 1: No Time for a Taxicab ---
// https://adventofcode.com/2016/day/1

enum Direction { north, east, south, west }

typedef Point = ({int x, int y});

int solveA(String input) {
  Direction direction = Direction.north;
  int x = 0;
  int y = 0;

  for (String part in input.split(", ")) {
    int length = int.parse(part.substring(1));
    direction = move(direction, part);

    switch (direction) {
      case Direction.north:
        y += length;
      case Direction.east:
        x += length;
      case Direction.south:
        y -= length;
      case Direction.west:
        x -= length;
    }
  }

  return x.abs() + y.abs();
}

int solveB(String input) {
  Direction direction = Direction.north;
  Set<Point> history = <Point>{};
  int x = 0;
  int y = 0;

  for (String part in input.split(", ")) {
    int length = int.parse(part.substring(1));
    direction = move(direction, part);

    switch (direction) {
      case Direction.north:
        for (int i = 0; i < length; i++) {
          if (!history.add((x: x, y: y += 1))) {
            return x.abs() + y.abs();
          }
        }
      case Direction.east:
        for (int i = 0; i < length; i++) {
          if (!history.add((x: x += 1, y: y))) {
            return x.abs() + y.abs();
          }
        }
      case Direction.south:
        for (int i = 0; i < length; i++) {
          if (!history.add((x: x, y: y -= 1))) {
            return x.abs() + y.abs();
          }
        }
      case Direction.west:
        for (int i = 0; i < length; i++) {
          if (!history.add((x: x -= 1, y: y))) {
            return x.abs() + y.abs();
          }
        }
    }
  }

  throw "Did not find any result!";
}

Direction move(Direction d, String move) => move[0] == "L"
    ? switch (d) {
        Direction.north => Direction.west,
        Direction.east => Direction.north,
        Direction.south => Direction.east,
        Direction.west => Direction.south,
      }
    : switch (d) {
        Direction.north => Direction.east,
        Direction.east => Direction.south,
        Direction.south => Direction.west,
        Direction.west => Direction.north,
      };
