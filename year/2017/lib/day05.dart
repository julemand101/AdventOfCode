// --- Day 5: A Maze of Twisty Trampolines, All Alike ---
// https://adventofcode.com/2017/day/5

typedef NextPositionCalculator =
    int Function(List<int> instructions, int position);

int solveA(List<String> input) => _solve(
  parse(input),
  (List<int> instructions, int pos) => pos + (instructions[pos]++),
);

int solveB(List<String> input) => _solve(
  parse(input),
  (List<int> instructions, int pos) =>
      pos +
      ((instructions[pos] < 3) ? instructions[pos]++ : instructions[pos]--),
);

List<int> parse(List<String> input) => [...input.map(int.parse)];

int _solve(List<int> instructions, NextPositionCalculator nextPosition) {
  int count = 0;

  for (int pos = 0; pos >= 0 && pos < instructions.length; count++) {
    pos = nextPosition(instructions, pos);
  }

  return count;
}
