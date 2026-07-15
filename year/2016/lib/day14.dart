// --- Day 14: One-Time Pad ---
// https://adventofcode.com/2016/day/14

import 'dart:convert';

import 'package:crypto/crypto.dart';

int solveA(String input) {
  var hashCache = <String, String>{};

  String getHash(String input) => hashCache.putIfAbsent(
    input,
    () => md5.convert(ascii.encode(input)).toString(),
  );

  var key = 0;

  loop:
  for (var i = 0; true; i++) {
    if (check1(getHash('$input$i')) case final charCode?) {
      for (var k = 1; k <= 1000; k++) {
        if (check2(getHash('$input${i + k}'), charCode)) {
          if (++key == 64) {
            return i;
          } else {
            continue loop;
          }
        }
      }
    }
  }
}

int solveB(String input) {
  var hashCache = <String, String>{};

  String getHash(String input) => hashCache.putIfAbsent(input, () {
    var hash = md5.convert(ascii.encode(input)).toString();

    for (var i = 0; i < 2016; i++) {
      hash = md5.convert(ascii.encode(hash)).toString();
    }

    return hash;
  });

  var key = 0;

  loop:
  for (var i = 0; true; i++) {
    if (check1(getHash('$input$i')) case final charCode?) {
      for (var k = 1; k <= 1000; k++) {
        if (check2(getHash('$input${i + k}'), charCode)) {
          if (++key == 64) {
            return i;
          } else {
            continue loop;
          }
        }
      }
    }
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
