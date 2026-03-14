import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

extension StringAsLinesExtension on String {
  Iterable<String> get asLines => LineSplitter.split(this);

  List<String> get asLinesList => asLines.toList(growable: false);

  Uint8List get asBytes => utf8.encode(this);
}

Uri _baseDirectory = Directory.fromUri(
  Isolate.resolvePackageUriSync(Uri.parse('package:advent_of_code/'))!,
).parent.uri;

File getInput(int year, int day, {bool example = false}) => File.fromUri(
  _baseDirectory.resolve(
    'data/$year/day${day.toString().padLeft(2, '0')}'
    '${example ? "_example" : ""}.txt',
  ),
);
