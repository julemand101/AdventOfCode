// --- Day 7: No Space Left On Device ---
// https://adventofcode.com/2022/day/7

import 'package:advent_of_code/util.dart';
import 'package:advent_of_code_2022/day07.dart';
import 'package:test/test.dart';

final input = getInput(2022, 07).readAsLinesSync();

final example =
    r'''
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(95437));
    });
    test('Solution', () {
      expect(solveA(input), equals(1444896));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(24933642));
    });
    test('Solution', () {
      expect(solveB(input), equals(404395));
    });
  });
}
