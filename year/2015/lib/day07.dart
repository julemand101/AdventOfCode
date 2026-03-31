// --- Day 7: Some Assembly Required ---
// https://adventofcode.com/2015/day/7

import 'dart:typed_data';

final constantPattern = RegExp(r'^([^\s.]+) -> (.+)');

final andPattern = RegExp(r'^([^\s.]+) AND ([^\s.]+) -> (.+)');
final orPattern = RegExp(r'^([^\s.]+) OR ([^\s.]+) -> (.+)');

final lShiftPattern = RegExp(r'^([^\s.]+) LSHIFT (\d+) -> (.+)');
final rShiftPattern = RegExp(r'^([^\s.]+) RSHIFT (\d+) -> (.+)');

final notPattern = RegExp(r'NOT ([^\s.]+) -> (.+)');

Map<String, int> solveA(Iterable<String> input) => solve(input);

Map<String, int> solveB(Iterable<String> input, {required int overrideWireB}) =>
    solve(input, overrideWireB);

Map<String, int> solve(Iterable<String> input, [int? overrideWireB]) {
  final instructionMap = <String, Instruction>{};

  for (final line in input) {
    if (constantPattern.firstMatch(line) case final match?) {
      // 123 -> x
      final key = match[2]!;
      final value = overrideWireB != null && key == 'b'
          ? ConstantReference(overrideWireB)
          : Reference(instructionMap, match[1]!);

      instructionMap[key] = ConstantInstruction(instructionMap, value);
    } else if (andPattern.firstMatch(line) case final match?) {
      // x AND y -> z
      final arg1 = Reference(instructionMap, match[1]!);
      final arg2 = Reference(instructionMap, match[2]!);
      final dest = match[3]!;

      instructionMap[dest] = AndInstruction(instructionMap, arg1, arg2);
    } else if (orPattern.firstMatch(line) case final match?) {
      // x OR y -> z
      final arg1 = Reference(instructionMap, match[1]!);
      final arg2 = Reference(instructionMap, match[2]!);
      final dest = match[3]!;

      instructionMap[dest] = OrInstruction(instructionMap, arg1, arg2);
    } else if (lShiftPattern.firstMatch(line) case final match?) {
      // p LSHIFT 2 -> q
      final arg = Reference(instructionMap, match[1]!);
      final shift = int.parse(match[2]!);
      final dest = match[3]!;

      instructionMap[dest] = LShiftInstruction(instructionMap, arg, shift);
    } else if (rShiftPattern.firstMatch(line) case final match?) {
      // p RSHIFT 2 -> q
      final arg = Reference(instructionMap, match[1]!);
      final shift = int.parse(match[2]!);
      final dest = match[3]!;

      instructionMap[dest] = RShiftInstruction(instructionMap, arg, shift);
    } else if (notPattern.firstMatch(line) case final match?) {
      // NOT e -> f
      final arg = Reference(instructionMap, match[1]!);
      final dest = match[2]!;

      instructionMap[dest] = NotInstruction(instructionMap, arg);
    } else {
      throw "Unknown instruction: $line";
    }
  }

  return instructionMap.map(
    (key, instruction) => MapEntry(key, instruction.value),
  );
}

abstract class Reference {
  int get value;

  factory Reference(
    Map<String, Instruction> instructionMap,
    String refOrValue,
  ) {
    if (int.tryParse(refOrValue) case final value?) {
      return ConstantReference(value);
    } else {
      return VariableReference(instructionMap, refOrValue);
    }
  }
}

class ConstantReference implements Reference {
  @override
  final int value;

  ConstantReference(this.value);
}

class VariableReference implements Reference {
  final Map<String, Instruction> instructionMap;
  final String key;

  VariableReference(this.instructionMap, this.key);

  @override
  int get value => instructionMap[key]!.value;
}

abstract class Instruction {
  final Map<String, Instruction> instructionMap;

  Instruction(this.instructionMap);

  late final value = getValue();

  int getValue();
}

class ConstantInstruction extends Instruction {
  final Reference reference;

  @override
  int getValue() => reference.value;

  ConstantInstruction(super.instructionMap, this.reference);
}

class AndInstruction extends Instruction {
  final Reference wire1;
  final Reference wire2;

  AndInstruction(super.instructionMap, this.wire1, this.wire2);

  @override
  int getValue() => wire1.value & wire2.value;
}

class OrInstruction extends Instruction {
  final Reference wire1;
  final Reference wire2;

  OrInstruction(super.instructionMap, this.wire1, this.wire2);

  @override
  int getValue() => wire1.value | wire2.value;
}

class LShiftInstruction extends Instruction {
  final Reference wire;
  final int amount;

  LShiftInstruction(super.instructionMap, this.wire, this.amount);

  @override
  int getValue() => uint16clamp(wire.value << amount);
}

class RShiftInstruction extends Instruction {
  final Reference wire;
  final int amount;

  RShiftInstruction(super.instructionMap, this.wire, this.amount);

  @override
  int getValue() => uint16clamp(wire.value >>> amount);
}

class NotInstruction extends Instruction {
  final Reference wire;

  NotInstruction(super.instructionMap, this.wire);

  @override
  int getValue() => uint16clamp(~wire.value);
}

final _temp = Uint16List(1);

int uint16clamp(int value) {
  _temp[0] = value;
  return _temp[0];
}
