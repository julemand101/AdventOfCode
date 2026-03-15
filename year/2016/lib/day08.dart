// --- Day 8: Two-Factor Authentication ---
// https://adventofcode.com/2016/day/8

const int screenWide = 50;
const int screenTall = 6;

int solveA(Iterable<String> input) => solve(input).pixelCount;

String solveB(Iterable<String> input) => solve(input).display;

({int pixelCount, String display}) solve(Iterable<String> input) {
  List<List<bool>> display = List.generate(
    screenTall,
    (_) => List.filled(screenWide, false, growable: false),
    growable: false,
  );

  for (final line in input) {
    if (line.startsWith("rect ")) {
      List<String> temp = line.substring(5).split("x");
      int wide = int.parse(temp[0]); // x
      int tall = int.parse(temp[1]); // y

      drawRect(display, wide, tall);
    } else if (line.startsWith("rotate row y=")) {
      List<String> temp = line.substring(13).split(" by ");
      int y = int.parse(temp[0]);
      int count = int.parse(temp[1]);

      rotateRow(display, y, count);
    } else if (line.startsWith("rotate column x=")) {
      List<String> temp = line.substring(16).split(" by ");
      int x = int.parse(temp[0]);
      int count = int.parse(temp[1]);

      rotateColumn(display, x, count);
    }
  }

  return (pixelCount: countPixels(display), display: displayToString(display));
}

void drawRect(List<List<bool>> display, int wide, int tall) {
  for (int x = 0; x < tall; x++) {
    for (int y = 0; y < wide; y++) {
      display[x][y] = true;
    }
  }
}

void rotateColumn(List<List<bool>> display, int x, int count) {
  for (int i = 0; i < count; i++) {
    bool prev = display[screenTall - 1][x];

    for (int y = 0; y < screenTall; y++) {
      bool temp = display[y][x];
      display[y][x] = prev;
      prev = temp;
    }
  }
}

void rotateRow(List<List<bool>> display, int y, int count) {
  for (int i = 0; i < count; i++) {
    bool prev = display[y][screenWide - 1];

    for (int x = 0; x < screenWide; x++) {
      bool temp = display[y][x];
      display[y][x] = prev;
      prev = temp;
    }
  }
}

String displayToString(List<List<bool>> display) {
  StringBuffer sb = StringBuffer();

  for (List<bool> d in display) {
    for (bool b in d) {
      sb.write(b ? '#' : ' ');
    }
    sb.writeln();
  }

  return sb.toString();
}

// Turned on pixel is 'true' so it is easy to count
int countPixels(List<List<bool>> display) =>
    display.expand((line) => line).where((pixel) => pixel).length;
