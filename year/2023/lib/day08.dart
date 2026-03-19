// --- Day 8: Haunted Wasteland ---
// https://adventofcode.com/2023/day/8

int solveA(Iterable<String> input) {
  RegExp regExp = RegExp(r'(.+) = \((.+), (.+)\)');
  Map<String, ({String left, String right})> network = {};
  // left = true, right = false
  List<bool>? instructions;

  for (final line in input.where((line) => line.isNotEmpty)) {
    // First line contains instructions
    if (instructions == null) {
      instructions = [...line.split('').map((letter) => letter == 'L')];
      continue;
    }

    final match = regExp.firstMatch(line)!;
    network[match[1]!] = (left: match[2]!, right: match[3]!);
  }
  instructions!;

  var currentPosition = 'AAA';
  var steps = 0;

  while (currentPosition != 'ZZZ') {
    final nextStep = network[currentPosition]!;

    currentPosition = instructions[steps++ % instructions.length]
        ? nextStep.left
        : nextStep.right;
  }

  return steps;
}

int solveB(Iterable<String> input) {
  RegExp regExp = RegExp(r'(.+) = \((.+), (.+)\)');
  Map<String, ({String left, String right})> network = {};
  // left = true, right = false
  List<bool>? instructions;

  for (final line in input.where((line) => line.isNotEmpty)) {
    // First line contains instructions
    if (instructions == null) {
      instructions = [...line.split('').map((letter) => letter == 'L')];
      continue;
    }

    final match = regExp.firstMatch(line)!;
    network[match[1]!] = (left: match[2]!, right: match[3]!);
  }
  instructions!;

  final currentPositions = [...network.keys.where((pos) => pos.endsWith('A'))];
  final stepsToStop = List.filled(currentPositions.length, 0);
  var steps = 0;

  while (stepsToStop.contains(0)) {
    final instruction = instructions[steps++ % instructions.length];

    for (var i = 0; i < currentPositions.length; i++) {
      final nextStep = network[currentPositions[i]]!;

      currentPositions[i] = instruction ? nextStep.left : nextStep.right;

      if (currentPositions[i].endsWith('Z') && stepsToStop[i] == 0) {
        stepsToStop[i] = steps;
      }
    }
  }

  // least common multiple (LCM);
  return stepsToStop.reduce((a, b) => a * b ~/ a.gcd(b));
}
