// --- Day 5: How About a Nice Game of Chess? ---
// https://adventofcode.com/2016/day/5

import 'dart:convert';

import 'package:crypto/crypto.dart';

String solveA(String input) {
  StringBuffer sb = StringBuffer();

  for (int count = 0; sb.length < 8; count++) {
    final encodedString = ascii.encode('$input$count');
    final bytes = md5.convert(encodedString).bytes;

    // .startsWith("00000")
    if (bytes[0] == 0 && bytes[1] == 0 && bytes[2] >> 4 == 0) {
      final hexString = bytes[2].toRadixString(16);
      sb.write(hexString.length == 1 ? hexString : hexString[1]);
    }
  }

  return sb.toString();
}

String solveB(String input) {
  final result = List.filled(8, '_');
  var missingDigits = result.length;

  for (int count = 0; missingDigits > 0; count++) {
    final encodedString = ascii.encode("$input$count");
    final digest = md5.convert(encodedString);
    final bytes = digest.bytes;

    if (bytes[0] == 0 && bytes[1] == 0 && bytes[2] >> 4 == 0 && bytes[2] < 10) {
      final pos = bytes[2];

      if (pos < result.length && result[pos] == '_') {
        result[pos] = (bytes[3] >> 4).toRadixString(16);
        missingDigits--;
      }
    }
  }

  return result.join();
}
