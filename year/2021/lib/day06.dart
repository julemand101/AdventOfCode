// --- Day 6: Lanternfish ---
// https://adventofcode.com/2021/day/6

int solveA(String input) => solve(input, simulateDays: 80);
int solveB(String input) => solve(input, simulateDays: 256);

int solve(String input, {required int simulateDays}) {
  final lanternFishList = input.split(',').map(int.parse).fold(
    List.filled(9, 0, growable: false),
    (list, daysBeforeNewFish) {
      list[daysBeforeNewFish]++;
      return list;
    },
  );

  for (var day = 0; day < simulateDays; day++) {
    lanternFishList[(day + 7) % lanternFishList.length] +=
        lanternFishList[day % lanternFishList.length];
  }

  return lanternFishList.reduce((a, b) => a + b);
}
