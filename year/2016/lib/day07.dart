// --- Day 7: Internet Protocol Version 7 ---
// https://adventofcode.com/2016/day/7

int solveA(Iterable<String> input) {
  int count = 0;

  for (final line in input) {
    bool positive = false;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      if (char == "[" || i + 1 >= line.length) {
        if (i + 1 >= line.length) {
          // Add the last char
          buffer.write(char);
        }
        // Buffer contains positive content
        if (positive == false && isABBA(buffer.toString())) {
          positive = true;
        }
        buffer.clear();
      } else if (char == "]") {
        // Buffer contains negative content
        if (isABBA(buffer.toString())) {
          positive = false;
          break;
        }
        buffer.clear();
      } else {
        // Still need more data!!!!
        buffer.write(char);
      }
    }

    if (positive) {
      count++;
    }
  }

  return count;
}

bool isABBA(String test) {
  for (int i = 0; i <= (test.length - 4); i++) {
    String sub = test.substring(i, i + 4);

    if (sub[0] == sub[3] &&
        sub[1] == sub[2] &&
        sub[0] != sub[1] &&
        sub[2] != sub[3]) {
      return true;
    }
  }

  return false;
}

int solveB(Iterable<String> input) {
  int count = 0;

  for (final line in input) {
    Set<String> positiveSet = {};
    Set<String> negativeSet = {};
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      if (char == "[" || i + 1 >= line.length) {
        if (i + 1 >= line.length) {
          // Add the last char
          buffer.write(char);
        }
        // Buffer contains positive content
        positiveSet.addAll(getABA(buffer.toString()));
        buffer.clear();
      } else if (char == "]") {
        // Buffer contains negative content
        negativeSet.addAll(getBAB(buffer.toString()));
        buffer.clear();
      } else {
        // Still need more data!!!!
        buffer.write(char);
      }
    }

    if (positiveSet.intersection(negativeSet).isNotEmpty) {
      count++;
    }
  }

  return count;
}

Iterable<String> getABA(String test) sync* {
  for (int i = 0; i <= (test.length - 3); i++) {
    String sub = test.substring(i, i + 3);

    if (sub[0] == sub[2] && sub[0] != sub[1]) {
      yield sub;
    }
  }
}

Iterable<String> getBAB(String test) =>
    getABA(test).map((aba) => "${aba[1]}${aba[0]}${aba[1]}");
