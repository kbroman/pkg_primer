---
layout: page
title: Why write an R package?
description: Reasons to write an R package.
---

R packages and the
[Comprehensive R Archive Network (CRAN)](https://cran.r-project.org)
are incredibly important features of R. R packages provide a simple way to
distribute R code and documentation. Packages on CRAN are basically
guaranteed to be installable, as they are regularly built, installed,
and tested on multiple systems.

And R packages _really_ are quite simple to create. It used to be that
the documentation format was a big pain and so a big barrier to
writing a package.  But [Roxygen2](https://github.com/klutometis/roxygen)
has _greatly_ simplified that part, and so it should no longer be a barrier.

Write an R package to keep track of the miscellaneous R functions that
you write and reuse. If they're in a package, it'll be easier to keep
track of them, and so you'll be much more likely to reuse them.

Write an R package to distribute the data and software that accompany
a paper. This really is the easiest way to distribute R code and
associated data.

R packages can be big and important, but that shouldn't scare you
off. I can't emphasize enough: assembling a few R functions within a
package will make it way easier for you to use them regularly. You
don't _need_ to distribute the package to anyone.

---

Now go to the page about [the minimal R package](minimal.html).
