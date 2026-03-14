// --- Day 10: Knot Hash ---
// https://adventofcode.com/2017/day/10

typedef KnotHashResult = ({
  int day10aSolution,
  int currentPosition,
  int skipSize,
});

int solveA(String lengths, {required int circularListLength}) {
  return _knotHashRound(
    lengths: lengths.split(',').map(int.parse).toList(growable: false),
    circularList: List.generate(circularListLength, (x) => x, growable: false),
  ).day10aSolution;
}

String solveB(String input) {
  final lengths = [...input.codeUnits, 17, 31, 73, 47, 23];
  final circularList = List.generate(256, (x) => x);
  var result = (day10aSolution: 0, currentPosition: 0, skipSize: 0);

  // run a total of 64 rounds
  for (int i = 0; i < 64; i++) {
    result = _knotHashRound(
      lengths: lengths,
      circularList: circularList,
      currentPosition: result.currentPosition,
      skipSize: result.skipSize,
    );
  }

  final sb = StringBuffer();
  for (int i = 0; i < 256; i += 16) {
    final hex = circularList
        .getRange(i, i + 16)
        .fold<int>(0, (x, y) => x ^ y)
        .toRadixString(16);

    sb.write(hex.padLeft(2, '0'));
  }

  return sb.toString();
}

KnotHashResult _knotHashRound({
  required List<int> lengths,
  required List<int> circularList,
  int currentPosition = 0,
  int skipSize = 0,
}) {
  var newCurrentPosition = currentPosition;
  var newSkipSize = skipSize;

  for (final length in lengths) {
    _reverse(circularList, newCurrentPosition, newCurrentPosition + length);
    newCurrentPosition =
        (newCurrentPosition + length + newSkipSize++) % circularList.length;
  }

  return (
    day10aSolution: circularList[0] * circularList[1],
    currentPosition: newCurrentPosition,
    skipSize: newSkipSize,
  );
}

void _reverse(List<int> list, int start, int end) {
  final subList = <int>[];

  for (
    var i = start % list.length;
    (i + 1 % list.length) != (end + 1 % list.length);
    i++
  ) {
    subList.add(list[i % list.length]);
  }

  var pos = start;
  for (final element in subList.reversed) {
    list[pos++ % list.length] = element;
  }
}
