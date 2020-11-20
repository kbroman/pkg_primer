---
layout: page
title: Writing tests
description: How to write tests for the code in an R package.
---

Hadley Wickham said it best, in
[his 2011 paper](https://rjournal.github.io/archive/2011-1/RJournal_2011-1.pdf#page=5)
on his [testthat](https://github.com/hadley/testthat) package:

> It's not that we don't test our code, it's that we don't
> store our tests so they can be re-run automatically.

_How do you know that your code works?_ You try it out.

_How do you know that your code still works a year later?_ Well, ideally
you saved those initial tests. Even better, you didn't just save them,
but you structured them in a way that you could run them
regularly. This gives you confidence that later changes haven't broken
things that worked.

### `R CMD check`

The simplest (but most crude) tests are the examples in your
[documentation](docs.html). These are run each time you use
`R CMD check`. But that doesn't check to see if your code is actually
giving the right answers. You're just notified if the code produces
errors.

As mentioned in the page on [getting your package on CRAN](cran.html),
your examples should be quick to run. On
[CRAN](https://cran.r-project.org), every package is tested daily on
multiple systems.

You might subset a dataset so that the subsequent
code is much faster; you could put such code with `\dontshow{ }`, so
that it will be run when the examples are run but won't be shown to
the user. Computationally intensive code could also be placed in
`\dontrun{ }` or `\donttest{ }`. Code in `\dontrun{ }` will never be
run automatically; code in `\donttest{ }` will be run when a user
calls `example( )` but won't be run with `R CMD check`. Of course, a
disadvantage of `\dontrun{ }` and `\donttest{ }` is that then the code
_won't_ be tested automatically.

### [testthat](https://github.com/hadley/testthat) package

For proper tests, in which you actually assess whether your code is
giving the correct answers, use the
[testthat](https://github.com/hadley/testthat) package. You'd be best
off reading [the testing section](http://r-pkgs.had.co.nz/tests.html)
in Hadley's [book on R packages](http://r-pkgs.had.co.nz/), but let me
give a brief synopsis with a few examples.

Create a subdirectory `tests` and within that create another
subdirectory `testthat` plus a file `testthat.R` containing the
following code:

    library(testthat)
    test_check("put_your_package_name_here")

Then, within the `tests/testthat/` directory, put a bunch of files
like `test-something.R` containing code to be run by the testthat
package. This code will be run with `R CMD check`, or also with
`devtools::test()`. (Generally, you'd load devtools with
`library(devtools)` and type `test()`.)

Here's a portion of the
[`test-runningmean.R`](https://github.com/kbroman/broman/blob/master/tests/testthat/test-runningmean.R)
file from my [R/broman](https://github.com/kbroman/broman) package.

    context("running mean")

    test_that("running mean stops when it should", {

      expect_error( runningmean(0, c(0,0)) )

    })

    test_that("running mean with constant x or position", {

      n <- 100
      x <- rnorm(n)
      pos <- rep(0, n)
      expect_equal( runningmean(pos, x, window=1), rep(mean(x), n) )

      mu <- mean(x)
      x <- rep(mu, n)
      pos <- runif(n, 0, 5)
      expect_equal( runningmean(pos, x, window=1), x)

    })

Begin each `test-blah.R` file a with call to context; the string here
will be printed in the output of `test()`. Follow this with a series
of calls to `test_that()`, each containing a group of related
tests. Each of these calls has a character string and then a bunch of
code within `{ }`. That code will be much like what one always writes
in typical informal tests: run a bit of code with known result, and
then check if the result actually matches that expected.

The testthat package includes a number of helper functions for
checking whether results match expectation.

- `expect_error()` if the code should throw an error
- `expect_warning()` if the code should throw a warning
- `expect_equal(a, b)` if `a` and `b` should be the same (up to
  numeric tolerance)
- `expect_equivalent(a, b)` if `a` and `b` should contain the same
  values but may have different attributes (e.g., `names` and `dimnames`)

There are a number of others.

When you run `devtools::test()`, you'll get output like this:

    Testing broman
    Loading broman
    running mean : ........
    winsorize : ......

Each dot indicates a test that passed. If there are failures, there'll
be a bunch of output indicating what failed and how.

When you write a new function for your package, write some tests, and
then put them within a call to `testthat()` within a file in
`tests/testthat/`.

### When you find a bug, write a test

If you find a bug in your package, the first thing you should do is
write a test for it: write some code that reproduces the problem,
either by throwing an error or by giving results that you know are
incorrect. Don't start working to fix the bug until _after_ you've
written the test!

If you don't have test code that demonstrates the bug, how will you
know that you've really fixed it? And if you take the time to write
test code for the bug, you should add that to your battery of tests.

Find a bug, write a test, and _then_ fix the bug.

### Automated testing with [Travis CI](https://travis-ci.org)

If you poke around [GitHub](https://github.com), you'll often see R
packages whose ReadMe files contain badges like this:

![Build Status](https://api.travis-ci.org/travis-ci/travis-web.svg?branch=master)

The package author is using the [Travis CI](https://travis-ci.org) site
to test their package whenever they push changes to
[GitHub](https://github.com). This is an example of what's called
[Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration)
(that's the &ldquo;CI&rdquo; in &ldquo;Travis CI&rdquo;):
after every change, the package is automatically built and tested.

This is another great reason to place your package on GitHub. And use
of [Travis CI](https://travis-ci.com) is remarkably easy to set up,
particularly with the [devtools](https://github.com/hadley/devtools)
function `use_travis()`.

If you invoke R within your package directory, `use_travis()` will add
a file `.travis.yml` with the relevant information for Travis CI, and
then will add that file name to the `.Rbuildignore` file, so that `R
CMD build` will ignore it.

You then need to sign in to [Travis CI](https://travis-ci.com) with
your GitHub account, giving it limited access to your GitHub
repositories. Then select which of your repositories you want Travis
CI to monitor and test. That's it. Whenever you push to GitHub, Travis
CI will grab the package, build it, run `R CMD check`, and send you an
email with a message about whether it worked or not.

The final step: add a bit of code like the following to the ReadMe
file for your package:

    [![Build Status](https://travis-ci.org/user/pkg.svg?branch=master)](https://travis-ci.org/user/pkg)

Replace `user` with your GitHub user name and `pkg` with the name of
your package repository.

That will give you the little badge shown above (showing either
&ldquo;passing&rdquo; or &ldquo;failing&rdquo;).

You'll want to be careful to not push to GitHub too often, as _every_
push will cause Travis to build and check your package.

If you _know_ that you want Travis CI to
[skip a build](https://docs.travis-ci.com/user/how-to-skip-a-build/)
(e.g., you've just edited the ReadMe file), include `[ci skip]` or
`[skip ci]` anywhere in the commit message.

**Note**: Also see [Julia Silge](https://juliasilge.com/)'s
[Beginner's guide to Travis for R](https://juliasilge.com/blog/Beginners-Guide-to-Travis/)
and [L. Collado Torres](http://lcolladotor.github.io/#about)'s
slightly out of date but still useful
[Protocol on Travis for R packages](http://jtleek.com/protocols/travis_bioc_devel).

### Automated testing with [Github Actions](https://github.com/features/actions)

There's been a big change to Travis: `travis-ci.org` is shutting down
and `travis-ci.com` is focusing on commercial efforts. It seems
generally recommended to move to using [Github Actions](https://github.com/features/actions) for automated
package testing. See [this blog
post](https://ropensci.org/technotes/2020/11/19/moving-away-travis/)
at [ROpenSci](https://https://ropensci.org).

The basic suggestion is to use one of the following commands from the
[usethis](https://usethis.r-lib.org/) package. The following sets
things up to run `R CMD check` on the three major operating systems (mac, windows, linux)
on the release and devel versions of R:

```r
usethis::use_github_action_check_standard()
```

The following sets it up for testing with just the release version of
R and just on mac:

```r
usethis::use_github_action_check_release()
```

---

Now go to the page about [including datasets](data.html).
