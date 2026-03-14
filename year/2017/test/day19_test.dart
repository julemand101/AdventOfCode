// --- Day 19: A Series of Tubes ---
// https://adventofcode.com/2017/day/19

import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';
import 'package:advent_of_code_2017/day19.dart';

final input = getInput(2017, 19).readAsLinesSync();

final List<String> example =
    '''
     |          
     |  +--+    
     A  |  C    
 F---|----E|--+ 
     |  |  |  D 
     +B-+  +--+ 
'''
        .asLinesList;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(r'ABCDEF'));
    });
    test('Solution', () {
      expect(solveA(input), equals(r'ITSZCJNMUO'));
    });
  });

  group('Part One', () {
    test('Example 1', () {
      expect(solveB(example), equals(38));
    });
    test('Solution', () {
      expect(solveB(input), equals(17420));
    });
  });
}
