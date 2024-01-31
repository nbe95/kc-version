# NonSemVer

## The problem

We live in a world which is far from perfect. Everybody should obviously utilize
[Semantic Versioning](http://semver.org/), but every now and then, a client
chooses to not stick with standards and cut their own path.

    XX.YY.ZZzz-NNNN
    |  |  | |  |
    |  |  | |  +---- Bugfix release/internal build number
    |  |  | +------- Minor release
    |  |  +--------- Major release
    |  +------------ Deployment year
    +--------------- Customer ID (00 = not customer dependent)

## The solution

Having to work with that very specific version scheme, this script comes in very
handy. While humans often suffer from the pitfalls of non-standard and
unintuitive conventions, `version.sh` is able to properly show, parse and
even increment any version number if needed!

This makes it the ideal tool for use in CI pipelines etc.

### Features and examples

- Parse version tags in dot-style or integer notation:

        $ ./version.sh 12.34.5678
        12.34.5678
        $ ./version.sh 12345
        00.01.2345

- Return bare integer version tags with `-i` or `--integer`:

        $ ./version.sh -i 9.8.7
        9080007
        $ ./version.sh -i 00.00.0005
        5

- Print verbose and human-readable information with `-v` or `--verbose`

        $ ./version.sh -i -v 01.42.5069
        1425069

        Customer ID:        1
        Deployment year:    2042
        Major version:      50
        Minor version:      69

- When running in a Git repository, automatically fetch the latest tag as
  version identifier:

        $ git tag
        1.2.30
        $ ./version.sh
        01.02.0030

- Increment version numbers (with respect to the current year, e.g. 2023):

        $ ./version.sh --minor 11.23.0607
        11.23.0700
        $ ./version.sh --major 11.23.0607
        11.23.0608
        $ ./version.sh --minor 11.20.1234
        11.23.0100

Run `./version.sh --help` or take a look at the unit tests to see all available
options.
