// --- Day 15: Timing is Everything ---
// https://adventofcode.com/2016/day/15

final inputPattern = RegExp(
  r'Disc #(\d+) has (\d+) positions; at time=0, it is at position (\d+).',
);

int solve(Iterable<String> input) {
  List<({int id, int positions, int positionAtTime})> discs = [];

  for (final match in input.map(inputPattern.firstMatch).nonNulls) {
    final id = int.parse(match[1]!);
    final positions = int.parse(match[2]!);
    final positionAtTime = int.parse(match[3]!);

    discs.add((id: id, positions: positions, positionAtTime: positionAtTime));
  }

  for (var time = 0; true; time++) {
    if (discs.every(
      (disc) => ((disc.positionAtTime + time + disc.id) % disc.positions) == 0,
    )) {
      return time;
    }
  }
}
