// --- Day 19: Medicine for Rudolph ---
// https://adventofcode.com/2015/day/19

final regExp = RegExp(r'^(.+) => (.+)');

int solveA(Iterable<String> input) {
  final mappings = <String, List<String>>{};
  late final String molecule;
  var secondPart = false;

  for (final line in input) {
    if (line.isEmpty) {
      secondPart = true;
    } else if (secondPart) {
      molecule = line;
    } else {
      final match = regExp.firstMatch(line)!;
      mappings.update(
        match[1]!,
        (list) => list..add(match[2]!),
        ifAbsent: () => [match[2]!],
      );
    }
  }

  return {
    for (final match in RegExp(
      '(${mappings.keys.map(RegExp.escape).join('|')})',
    ).allMatches(molecule))
      for (final replacement in mappings[match[0]]!)
        molecule.replaceRange(match.start, match.end, replacement),
  }.length;
}

int solveB(Iterable<String> input) {
  final reverseMappings = <String, String>{};
  late String molecule;
  var secondPart = false;

  for (final line in input) {
    if (line.isEmpty) {
      secondPart = true;
    } else if (secondPart) {
      molecule = line;
    } else {
      final match = regExp.firstMatch(line)!;
      reverseMappings[match[2]!] = match[1]!;
    }
  }

  final pattern = RegExp(
    '(${reverseMappings.keys.map(RegExp.escape).join('|')})',
  );

  for (var steps = 1; true; steps++) {
    final lastMatch = pattern.allMatches(molecule).last;

    if ((molecule = molecule.replaceRange(
          lastMatch.start,
          lastMatch.end,
          reverseMappings[lastMatch[1]!]!,
        )) ==
        'e') {
      return steps;
    }
  }
}
