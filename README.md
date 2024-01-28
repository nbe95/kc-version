# NonSemVer

## The problem

We live in a world which is far from perfect. Everybody should obviously utilize
[Semantic Versioning](http://semver.org/), but every now and then, a client
chooses to not stick with standards and cut its own path.

    XX.YY.ZZzz-NNNN
    |  |  | |  |
    |  |  | |  +---- Bugfix release/internal build number
    |  |  | +------- Minor release
    |  |  +--------- Major release
    |  +------------ Deployment year
    +--------------- Customer ID (00 = not customer dependent)

## The solution

Having to work with a very specific version scheme, this script comes in very
handy. While humans often suffer from the pitfalls of non-standard and
unintuitive conventions, `version.sh` is able to properly show, parse and
even increment any version number if needed!

This makes it the ideal tool for use in CI pipelines etc.
