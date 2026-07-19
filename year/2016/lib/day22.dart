// --- Day 22: Grid Computing ---
// https://adventofcode.com/2016/day/22

final pattern = RegExp(
  r'/dev/grid/node-x(\d+)-y(\d+)\s+(\d+)T\s+(\d+)T\s+(\d+)T\s+(\d+)%',
);

int solveA(Iterable<String> input) {
  final list = <({String id, int used, int avail})>[];

  for (final match in input.map(pattern.firstMatch).nonNulls) {
    final x = int.parse(match[1]!);
    final y = int.parse(match[2]!);
    //final size = int.parse(match[3]!);
    final used = int.parse(match[4]!);
    final avail = int.parse(match[5]!);
    //final usePct = int.parse(match[6]!);

    list.add((id: 'x$x-y$y', used: used, avail: avail));
  }

  var count = 0;

  for (final nodeA in list.where((node) => node.used != 0)) {
    for (final nodeB in list.where((node) => node.id != nodeA.id)) {
      if (nodeA.used <= nodeB.avail) {
        count++;
      }
    }
  }

  return count;
}
