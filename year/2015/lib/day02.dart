// --- Day 2: I Was Told There Would Be No Math ---
// https://adventofcode.com/2015/day/2

import 'dart:math';

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) =>
    input.map((line) => line.split('x')).map<int>((parts) {
      final l = int.parse(parts[0]);
      final w = int.parse(parts[1]);
      final h = int.parse(parts[2]);

      return (2 * l * w) +
          (2 * w * h) +
          (2 * h * l) +
          min(l * w, min(w * h, h * l));
    }).sum;

int solveB(Iterable<String> input) => input
    .map((line) => line.split('x'))
    .map((parts) => parts.map(int.parse).sorted((a, b) => a.compareTo(b)))
    .map<int>(
      (sortedSides) =>
          (sortedSides[0] * 2) +
          (sortedSides[1] * 2) +
          (sortedSides[0] * sortedSides[1] * sortedSides[2]),
    )
    .sum;
