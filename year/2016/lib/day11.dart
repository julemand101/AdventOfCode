// --- Day 11: Radioisotope Thermoelectric Generators ---
// https://adventofcode.com/2016/day/11

import 'dart:collection';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:trotter/trotter.dart';

final regExp = RegExp(
  r'([a-zA-Z]*)-compatible microchip|([a-zA-Z]*) generator',
);

abstract class Thing(final String name) {
  static int _nextId = 0;

  final int id = _nextId++;
}

class Chip(super.name) extends Thing {
  @override
  String toString() => '$name-compatible microchip';
}

class Generator(super.name) extends Thing {
  @override
  String toString() => '$name generator';
}

int solve(Iterable<String> input, {List<Thing> initFirstFloor = const []}) {
  final floors = <List<Thing>>[];

  for (final line in input) {
    final floor = <Thing>[];
    floors.add(floor);

    if (line.endsWith('contains nothing relevant.')) {
      continue;
    }
    for (final match in regExp.allMatches(line)) {
      if (match[1] case final microchip?) {
        floor.add(Chip(microchip));
      } else if (match[2] case final generator?) {
        floor.add(Generator(generator));
      }
    }
  }

  floors.first.addAll(initFirstFloor);

  final states = Queue<State>()
    ..add((steps: 0, elevatorAtFloor: 0, floorsState: floors));

  final stateHistory = List.generate(
    4,
    (_) => LinkedHashSet<Uint8List>(
      equals: (const ListEquality<int>()).equals,
      hashCode: (const ListEquality<int>()).hash,
    ),
  );

  while (states.isNotEmpty) {
    final (:elevatorAtFloor, :floorsState, :steps) = states.removeFirst();

    //print('Floor $elevatorAtFloor : $floorsState');

    if (!floorsState.every(validFloor)) {
      //print('\t Not valid floor!');
      continue;
    }

    final list = Uint8List(Thing._nextId);
    for (final (i, floor) in floorsState.indexed) {
      for (final item in floor) {
        list[item.id] = i;
      }
    }

    if (!stateHistory[elevatorAtFloor].add(list)) {
      //print('\t We have been here before!');
      continue;
    }

    // If all things are at top floor
    if (floorsState[0].isEmpty &&
        floorsState[1].isEmpty &&
        floorsState[2].isEmpty) {
      return steps;
    }

    for (final itemsToMove
        in floorsState[elevatorAtFloor].subsets().iterable.where(
          (list) => list.length == 1 || list.length == 2,
        )) {
      switch (itemsToMove) {
        case [Chip i1, Generator i2] when i1.name != i2.name:
        case [Generator i1, Chip i2] when i1.name != i2.name:
          continue;
      }

      // We can go down
      if (elevatorAtFloor > 0) {
        /*
        if (elevatorAtFloor == 3 && itemsToMove.length == 2) {
          print('Huh? $floorsState');
          continue;
        }
         */

        /*
        if (elevatorAtFloor != 0 &&
            floorsState.take(elevatorAtFloor).every((list) => list.isEmpty)) {
          print('Floor: $elevatorAtFloor : $floorsState');
          continue;
        }
         */

        final newFloorsState = floorsState.clone();

        for (final itemToMove in itemsToMove) {
          newFloorsState[elevatorAtFloor].remove(itemToMove);
          newFloorsState[elevatorAtFloor - 1].add(itemToMove);
        }

        //print('\tFloor: ${elevatorAtFloor - 1} : $newFloorsState');

        states.add((
          steps: steps + 1,
          elevatorAtFloor: elevatorAtFloor - 1,
          floorsState: newFloorsState,
        ));
      }

      // We can go up
      if (elevatorAtFloor < 3) {
        final newFloorsState = floorsState.clone();

        for (final itemToMove in itemsToMove) {
          newFloorsState[elevatorAtFloor].remove(itemToMove);
          newFloorsState[elevatorAtFloor + 1].add(itemToMove);
        }

        //print('\tFloor: ${elevatorAtFloor + 1} : $newFloorsState');

        states.add((
          steps: steps + 1,
          elevatorAtFloor: elevatorAtFloor + 1,
          floorsState: newFloorsState,
        ));
      }
    }
  }

  throw 'Did not find solution!';
}

typedef State = ({
  int steps,
  int elevatorAtFloor,
  List<List<Thing>> floorsState,
});

extension on List<List<Thing>> {
  List<List<Thing>> clone() => [
    for (final subList in this) [...subList],
  ];
}

bool validFloor(List<Thing> things) {
  final generators = things
      .whereType<Generator>()
      .map((generator) => generator.name)
      .toSet();

  if (generators.isEmpty) {
    return true;
  }

  return things
      .whereType<Chip>()
      .map((chip) => chip.name)
      .every(generators.contains);
}
