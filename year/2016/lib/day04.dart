// --- Day 4: Security Through Obscurity ---
// https://adventofcode.com/2016/day/4

int solveA(Iterable<String> input) => solve(input, findB: false);

int solveB(Iterable<String> input) => solve(input, findB: true);

RegExp linePattern = RegExp(r'(.+)-(\d+)\[(.+)]');

({String encryptedName, int id, String hash}) parseLine(String line) {
  final match = linePattern.firstMatch(line)!;

  return (encryptedName: match[1]!, id: int.parse(match[2]!), hash: match[3]!);
}

int solve(Iterable<String> input, {required bool findB}) {
  int sum = 0;

  for (final (:encryptedName, :id, :hash) in input.map(parseLine)) {
    Map<String, int> map = {};

    for (int i = 0; i < encryptedName.length; i++) {
      if (encryptedName[i] == '-') continue;
      map.update(encryptedName[i], (value) => value + 1, ifAbsent: () => 1);
    }

    List<MapEntry<String, int>> list = [...map.entries]
      ..sort(
        (MapEntry<String, int> a, MapEntry<String, int> b) =>
            a.value == b.value ? a.key.compareTo(b.key) : b.value - a.value,
      );

    if (list.getRange(0, 5).map((l) => l.key).join() == hash) {
      sum += id;

      if (findB &&
          getDecryptedName(
            encryptedName,
            id,
          ).startsWith("northpole object storage")) {
        return id;
      }
    }
  }

  return sum;
}

String getDecryptedName(String encryptedName, int id) {
  StringBuffer sb = StringBuffer();

  for (int i = 0; i < encryptedName.length; i++) {
    String value = encryptedName[i];

    if (value == "-") {
      sb.write(" ");
      continue;
    }

    int pos = alphabet.indexOf(value);
    int newPos = (pos + id) % alphabet.length;

    sb.write(alphabet[newPos]);
  }

  return sb.toString();
}

const alphabet = [
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
];
