// --- Day 16: Aunt Sue ---
// https://adventofcode.com/2015/day/16

final regExp = RegExp(r'^Sue (\d+): (.+): (\d+), (.+): (\d+), (.+): (\d+)');

const matchParameters = {
  'children': 3,
  'cats': 7,
  'samoyeds': 2,
  'pomeranians': 3,
  'akitas': 0,
  'vizslas': 0,
  'goldfish': 5,
  'trees': 3,
  'cars': 2,
  'perfumes': 1,
};

int solve(Iterable<String> input, {required bool partB}) => input
    .map(regExp.firstMatch)
    .nonNulls
    .map(
      (match) => (
        sueId: int.parse(match[1]!),
        properties: {
          match[2]!: int.parse(match[3]!),
          match[4]!: int.parse(match[5]!),
          match[6]!: int.parse(match[7]!),
        },
      ),
    )
    .where((sue) {
      for (final MapEntry(key: param, :value) in sue.properties.entries) {
        switch (param) {
          case 'cats' when partB:
          case 'trees' when partB:
            if (matchParameters[param]! >= value) {
              return false;
            }
          case 'pomeranians' when partB:
          case 'goldfish' when partB:
            if (matchParameters[param]! <= value) {
              return false;
            }
          default:
            if (matchParameters[param]! != value) {
              return false;
            }
        }
      }
      return true;
    })
    .first
    .sueId;
