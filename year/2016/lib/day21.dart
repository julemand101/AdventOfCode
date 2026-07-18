// --- Day 21: Scrambled Letters and Hash ---
// https://adventofcode.com/2016/day/21

import 'package:collection/collection.dart';

final swapPositionRegExp = RegExp(r'^swap position (\d+) with position (\d+)$');
final swapLetterRegExp = RegExp(r'^swap letter ([a-z]) with letter ([a-z])$');
final rotLeftRightRegExp = RegExp(r'^rotate (left|right) (\d+) step|steps$');
final rotBasedRegExp = RegExp(r'^rotate based on position of letter ([a-z])$');
final revPositionsRegExp = RegExp(r'^reverse positions (\d+) through (\d+)$');
final movePositionRegExp = RegExp(r'^move position (\d+) to position (\d+)$');

String solveA(Iterable<String> input, {required String scrambleInput}) {
  final letters = scrambleInput.split('');

  for (final line in input) {
    if (swapPositionRegExp.firstMatch(line) case final match?) {
      final pos1 = int.parse(match[1]!);
      final pos2 = int.parse(match[2]!);

      letters.swap(pos1, pos2);
    } else if (swapLetterRegExp.firstMatch(line) case final match?) {
      final letter1 = match[1]!;
      final letter2 = match[2]!;

      letters.swap(letters.indexOf(letter1), letters.indexOf(letter2));
    } else if (rotLeftRightRegExp.firstMatch(line) case final match?) {
      final direction = match[1]!; // left or right
      final steps = int.parse(match[2]!);

      if (direction == 'left') {
        for (var i = 0; i < steps; i++) {
          final firstLetter = letters.removeAt(0);
          letters.add(firstLetter);
        }
      } else if (direction == 'right') {
        for (var i = 0; i < steps; i++) {
          final lastLetter = letters.removeLast();
          letters.insert(0, lastLetter);
        }
      } else {
        throw 'Could not parse direction: $direction';
      }
    } else if (rotBasedRegExp.firstMatch(line) case final match?) {
      final letter = match[1]!;
      var indexOfLetter = letters.indexOf(letter);

      if (indexOfLetter >= 4) {
        indexOfLetter++;
      }

      for (var i = 0; i <= indexOfLetter; i++) {
        final lastLetter = letters.removeLast();
        letters.insert(0, lastLetter);
      }
    } else if (revPositionsRegExp.firstMatch(line) case final match?) {
      final pos1 = int.parse(match[1]!);
      final pos2 = int.parse(match[2]!);

      letters.replaceRange(
        pos1,
        pos2 + 1,
        letters.sublist(pos1, pos2 + 1).reversed,
      );
    } else if (movePositionRegExp.firstMatch(line) case final match?) {
      final pos1 = int.parse(match[1]!);
      final pos2 = int.parse(match[2]!);

      letters.insert(pos2, letters.removeAt(pos1));
    } else {
      throw 'Failed parsing: $line';
    }
  }

  return letters.join();
}
