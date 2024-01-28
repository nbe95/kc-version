# KC Version

## Introduction

We live in a world which is far from perfect. Everybody should obviously utilize
[Semantic Versioning](http://semver.org/), but every now and then, a client
chooses to not stick with standards and cut its own path.

Having to work with a very specific version scheme, this script comes in very
handy. While humans often suffer from the pitfalls of non-standard and
unintuitive conventions, `kc-version.sh` is able to properly show, parse and
even increment version numbers if needed! This makes it ideal for use in CI
pipelines etc.

## The scheme

```txt
XX.YY.ZZzz-NNNN
|  |  | |  |
|  |  | |  +---- Bugfix release/internal build number
|  |  | +------- Minor release
|  |  +--------- Major release
|  +------------ Deployment year
+--------------- Customer ID (00 = not customer dependent)
```
