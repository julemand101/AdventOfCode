// --- Day 6: Signals and Noise ---
// https://adventofcode.com/2016/day/6

String solveA(Iterable<String> input) =>
    solve(input, (e1, e2) => e1.value > e2.value ? e1 : e2);

String solveB(Iterable<String> input) =>
    solve(input, (e1, e2) => e1.value < e2.value ? e1 : e2);

String solve(
  Iterable<String> input,
  MapEntry<String, int> Function(
    MapEntry<String, int> e1,
    MapEntry<String, int> e2,
  )
  compare,
) {
  List<Map<String, int>> msg = .generate(8, (_) => {}, growable: false);

  for (final line in input) {
    for (int i = 0; i < line.length; i++) {
      msg[i].update(line[i], (i) => i + 1, ifAbsent: () => 1);
    }
  }

  return msg
      .where((map) => map.isNotEmpty)
      .map((map) => map.entries.reduce(compare).key)
      .join();
}
