// --- Day 3: Squares With Three Sides ---
// https://adventofcode.com/2016/day/3

int solveA(Iterable<String> input) {
  RegExp spacePattern = RegExp(r' +');
  int count = 0;

  for (String line in input.map((line) => line.trim())) {
    final [a, b, c] = line.split(spacePattern);

    if (check(int.parse(a), int.parse(b), int.parse(c))) {
      count++;
    }
  }

  return count;
}

int solveB(Iterable<String> input) {
  RegExp spacePattern = RegExp(r' +');
  List<List<int>> buffer = [];
  int count = 0;

  for (String line in input.map((line) => line.trim())) {
    buffer.add([...line.split(spacePattern).map(int.parse)]);

    if (buffer.length == 3) {
      for (int i = 0; i < buffer.length; i++) {
        if (check(buffer[0][i], buffer[1][i], buffer[2][i])) {
          count++;
        }
      }
      buffer.clear();
    }
  }

  return count;
}

bool check(int a, int b, int c) => a + b > c && a + c > b && b + c > a;
