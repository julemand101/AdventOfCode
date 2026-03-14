// --- Day 11: Hex Ed ---
// https://adventofcode.com/2017/day/11

import 'dart:math' as math;

int solveA(String steps) => _solve(steps.split(',')).distanceAway;

int solveB(String steps) => _solve(steps.split(',')).maxDistanceAway;

({int distanceAway, int maxDistanceAway}) _solve(List<String> steps) {
  var x = 0;
  var y = 0;
  var maxDistance = 0;

  for (final step in steps) {
    switch (step) {
      case 'n':
        y++;
      case 'ne':
        x++;
      case 'se':
        x++;
        y--;
      case 's':
        y--;
      case 'sw':
        x--;
      case 'nw':
        x--;
        y++;
      default:
        throw Exception('Unknown step: $step');
    }

    maxDistance = math.max(maxDistance, _calcDistance(x, y));
  }

  return (distanceAway: _calcDistance(x, y), maxDistanceAway: maxDistance);
}

int _calcDistance(int x, int y) =>
    math.max(x.abs(), math.max(y.abs(), (x + y).abs()));
