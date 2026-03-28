// --- Day 3: Perfectly Spherical Houses in a Vacuum ---
// https://adventofcode.com/2015/day/3

int solveA(String input) {
  var x = 0, y = 0;
  final visitedHouses = {(x, y)};

  for (var i = 0; i < input.length; i++) {
    switch (input[i]) {
      case '^':
        y--;
      case 'v':
        y++;
      case '>':
        x++;
      case '<':
        x--;
    }
    visitedHouses.add((x, y));
  }

  return visitedHouses.length;
}

int solveB(String input) {
  var santaX = 0, santaY = 0;
  var roboSantaX = 0, roboSantaY = 0;
  final visitedHouses = {(santaX, santaY)};

  for (var i = 0; i < input.length; i++) {
    if (i % 2 == 0) {
      switch (input[i]) {
        case '^':
          santaY--;
        case 'v':
          santaY++;
        case '>':
          santaX++;
        case '<':
          santaX--;
      }
      visitedHouses.add((santaX, santaY));
    } else {
      switch (input[i]) {
        case '^':
          roboSantaY--;
        case 'v':
          roboSantaY++;
        case '>':
          roboSantaX++;
        case '<':
          roboSantaX--;
      }
      visitedHouses.add((roboSantaX, roboSantaY));
    }
  }

  return visitedHouses.length;
}
