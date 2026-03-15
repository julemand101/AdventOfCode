// --- Day 9: Explosives in Cyberspace ---
// https://adventofcode.com/2016/day/9

enum Part { a, b }

int solveA(String input) => solve(input, Part.a);

int solveB(String input) => solve(input, Part.b);

int solve(String input, Part part) {
  int count = 0;
  StringBuffer buffer = StringBuffer();
  bool markerRead = false;

  for (int i = 0; i < input.length; i++) {
    String char = input[i];

    if (char == ")") {
      String marker = (buffer..write(char)).toString();
      buffer.clear();

      List<String> ls = marker.substring(1, marker.length - 1).split("x");
      int chars = int.parse(ls[0]);
      int repeat = int.parse(ls[1]);

      switch (part) {
        case .a:
          count += chars * repeat;
        case .b:
          count += solve(input.substring(i + 1, i + chars + 1), part) * repeat;
      }

      i += chars;
      markerRead = false;
    } else if (char == "(" || markerRead) {
      buffer.write(char);
      markerRead = true;
    } else {
      count++;
    }
  }

  return count;
}
