// --- Day 11: Monkey in the Middle ---
// https://adventofcode.com/2022/day/11

import 'dart:collection';

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => solve(input, rounds: 20, partB: false);
int solveB(Iterable<String> input) => solve(input, rounds: 10000, partB: true);

int solve(Iterable<String> input, {required int rounds, required bool partB}) {
  List<Monkey> monkeys = input
      .splitBetween((first, second) => first.isEmpty || second.isEmpty)
      .where((element) => element.length == 6)
      .map(Monkey.parse)
      .toList(growable: false);

  int superModulo = monkeys.map((e) => e.divisibleBy).reduce((a, b) => a * b);

  for (int round = 0; round < rounds; round++) {
    for (final monkey in monkeys) {
      monkey.inspect(monkeys, partB: partB, superModulo: superModulo);
    }
  }

  monkeys.sort(
    (a, b) => b.inspectedItemsCount.compareTo(a.inspectedItemsCount),
  );

  return monkeys
      .take(2)
      .map((e) => e.inspectedItemsCount)
      .reduce((a, b) => a * b);
}

class Monkey({
  required final int id,
  required final Queue<int> items,
  required final int Function(int) operation,
  required final int divisibleBy,
  required final int throwToMonkeyIfTrue,
  required final int throwToMonkeyIfFalse,
}) {
  int inspectedItemsCount = 0;

  factory parse(List<String> lines) {
    final id = int.parse(RegExp(r'Monkey (\d+):').firstMatch(lines[0])![1]!);
    final items = Queue.of(
      lines[1].split(': ').last.split(', ').map(int.parse),
    );
    final operation = parseOperation(lines[2]);
    final divisibleBy = int.parse(lines[3].split('by ').last);
    final throwToMonkeyIfTrue = int.parse(lines[4].split('monkey ').last);
    final throwToMonkeyIfFalse = int.parse(lines[5].split('monkey ').last);

    return Monkey(
      id: id,
      items: items,
      operation: operation,
      divisibleBy: divisibleBy,
      throwToMonkeyIfTrue: throwToMonkeyIfTrue,
      throwToMonkeyIfFalse: throwToMonkeyIfFalse,
    );
  }

  static int Function(int) parseOperation(String line) {
    RegExp regExp = RegExp(r'Operation: new = old ([*+]) (old|\d+)');
    RegExpMatch match = regExp.firstMatch(line)!;

    String operation = match[1]!;
    int? value = int.tryParse(match[2]!);

    return (int old) => switch (operation) {
      '*' => old * (value ?? old),
      '+' => old + (value ?? old),
      _ => throw 'Unknown operation: $operation in $line',
    };
  }

  void inspect(
    List<Monkey> monkeys, {
    required int superModulo,
    required bool partB,
  }) {
    while (items.isNotEmpty) {
      final newWorryValue =
          (partB
              ? (operation(items.removeFirst()))
              : (operation(items.removeFirst()) ~/ 3)) %
          superModulo;

      monkeys[(newWorryValue % divisibleBy == 0)
              ? throwToMonkeyIfTrue
              : throwToMonkeyIfFalse]
          .items
          .add(newWorryValue);

      inspectedItemsCount++;
    }
  }
}
