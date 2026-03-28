// --- Day 4: The Ideal Stocking Stuffer ---
// https://adventofcode.com/2015/day/4

import 'dart:convert';

import 'package:crypto/crypto.dart';

int solveA(String input) {
  for (var count = 0; true; count++) {
    final encodedString = ascii.encode('$input$count');
    final bytes = md5.convert(encodedString).bytes;

    // .startsWith("00000")
    if (bytes[0] == 0 && bytes[1] == 0 && bytes[2] >> 4 == 0) {
      return count;
    }
  }
}

int solveB(String input) {
  for (var count = 0; true; count++) {
    final encodedString = ascii.encode('$input$count');
    final bytes = md5.convert(encodedString).bytes;

    // .startsWith("000000")
    if (bytes[0] == 0 && bytes[1] == 0 && bytes[2] == 0) {
      return count;
    }
  }
}
