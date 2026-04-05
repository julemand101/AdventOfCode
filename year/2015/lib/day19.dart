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

  final pattern = RegExp('(${mappings.keys.map(RegExp.escape).join('|')})');
  var currentStrings = {'e'};

  for (var level = 1; true; level++) {
    currentStrings = {
      for (final current in currentStrings)
        for (final match in pattern.allMatches(current))
          if (molecule.startsWith(current.substring(0, match.start)))
            for (final replacement in mappings[match[0]]!)
              current.replaceRange(match.start, match.end, replacement),
    };

    print(currentStrings);

    if (currentStrings.contains(molecule)) {
      return level;
    }
  }
}
