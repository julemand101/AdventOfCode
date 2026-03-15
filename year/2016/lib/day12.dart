// --- Day 12: Leonardo's Monorail ---
// https://adventofcode.com/2016/day/12

int solveA(List<String> input) =>
    runProgram(input, {'a': 0, 'b': 0, 'c': 0, 'd': 0});

int solveB(List<String> input) =>
    runProgram(input, {'a': 0, 'b': 0, 'c': 1, 'd': 0});

int runProgram(List<String> program, Map<String, int> register) {
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
    }

    pos++;
  }

  return register['a']!;
}

int getValue(String input, Map<String, int> register) =>
    int.tryParse(input) ?? register[input]!;
