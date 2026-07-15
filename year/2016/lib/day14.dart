// --- Day 14: One-Time Pad ---
// https://adventofcode.com/2016/day/14

import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';

int solveA(String input) =>
    solve(input, (i) => md5.convert(ascii.encode('$input$i')).toString());

int solveB(String input) => solve(input, (i) {
  var hash = md5.convert(ascii.encode('$input$i')).toString();

  for (var i = 0; i < 2016; i++) {
    hash = md5.convert(ascii.encode(hash)).toString();
  }

  return hash;
});

int solve(String input, String Function(int i) createHash) {
  var hashQueue = ListQueue<String>(1001);

  // Prefill cache
  for (var i = 0; i <= 1000; i++) {
    hashQueue.add(createHash(i));
  }

  String getHash(int index) => hashQueue.elementAt(index);

  var key = 0;

  for (var i = 0; true; i++) {
    if (check1(getHash(0)) case final charCode?) {
      for (var k = 1; k <= 1000; k++) {
        if (check2(getHash(k), charCode)) {
          if (++key == 64) {
            return i;
          } else {
            break;
          }
        }
      }
    }
    hashQueue
      ..removeFirst()
      ..add(createHash(i + 1001));
  }
}

int? check1(String input) {
  var count = 0;
  var check = 0;

  for (final codeUnit in input.codeUnits) {
    if (codeUnit != check) {
      check = codeUnit;
      count = 1;
    } else if (++count == 3) {
      return check;
    }
  }
  return null;
}

bool check2(String input, int check) {
  var count = 0;

  for (final codeUnit in input.codeUnits) {
    if (codeUnit != check) {
      count = 0;
    } else if (++count == 5) {
      return true;
    }
  }
  return false;
}
