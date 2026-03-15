// --- Day 10: Balance Bots ---
// https://adventofcode.com/2016/day/10

import 'dart:math';

abstract class Thing {
  void take(Map<String, Thing> outputs, int value);
}

class Output extends Thing {
  final List<int> values = [];

  @override
  void take(Map<String, Thing> outputs, int value) {
    values.add(value);
  }

  @override
  String toString() {
    return "Values: $values";
  }
}

class Bot extends Thing {
  String name;
  String low;
  String high;
  int? buffer;

  void Function(String botId, int a, int b) checkForAnswerA;

  Bot(this.name, this.low, this.high, this.checkForAnswerA);

  @override
  void take(Map<String, Thing> outputs, int value) {
    if (buffer case final buffer?) {
      checkForAnswerA(name, value, buffer);
      outputs[low]!.take(outputs, min(value, buffer));
      outputs[high]!.take(outputs, max(value, buffer));
    } else {
      buffer = value;
    }
  }
}

int solveA(
  Iterable<String> input, {
  required int valueA,
  required int valueB,
}) => solve(input, valueA, valueB).partA;

int solveB(
  Iterable<String> input, {
  required int valueA,
  required int valueB,
}) => solve(input, valueA, valueB).partB;

({int partA, int partB}) solve(Iterable<String> input, int valueA, int valueB) {
  List<String> inputInstructions = [];
  Map<String, Thing> outputs = {};
  String? result;

  for (final line in input) {
    if (line.startsWith('value ')) {
      // value 5 goes to bot 2
      inputInstructions.add(line);
    } else {
      // bot 2 gives low to bot 1 and high to bot 0
      // bot 1 gives low to output 1 and high to bot 0
      int givesIndex = line.indexOf(' gives ');
      int andIndex = line.indexOf(' and ');

      String botId = line.substring(0, givesIndex);
      String lowId = line.substring(givesIndex + 14, andIndex);
      String highId = line.substring(andIndex + 13);

      if (lowId.startsWith('output') && !outputs.containsKey(lowId)) {
        outputs[lowId] = Output();
      }

      if (highId.startsWith('output') && !outputs.containsKey(highId)) {
        outputs[highId] = Output();
      }

      outputs[botId] = Bot(botId, lowId, highId, (botId, a, b) {
        if (a == valueA && b == valueB || a == valueB && b == valueA) {
          result = botId;
        }
      });
    }
  }

  for (String input in inputInstructions) {
    int value = int.parse(input.substring(6, input.indexOf(" goes")));
    String botId = input.substring(input.indexOf("bot")).trim();

    outputs[botId]!.take(outputs, value);
  }

  return (
    partA: int.parse(result!.substring(4)),
    partB:
        // --- Part Two ---
        // What do you get if you multiply together the values of one chip in
        // each of outputs 0, 1, and 2?
        (outputs["output 0"] as Output).values[0] *
        (outputs["output 1"] as Output).values[0] *
        (outputs["output 2"] as Output).values[0],
  );
}
