// --- Day 5: Doesn't He Have Intern-Elves For This? ---
// https://adventofcode.com/2015/day/5

const vowels = {'a', 'e', 'i', 'o', 'u'};

int solveA(Iterable<String> input) {
  var niceStringCount = 0;

  for (final line in input) {
    final letters = line.split('');

    // It contains at least three vowels
    if (letters.where(vowels.contains).take(3).length != 3) {
      continue;
    }

    // It contains at least one letter that appears twice in a row
    var foundDoubleLetter = false;
    for (var i = 1; i < letters.length; i++) {
      if (foundDoubleLetter = letters[i - 1] == letters[i]) {
        break;
      }
    }

    if (!foundDoubleLetter) {
      continue;
    }

    // It does not contain the strings ab, cd, pq, or xy
    if (line.contains('ab') ||
        line.contains('cd') ||
        line.contains('pq') ||
        line.contains('xy')) {
      continue;
    }

    niceStringCount++;
  }

  return niceStringCount;
}

int solveB(Iterable<String> input) {
  var niceStringCount = 0;

  for (final line in input) {
    final letters = line.split('');

    // It contains a pair of any two letters that appears at least twice in the
    // string without overlapping
    var foundPair = false;
    for (var i = 0; i < letters.length - 1; i++) {
      final pair = letters[i] + letters[i + 1];
      final rest = line.substring(i + 2);

      if (rest.contains(pair)) {
        foundPair = true;
        break;
      }
    }

    if (!foundPair) {
      continue;
    }

    // It contains at least one letter which repeats with exactly one letter
    // between them
    var foundRepeatedLetter = false;
    for (var i = 0; i < letters.length - 2; i++) {
      if (letters[i] == letters[i + 2]) {
        foundRepeatedLetter = true;
        break;
      }
    }

    if (!foundRepeatedLetter) {
      continue;
    }

    niceStringCount++;
  }

  return niceStringCount;
}
