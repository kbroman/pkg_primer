---
layout: page
title: Making it a proper package
description: How to turn a very basic R package into a proper
             package.
---

We created a usable package by just

- Creating a directory with a subdirectory `R`
- Putting some `.R` files in the `R` subdirectory
- Creating a `DESCRIPTION` file with the package name and a version number.

We can build the `.tar.gz` package file and give it to friends to
install, but it's still not a _proper_ R package. We need to do a few
more things.

- Fill out the `DESCRIPTION` file.
- Create a `NAMESPACE` file.
- Add some documentation.

### Filling out the `DESCRIPTION` file

Our `DESCRIPTION` file had just two lines. We need to add a few more:
a title, a description, an author, and a maintainer (usually one of
the authors). It's also a good idea to include the date. It should
look something like this:

    Package: brocolors
    Version: 0.1
    Date: 2014-08-27
    Title: Karl Broman Colors
    Description: Colors that Karl Broman uses in figures.
    Author: Karl W Broman <broman@wisc.edu>
    Maintainer: Karl W Broman <broman@wisc.edu>

The title should be short. The description should be a sentence or
two; it can span multiple lines. The `Maintainer` field should include
an email address, surrounded by `< >`. The author field doesn't need
email addresses.

A bunch more things can be put in the `DESCRIPTION` file, but this is
sufficient for now.


### Creating a `NAMESPACE` file

Creating a package `NAMESPACE` file has long been one of the more
painful aspects of building an R package.
I dragged my feet on these `NAMESPACE` files for years.
(It's no longer so painful, as [we'll see shortly](roxygen.html).)

With the huge growth in the number of R packages, it became important
to avoid naming conflicts among packages: two packages might have the
same name for totally different functions, particularly with little
helper functions. With a `NAMESPACE` file, you indicate which
functions are to be available to users and which are to be strictly
internal. By hiding the little helper functions, there's less chance
of naming conflicts.

A minimal `NAMESPACE` file is pretty easy, though. You just need one
line.

    # Export all names
    exportPattern(".")

Okay, that's two lines. But the first line is just a comment.

So the simplest step towards making your R package a _proper_ package
is to create a plain text file called `NAMESPACE`
containing these lines and put it in your package directory.

Your package will then look
[like this](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage2).

It's still not a _proper_ package (in that we still need to write some
documentation), but you can now [build and install it with devtools](build.html).

### Documentation

It's not a proper package until you've added documentation. The
documentation will sit in a `man` subdirectory (`man` for
&ldquo;manual&rdquo;), and has to be in a special `.Rd` (`Rd` for
&ldquo;R documentation&rdquo;) format, with `.Rd` file for each
function in the package.  The `.Rd` format is rather
[LaTeX](https://www.latex-project.org/)-like and so ugly to prepare and
maintain.

_But_, you don't _have_ to create those `.Rd` files
yourself. [Roxygen2](https://github.com/klutometis/roxygen) is an R
package that makes it much easier to create R documentation for your
R package. You write comments within your `.R` files, in a specially
structured way, describing the inputs and outputs and so forth for
each function, and then Roxygen2 will create the `.Rd` files for you.
Roxygen2 will also create the `NAMESPACE` file for you.

I'll [explain the use of Roxygen2 next](docs.html).

### Software license

And _actually_, there's one more thing (after the documentation) that
you need to do before your package is _proper_. You need to pick a
license for the software and specify the license in the `DESCRIPTION`
file. This is, perhaps, an even more ugly topic than `NAMESPACE`
files. I'll [explain it a bit later](licenses.html).


---

### Homework

Fill out the `DESCRIPTION` file for your package and add a minimal
`NAMESPACE` file. Try building and installing it with
[devtools](https://github.com/hadley/devtools).

Then go to the page about [writing documentation with Roxygen2](docs.html).
