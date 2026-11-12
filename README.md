# Solutions to Advent of Code puzzles

Repository over my solutions for [Advent of Code](https://adventofcode.com/)
puzzles over the years. All solutions are made in the programming
language [Dart](https://dart.dev/).

The solutions are organized in one project with a workspace for each year. Each
workspace contains a series of unit tests which tests the solution against
examples and the solution for the puzzle of the day.

## How to run this project

After checking out the project, run the following in the root of the project to
ensure all dependencies are fetched:

```
dart pub get
```

To run all tests:

```
dart test
```

To run only tests for 2025:

```
dart test year/2025/
```

And for only 1st December 2025:
```
dart test year/2025/test/day01_test.dart
```

> [!NOTE]
> Advent of Code does not want users to share their individual puzzle inputs.
> Those are therefore moved into data/ directory which are handled as a private 
> git submodule. This also means this project can't be optimally used by others
> without recreating the data/ folder, but doing so, would also change the 
> answer to all puzzles, making the unit tests fail.
>
> The project does, however, support only running tests based on the public
> examples from Advent of Code (so no solutions). Use `-x data` to exclude tests
> requiring a populated `test/` directory as seen in the following examples:
> ```
> dart test -x data
> dart test -x data year/2025/
> dart test -x data year/2025/test/day01_test.dart
> ```