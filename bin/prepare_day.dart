import 'dart:io';

import 'package:collection/collection.dart';

void main(List<String> args) {
  final int year;
  final int day;
  final String dayTitle;

  if (args.length == 1) {
    // Create based on current date
    final today = DateTime.now();
    year = today.year;
    day = today.day;
    dayTitle = args[0];

    if (Directory(
      'year/',
    ).listSync().none((dir) => dir.path.endsWith(today.year.toString()))) {
      print('Project directory for year $year have yet to be created!');
      return;
    }
  } else if (args.length == 3) {
    // Create based on provided parameters
    year = int.parse(args[0]);
    day = int.parse(args[1]);
    dayTitle = args[2];
  } else {
    print('Please call with: <year> <dayNumber> <dayTitle>');
    print('or: <dayTitle>');
    return;
  }

  //final [dayNumber, dayTitle] = args;
  final paddedDayNumber = day.toString().padLeft(2, '0');

  // Create lib file
  final dayFileName = 'day$paddedDayNumber.dart';

  File('year/$year/lib/$dayFileName').writeAsString('''
// --- Day $day: $dayTitle ---
// https://adventofcode.com/$year/day/$day

int solveA(Iterable<String> input) {
  return 0;
}
''');

  // Create empty test data file
  File('data/$year/day$paddedDayNumber.txt').create();

  // Create unit tests
  File('year/$year/test/day${paddedDayNumber}_test.dart').writeAsString('''
// --- Day $day: $dayTitle ---
// https://adventofcode.com/$year/day/$day

import 'package:advent_of_code_$year/$dayFileName';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput($year, $paddedDayNumber).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r\'\'\'
<SomeLines>
\'\'\'
              .asLines,
        ),
        equals(-1),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  });
}
''');
}
