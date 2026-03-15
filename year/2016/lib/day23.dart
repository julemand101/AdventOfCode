// --- Day 23: Safe Cracking ---
// https://adventofcode.com/2016/day/23

int solve(List<String> input, {int eggs = 0}) =>
    runProgram(parse(input), {'a': eggs, 'b': 0, 'c': 0, 'd': 0});

List<List<String>> parse(List<String> source) =>
    source.map((String line) => line.split(" ")).toList(growable: false);

int runProgram(List<List<String>> program, Map<String, int> register) {
  int pos = 0;

  while (pos < program.length) {
    List<String> command = program[pos];

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

      case 'tgl':
        int value = pos + getValue(command[1], register);

        if (value > 0 && value < program.length) {
          String c = program[value][0];

          switch (program[value].length) {
            case 2: // one-argument instructions
              if (c == "inc") {
                program[value][0] = "dec";
              } else {
                program[value][0] = "inc";
              }
            case 3: // two-argument instructions
              if (c == "jnz") {
                program[value][0] = "cpy";
              } else {
                program[value][0] = "jnz";
              }
            default:
              throw command;
          }
        }

      default:
        throw command;
    }

    pos++;
  }

  return register["a"]!;
}

int getValue(String input, Map<String, int> register) =>
    int.tryParse(input) ?? register[input]!;
