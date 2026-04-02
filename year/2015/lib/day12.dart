// --- Day 12: JSAbacusFramework.io ---
// https://adventofcode.com/2015/day/12

import 'dart:convert';

int solveA(String input) {
  var result = 0;

  JsonDecoder((key, value) {
    if (value is int) {
      result += value;
    }
    return value;
  }).convert(input);

  return result;
}

final intPattern = RegExp(r'(-?\d+)');

int solveB(String input) {
  var result = 0;

  JsonDecoder((key, value) {
    if (value is int) {
      result += value;
    }

    if (value is Map && value.values.contains('red')) {
      for (final match in intPattern.allMatches(value.toString())) {
        result -= int.parse(match[1]!);
      }
      return null;
    }

    return value;
  }).convert(input);

  return result;
}
