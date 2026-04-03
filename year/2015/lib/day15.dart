// --- Day 15: Science for Hungry People ---
// https://adventofcode.com/2015/day/15

import 'dart:math';

import 'package:collection/collection.dart';

final regExp = RegExp(
  r'^(.+): capacity (-?\d+), '
  r'durability (-?\d+), '
  r'flavor (-?\d+), '
  r'texture (-?\d+), '
  r'calories (-?\d+)',
);

int solve(Iterable<String> input, {required bool partB}) {
  final propertiesPerTeaspoon = [
    for (final match in input.map(regExp.firstMatch).nonNulls)
      (
        name: match[1]!,
        capacity: int.parse(match[2]!),
        durability: int.parse(match[3]!),
        flavor: int.parse(match[4]!),
        texture: int.parse(match[5]!),
        calories: int.parse(match[6]!),
      ),
  ];

  var maxCookieScore = 0;

  for (final amounts in combinations(100, propertiesPerTeaspoon.length, [])) {
    var caloriesSum = 0,
        capacitySum = 0,
        durabilitySum = 0,
        flavorSum = 0,
        textureSum = 0;

    for (final (i, ingredient) in propertiesPerTeaspoon.indexed) {
      final ingredientAmount = amounts[i];

      caloriesSum += ingredientAmount * ingredient.calories;
      capacitySum += ingredientAmount * ingredient.capacity;
      durabilitySum += ingredientAmount * ingredient.durability;
      flavorSum += ingredientAmount * ingredient.flavor;
      textureSum += ingredientAmount * ingredient.texture;
    }

    if (partB && caloriesSum != 500) {
      continue;
    }

    capacitySum = max(capacitySum, 0);
    durabilitySum = max(durabilitySum, 0);
    flavorSum = max(flavorSum, 0);
    textureSum = max(textureSum, 0);

    maxCookieScore = max(
      maxCookieScore,
      capacitySum * durabilitySum * flavorSum * textureSum,
    );
  }

  return maxCookieScore;
}

Iterable<List<int>> combinations(
  int targetSum,
  int levels,
  List<int> progress,
) sync* {
  if (progress.length == levels - 1) {
    yield progress..add(targetSum - progress.sum);
    progress.removeLast();
  } else {
    final target = targetSum - progress.sum;

    for (var i = 0; i < target; i++) {
      yield* combinations(targetSum, levels, progress..add(i));
      progress.removeLast();
    }
  }
}
