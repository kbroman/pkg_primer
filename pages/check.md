---
layout: page
title: Checking an R package
description: How to run checks on an R package
---

If you'd never previously written an R package, then you've probably never used
`R CMD check`. But this is an essential tool for R package developers,
and _you_ are now an _R package developer_. (That is, if you've been
doing your homework.)

`R CMD check` runs all sorts of checks on the contents of an R
package, and gives warnings and error messages when it finds things
that aren't right. It also will run the examples in the `.Rd` files
for each of your functions, as well as other
[automated tests](tests.html) that you've included. If a function uses
a variable that doesn't exist (due to a typo or a copy-paste error),
`R CMD check` will often find it.

Before you
[submit a package to the Comprehensive R Archive Network (CRAN)](cran.html),
you should first run `R CMD check` (including with the option
`--as-cran`) and revise your package so that there are no warnings or errors.

### From the command line

To run `R CMD check` from the command line, I will typically first
build the package file (say `brocolors_0.1.tar.gz`) with `R CMD build`,
and then I'll type:

    R CMD check brocolors_0.1.tar.gz

The output is quite verbose, but any warnings or errors will be quite
prominent. Look through each of them carefully, and modify your
package to resolve the problems.

For reasons that I don't entirely understand, there's a `--as-cran`
flag that will do a few additional checks. If you're considering
submitting your package to CRAN, you should try it that way, too.

    R CMD check --as-cran brocolors_0.1.tar.gz


### With devtools

You can also run these checks from within R, using the
[devtools](https://github.com/hadley/devtools) package.

Start R within your package directory, load the devtools library with
`library(devtools)` and then type `check()`, just as you had used
`build()` and `install()` to build and install the package.

---

### Homework

Use `R CMD check` and `R CMD check --as-cran` or, with devtools,
`check()`.

Modify your package so that there are no errors or warnings.

You are now done with the essentials and have a proper R package!

Go back to the [main page](https://kbroman.org/pkg_primer), or go to the page about [putting your R package on GitHub](github.html).
