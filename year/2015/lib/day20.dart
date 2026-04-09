// --- Day 20: Infinite Elves and Infinite Houses ---
// https://adventofcode.com/2015/day/20

import 'dart:typed_data';

int solveA(int target) {
  final houses = Uint32List(target);

  for (var elf = 1; elf <= target; elf++) {
    for (var house = elf - 1; house < target; house += elf) {
      houses[house] += elf * 10;
    }
  }

  for (final (index, houseValue) in houses.indexed) {
    if (houseValue >= target) {
      return index + 1;
    }
  }

  throw 'Failed';
}

int solveB(int target) {
  final houses = Uint32List(target);

  for (var elf = 1; elf <= target; elf++) {
    for (
      var house = elf - 1, count = 0;
      house < target && count < 50;
      house += elf, count++
    ) {
      houses[house] += elf * 11;
    }
  }

  for (final (index, houseValue) in houses.indexed) {
    if (houseValue >= target) {
      return index + 1;
    }
  }

  throw 'Failed';
}
