// --- Day 2: Bathroom Security ---
// https://adventofcode.com/2016/day/2

String solveA(List<String> inputs) => solve(
  inputs,
  keypad: const [
    [" ", " ", " ", " ", " "],
    [" ", "1", "2", "3", " "],
    [" ", "4", "5", "6", " "],
    [" ", "7", "8", "9", " "],
    [" ", " ", " ", " ", " "],
  ],
);

String solveB(List<String> inputs) => solve(
  inputs,
  keypad: const [
    [" ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", "1", " ", " ", " "],
    [" ", " ", "2", "3", "4", " ", " "],
    [" ", "5", "6", "7", "8", "9", " "],
    [" ", " ", "A", "B", "C", " ", " "],
    [" ", " ", " ", "D", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " "],
  ],
);

String solve(List<String> inputs, {required List<List<String>> keypad}) {
  int x = 0;
  int y = 0;

  // Find 5 on keypad and use as start
  outer:
  for (y = 0; y < keypad.length; y++) {
    for (x = 0; x < keypad[y].length; x++) {
      if (keypad[y][x] == '5') {
        break outer;
      }
    }
  }

  StringBuffer sb = StringBuffer();

  for (String input in inputs) {
    for (int i = 0; i < input.length; i++) {
      switch (input[i]) {
        case "U": // UP
          y = (keypad[x][y - 1] != " ") ? y - 1 : y;
        case "D": // DOWN
          y = (keypad[x][y + 1] != " ") ? y + 1 : y;
        case "L": // LEFT
          x = (keypad[x - 1][y] != " ") ? x - 1 : x;
        case "R": // RIGHT
          x = (keypad[x + 1][y] != " ") ? x + 1 : x;
      }
    }

    sb.write(keypad[y][x]);
  }

  return sb.toString();
}
