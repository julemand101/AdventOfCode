// --- Day 25: Clock Signal ---
// https://adventofcode.com/2016/day/25

int solveA(List<String> input) {
  for (int i = 0; i < 10000; i++) {
    Map<String, int> register = {'a': i, 'b': 0, 'c': 0, 'd': 0};
    int next = 0;
    int count = 0;

    for (int output in runProgram(input, register)) {
      if (output == next) {
        if (++count > 100) {
          return i;
        }
        next = (next == 0) ? 1 : 0;
      } else {
        break;
      }
    }
  }

  throw 'Failed finding answer!';
}

Iterable<int> runProgram(
  List<String> program,
  Map<String, int> register,
) sync* {
  int pos = 0;

  while (pos < program.length) {
    List<String> command = program[pos].split(" ");

    switch (command[0]) {
      case 'cpy':
        int value = getValue(command[1], register);
        String reg = command[2];
        register[reg] = value;

      case 'inc':
        String reg = command[1];
        register.update(reg, (v) => v + 1);

      case 'dec':
        String reg = command[1];
        register.update(reg, (v) => v - 1);

      case 'jnz':
        int value = getValue(command[1], register);

        if (value != 0) {
          pos += getValue(command[2], register);
          continue;
        }

      case 'out':
        yield getValue(command[1], register);

      default:
        throw command;
    }

    pos++;
  }

  yield -1;
}

int getValue(String input, Map<String, int> register) =>
    int.tryParse(input) ?? register[input]!;
