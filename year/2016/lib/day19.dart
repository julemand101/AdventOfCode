// --- Day 19: An Elephant Named Joseph ---
// https://adventofcode.com/2016/day/19

import 'dart:collection';

final class Elf extends LinkedListEntry<Elf> {
  final int id;
  int value = 1;

  Elf(this.id);
}

int solveA(int input) {
  final elves = LinkedList<Elf>();

  for (var i = 0; i < input; i++) {
    elves.add(Elf(i + 1));
  }

  var currentElf = elves.first;

  while (currentElf.next != null || currentElf.previous != null) {
    final nextElf = (currentElf.next ?? elves.first)..unlink();

    currentElf.value += nextElf.value;
    currentElf = currentElf.next ?? elves.first;
  }

  return currentElf.id;
}

int solveB(int target) {
  var i = 1;
  while (i * 3 < target) {
    i *= 3;
  }
  return target - i;
}
