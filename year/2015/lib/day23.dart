// --- Day 23: Opening the Turing Lock ---
// https://adventofcode.com/2015/day/23

final splitRegExp = RegExp(r' |, ');

({int a, int b}) solve(Iterable<String> input, {int registerA = 0}) {
  final program = input
      .map((line) => line.split(splitRegExp))
      .toList(growable: false);

  var a = registerA;
  var b = 0;

  for (var i = 0; i < program.length; i++) {
    switch (program[i][0]) {
      case 'hlf':
        switch (program[i][1]) {
          case 'a':
            a = a ~/ 2;
          case 'b':
            b = b ~/ 2;
          case final argument:
            throw 'Unknown argument: $argument';
        }
      case 'tpl':
        switch (program[i][1]) {
          case 'a':
            a = a * 3;
          case 'b':
            b = b * 3;
          case final argument:
            throw 'Unknown argument: $argument';
        }
      case 'inc':
        switch (program[i][1]) {
          case 'a':
            a++;
          case 'b':
            b++;
          case final argument:
            throw 'Unknown argument: $argument';
        }
      case 'jmp':
        i += int.parse(program[i][1]) - 1;
      case 'jie':
        switch (program[i][1]) {
          case 'a':
            if (a % 2 == 0) {
              i += int.parse(program[i][2]) - 1;
            }
          case 'b':
            if (b % 2 == 0) {
              i += int.parse(program[i][2]) - 1;
            }
          case final argument:
            throw 'Unknown argument: $argument';
        }
      case 'jio':
        switch (program[i][1]) {
          case 'a':
            if (a == 1) {
              i += int.parse(program[i][2]) - 1;
            }
          case 'b':
            if (b == 1) {
              i += int.parse(program[i][2]) - 1;
            }
          case final argument:
            throw 'Unknown argument: $argument';
        }
      case final instruction:
        throw 'Unknown instruction: $instruction';
    }
  }

  return (a: a, b: b);
}
