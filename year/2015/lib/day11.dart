// --- Day 11: Corporate Policy ---
// https://adventofcode.com/2015/day/11

import 'package:any_base/any_base.dart';

final invalidLettersRegExp = RegExp(r'[iol]');

String solveA(String input) {
  do {
    input = nextPassword(input);

    if (input.indexOf(invalidLettersRegExp) case final index when index != -1) {
      input =
          input.substring(0, index) +
          String.fromCharCode(input.codeUnitAt(index) + 1) +
          'a' * (input.length - index - 1);
    }
  } while (!includeOneIncreasingStraightOfAtLeastThreeLetters(input) ||
      !containsTwoPairs(input));

  return input;
}

const alphabet = r'abcdefghijklmnopqrstuvwxyz';

final alphabetBase = AnyBase(AnyBase.dec, alphabet);

String nextPassword(String input) => alphabetBase
    .convert(((int.parse(alphabetBase.revert(input)) + 1).toString()))
    .padLeft(input.length, 'a');

final threeLetterSubsets = [
  for (var i = 0; i < alphabet.length - 2; i++) alphabet.substring(i, i + 3),
];

bool includeOneIncreasingStraightOfAtLeastThreeLetters(String input) {
  for (final subset in threeLetterSubsets) {
    if (input.contains(subset)) {
      return true;
    }
  }
  return false;
}

final letterPairs = [for (var i = 0; i < alphabet.length; i++) alphabet[i] * 2];

bool containsTwoPairs(String input) {
  var count = 0;

  for (var pair in letterPairs) {
    if (input.contains(pair) && ++count == 2) {
      return true;
    }
  }

  return false;
}
