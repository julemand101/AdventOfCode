// --- Day 16: Dragon Checksum ---
// https://adventofcode.com/2016/day/16

import 'dart:typed_data';

String solveA(String input, {required int diskSize}) {
  Uint8List hash = Uint8List(input.length);

  for (var i = 0; i < input.length; i++) {
    hash[i] = input[i] == '1' ? 1 : 0;
  }

  while (hash.length < diskSize) {
    hash = expand(hash);
  }

  return checksum(Uint8List.sublistView(hash, 0, diskSize)).join();
}

Uint8List expand(Uint8List list) => Uint8List((list.length * 2) + 1)
  ..setRange(0, list.length, list)
  ..setRange(
    list.length + 1,
    (list.length * 2) + 1,
    list.reversed.map((value) => value == 1 ? 0 : 1),
  );

Uint8List checksum(Uint8List list) {
  do {
    Uint8List newList = Uint8List(list.length ~/ 2);

    for (var i = 0; i < list.length; i += 2) {
      newList[i ~/ 2] = list[i] == list[i + 1] ? 1 : 0;
    }

    list = newList;
  } while (list.length.isEven);

  return list;
}
