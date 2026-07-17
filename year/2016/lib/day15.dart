// --- Day 15: Timing is Everything ---
// https://adventofcode.com/2016/day/15

final inputPattern = RegExp(
  r'Disc #(\d+) has (\d+) positions; at time=(\d+), it is at position (\d+).',
);

int solve(Iterable<String> input) {
  List<bool Function(int time)> discs = [];

  for (final match in input.map(inputPattern.firstMatch).nonNulls) {
    final id = int.parse(match[1]!);
    final positions = int.parse(match[2]!);
    //final time = int.parse(match[3]!);
    final positionAtTime = int.parse(match[4]!);

    discs.add((time) => ((positionAtTime + time + id) % positions) == 0);
  }

  for (var time = 0; true; time++) {
    if (discs.every((f) => f(time))) {
      return time;
    }
  }
}
