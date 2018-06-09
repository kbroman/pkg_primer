---
layout: page
title: The minimal R package
description: "First page on how to write an R package: constructing the simplest possible R package."
---

Let's start with a simple example:
[a directory with 2 R files](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage0).

- [`brocolors.R`](https://github.com/kbroman/pkg_primer/blob/gh-pages/example/stage0/brocolors.R)
  defines a function `brocolors()` that gives vectors of colors that I
  like to use in figures, including a vector of crayon colors.
- [`plot_crayons.R`](https://github.com/kbroman/pkg_primer/blob/gh-pages/example/stage0/plot_crayons.R)
  defines a function `plot_crayons()` for making a plot illustrating
  the crayon colors.

To make this code into an R package, we just need to do two things:

1. Create an `R` subdirectory and move the code into that
   subdirectory.
2. Create a text file called `DESCRIPTION` containing the following:

       Package: brocolors
       Version: 0.1

That is, you just need to give the package a name, like `brocolors`, and a
version number, like `0.1`, and then put those pieces in a
file called `DESCRIPTION` in this specific way.

[Here's the code rearranged in that way](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage1).

Believe it or not, _that's all you need to have a working R package!_

Note that the R code can be all in one file or split across many files
(e.g., you could have one function in each file, as here). I'd
suggest leaning towards many small files. A
[4000+ line `util.R` file is unwieldy](https://github.com/kbroman/qtl/blob/master/R/util.R).

It's not a [_proper_](proper.html) R package. You need to fill out the `DESCRIPTION`
file a bit and add some documentation. (Also, you need a `NAMESPACE`
file; more on that soon.) But those two steps alone are
sufficient for you to build and install the package &ndash; for your
own use, or to be shared with a friend.

**Note**: usually the directory containing this stuff would be named
with the package name (`brocolors` in this case). This isn't strictly
necessary, but it's confusing otherwise.

In [_my example_](https://github.com/kbroman/pkg_primer/tree/gh-pages/example),
I'm making several different versions of the package
directory, to illustrate the process of going from a minimal package
to a proper package to a fully filled-out package. And so I'm calling
the directory
[`stage0`](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage0),
[`stage1`](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage1),
etc., even though this would really just be a single directory,
`brocolors`, being modified over time.


---

### A few asides

The functions above are taken from my [R/broman](https://github.com/kbroman/broman) package, which
contains miscellaneous R functions that are useful to me.

[Alyssa Frazee](http://alyssafrazee.com/)'s
[RSkittleBrewer](https://github.com/alyssafrazee/RSkittleBrewer)
package inspired me to write these functions. It's made it a lot
easier for me to define colors for graphs I make for lectures and papers.
(For a really useful R color package see,
[Karthik Ram](http://inundata.org/)'s
[wesanderson](https://github.com/karthik/wesanderson) package.)

Regarding version numbers: I number things like
`major.minor-revision` as I learned from [Venables and Ripley](https://www.amazon.com/gp/product/1441930086?ie=UTF8&tag=7210-20)'s
[MASS package](https://cran.r-project.org/web/packages/MASS/index.html).
[Yihui Xie](https://yihui.name/) recommends `major.minor.patch`, but having releases be
just `major.minor`. You should probably follow
[Yihui's recommendation](https://yihui.name/en/2013/06/r-package-versioning/).)

---

### Homework

Now, take a couple of your own R functions

- make a directory for them
- create an `R` subdirectory
- put your R functions into one or more `.R` files within the `R` subdirectory
- write a minimal `DESCRIPTION` file

Then go to the page about [building and installing an R package](build.html).
