import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

extension StringAsLinesExtension on String {
  Iterable<String> get asLines => LineSplitter.split(this);

  List<String> toLinesList() => asLines.toList(growable: false);
}

Uri _baseDirectory = Directory.fromUri(
  Isolate.resolvePackageUriSync(Uri.parse('package:advent_of_code/'))!,
).parent.uri;

File getInput(int year, int day) => File.fromUri(
  _baseDirectory.resolve('data/$year/day${day.toString().padLeft(2, '0')}.txt'),
);
