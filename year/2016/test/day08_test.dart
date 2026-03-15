// --- Day 8: Two-Factor Authentication ---
// https://adventofcode.com/2016/day/8

import 'package:advent_of_code_2016/day08.dart';
import 'package:advent_of_code/util.dart';
import 'package:test/test.dart';

final input = getInput(2016, 08).readAsLinesSync();

void main() {
  group('Part One', () {
    test('Solution', () {
      expect(solveA(input), equals(121));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(
        solveB(input),
        equals(r'''
###  #  # ###  #  #  ##  ####  ##  ####  ### #    
#  # #  # #  # #  # #  # #    #  # #      #  #    
#  # #  # #  # #  # #    ###  #  # ###    #  #    
###  #  # ###  #  # #    #    #  # #      #  #    
# #  #  # # #  #  # #  # #    #  # #      #  #    
#  #  ##  #  #  ##   ##  ####  ##  ####  ### #### 
'''),
      );
    });
  });
}
