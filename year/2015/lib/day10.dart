// --- Day 10: Elves Look, Elves Say ---
// https://adventofcode.com/2015/day/10

int solve(String input, {int iterations = 1}) {
  for (var i = 0; i < iterations; i++) {
    input = lookAndSay(input);
  }
  return input.length;
}

String lookAndSay(String input) {
  final sb = StringBuffer();

  String char = input[0];
  int amount = 1;

  for (var i = 1; i < input.length; i++) {
    if (char == input[i]) {
      amount++;
    } else {
      sb
        ..write(amount)
        ..write(char);
      char = input[i];
      amount = 1;
    }
  }

  return (sb
        ..write(amount)
        ..write(char))
      .toString();
}
