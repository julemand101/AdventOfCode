// --- Day 17: Two Steps Forward ---
// https://adventofcode.com/2016/day/17

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';

String solve(String input, {bool partB = false}) {
  final queue = QueueList<({String path, int x, int y})>()
    ..add((path: input, x: 0, y: 0));

  var longestPath = '';

  while (queue.isNotEmpty) {
    final (:path, :x, :y) = queue.removeFirst();

    if (x == 3 && y == 3) {
      if (partB) {
        longestPath = path;
        continue;
      } else {
        return path.substring(input.length);
      }
    }

    final (:up, :down, :left, :right) = getDirections(path);

    if (up && y > 0) {
      queue.add((path: '${path}U', x: x, y: y - 1));
    }
    if (down && y < 3) {
      queue.add((path: '${path}D', x: x, y: y + 1));
    }
    if (left && x > 0) {
      queue.add((path: '${path}L', x: x - 1, y: y));
    }
    if (right && x < 3) {
      queue.add((path: '${path}R', x: x + 1, y: y));
    }
  }

  return longestPath.substring(input.length);
}

({bool up, bool down, bool left, bool right}) getDirections(String input) {
  final hash = md5.convert(ascii.encode(input)).toString();

  return (
    up: check(hash[0]),
    down: check(hash[1]),
    left: check(hash[2]),
    right: check(hash[3]),
  );
}

bool check(String char) =>
    char == 'b' || char == 'c' || char == 'd' || char == 'e' || char == 'f';
