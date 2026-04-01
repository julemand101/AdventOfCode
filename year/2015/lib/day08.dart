// --- Day 8: Matchsticks ---
// https://adventofcode.com/2015/day/8

int solveA(Iterable<String> input) {
  var result = 0;

  for (var line in input) {
    result += line.length;

    // All strings start and end with " which should be skipped
    for (var i = 1; i < line.length - 1; i++) {
      if (line[i] == r'\') {
        i += line[i + 1] == 'x' ? 3 : 1;
      }
      result--;
    }
  }

  return result;
}

int solveB(Iterable<String> input) {
  var result = 0;

  for (var line in input) {
    for (var i = 0; i < line.length; i++) {
      result += line[i] == r'"' || line[i] == r'\' ? 2 : 1;
    }

    // 2 since string starts and ends with "
    result -= line.length - 2;
  }

  return result;
}
