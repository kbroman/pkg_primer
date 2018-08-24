---
layout: page
title: Writing documentation with Roxygen2
description: How to write documentation for an R package
---

To add documentation to an R package, you need to create a
subdirectory &ldquo;`man`&rdquo; containing a set of files, one per
function, in a special R Documentation format (`.Rd`). These will be
the source for the documentation for each function; R processes them
to create plain text, PDF, and HTML versions.

Here is part of [the `.Rd` file for the `plot_crayons` function](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage4/man/plot_crayons.Rd).

    \name{plot_crayons}
    \alias{plot_crayons}
    \title{Illustration of crayon colors}
    \usage{
    plot_crayons(method2order = c("hsv", "cluster"), cex = 0.6,
                 mar = rep(0.1, 4))
    }
    \arguments{
    \item{method2order}{method to order colors (\code{"hsv"} or \code{"cluster"})}

    \item{cex}{character expansion for the text}

    \item{mar}{margin parameters; vector of length 4 (see \code{\link[graphics]{par}})}
    }
    \value{
    None
    }
    \description{
    Creates a plot of the crayon colors in \code{\link{brocolors}}
    }
    \examples{
    plot_crayons()
    }

The format looks a bit like [LaTeX](https://www.latex-project.org/),
with things like `\field{content}`.

There are two big weaknesses to this.

- The format is rather verbose and cumbersome to write (e.g., getting
  all of those curly braces to match up), and it's not particularly
  easy to read.
- It splits the code from the documentation of the code. You generally
  will document your functions with comments, so with these `.Rd`
  files, you have to document your functions in two places and keep
  the two sets of documentation synchronized (and synchronized with
  the actual code).

[Roxygen2](https://github.com/klutometis/roxygen) is the solution to
this. With Roxygen2, you write specially-structured comments preceding
each function definition. These are processed to produce the `.Rd`
files that R wants, and it also creates that painful `NAMESPACE` file
for you.

Here's [an example](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/plot_crayons.R), corresponding to the above.

    #' Illustration of crayon colors
    #'
    #' Creates a plot of the crayon colors in \code{\link{brocolors}}
    #'
    #' @param method2order method to order colors (\code{"hsv"} or \code{"cluster"})
    #' @param cex character expansion for the text
    #' @param mar margin parameters; vector of length 4 (see \code{\link[graphics]{par}})
    #'
    #' @return None
    #'
    #' @examples
    #' plot_crayons()
    #'
    #' @export
    plot_crayons <-
    function(method2order=c("hsv", "cluster"), cex=0.6, mar=rep(0.1, 4))
    { ... }

The Roxygen2 comments are just R comments (preceded by `#`), but you
need to use `#'` to distinguish the Roxygen2 comments from any normal
R comments. And it has things like `@param` rather than `\item{}`.

There are still a few of `.Rd`-like things here (`\code{}` and
`\code{\link{}}`) &ndash; a few `.Rd` frills that you can use, but
they're not strictly necessary. (_Ultimately_, you'll want to read
that comprehensive
[Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)
manual, including the specification of the `.Rd` format and
`NAMESPACE` files, but you can probably put that off for a while.)

### The Roxygen2 format

You want to precede each function that is to be documented with
comments like the above.

The first line will be the title for the function (here
&ldquo;Illustration of crayon colors&rdquo;).

Include a blank `#'` line and then write a longer description.
(&ldquo;Creates a plot of the crayon colors in ...&rdquo;).

For each of the function arguments, you want a line like

    #' @param argument_name description of the argument

The line with `@return` contains a description of what the function
returns. Here I just say &ldquo;`None`,&rdquo; but this could have a longer
description, as in
[the Roxygen comments for the brocolors function](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/brocolors.R).

    #' @return Vector of character strings representing the chosen set of colors, in RGB.

This can be split across multiple lines, and you can add
extra whitespace (which will be copied over to the `.Rd` file but
ultimately ignored).

    #' @return Vector of character strings representing the chosen
    #'     set of colors, in RGB.

The `#' @examples` line is followed by a set of example R code on how
to use the function. This is possibly the most useful part of the
documentation, so don't skip this. The `plot_crayons()` example above
has just a one-line example. Also look at
[the Roxygen comments for the `brocolors` function](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/brocolors.R),
which has a more extensive set of examples.

The `@export` line is critical.

    #' @export

This tells Roxygen2 to add this function to the `NAMESPACE` file, so
that it will be accessible to users. For your first R package, you'll
probably want to include `@export` for each of your functions.

### The example

To convert our package to use Roxygen2, we'll want to first remove
[that minimal `NAMESPACE` file](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage2/NAMESPACE)
we'd created. We won't need that anymore, as Roxygen2 will create it
for us.

We then add a batch of `#'` comments to each of our functions, so the
package now looks
[like this](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3).

It's still not a proper package, because it still doesn't contain any
documentation, and now it doesn't even have a `NAMESPACE` file. R
itself doesn't care about those Roxygen2 comments. We now need to use
Roxygen2 (or really the `document` function in the
[devtools](https://github.com/hadley/devtools) package) to process
those comments and create the `NAMESPACE` and `.Rd` files.


### Processing the Roxygen2 comments

The simplest way to process the Roxygen2 comments to create the
`NAMESPACE` and `.Rd` files is to use devtool's `document()` function,
within R. Start R with your package directory as the working directory
(or change to that directory with `setwd()`). Then load the devtools
package with `library(devtools)` and type

    document()

You'll see something like this:

    Updating brocolors documentation
    Loading brocolors
    First time using roxygen2 4.0. Upgrading automatically...
    Writing NAMESPACE
    Writing brocolors.Rd
    Writing plot_crayons.Rd

You'll then see that your package directory contains a `NAMESPACE`
file and a `man/` subdirectory with an `.Rd` file for each of the
documented functions.

_That's it!_ Your package is now documented. It will look
[like this](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage4).

I strongly suggest that you fully adopt the devtools workflow for the
development of your package, using `build()`, `install()`,
`document()`, and (as [we'll soon see](check.html)) `check()`.


### Processing the Roxygen2 comments at the command line

Actually, I still do some of this at the command-line. If I change
to my package directory, I could perform the above by typing the
following at the command line:

    R -e 'library(devtools);document()'

This invokes R and runs those two commands, just as we would have done
within R.

And actually, I'll put that line within a `Makefile` within my package.
(See
[the `Makefile` for my R/broman package](https://github.com/kbroman/broman/blob/master/Makefile).
Also take a look at my [minimal make tutorial](https://kbroman.org/minimal_make).)
I can then type `make` at the command line (within my
package directory) to build the
documentation. I do this because some of my packages have a more
complicated build process
(e.g. [R/qtlcharts](https://github.com/kbroman/qtlcharts)), and because
I love [GNU make](https://www.gnu.org/software/make/).

If you go the `Makefile` route, you'll want to also include a
`.Rbuildignore` file in your package directory, sort of like
[this one](https://github.com/kbroman/broman/blob/master/.Rbuildignore),
but with a single line

    Makefile

This tells `R CMD build` to ignore the `Makefile` and not include it
within the package `.tar.gz` file.

But for now, I'd recommend skipping the whole &ldquo;`R -e`&rdquo; and &ldquo;`make`&rdquo;
business. Stick to using the devtools function `document()`, within
R, to process the Roxygen2 comments.

### Extra stuff about Roxygen2 and the `.Rd` format

If you look at the Roxygen2 comments for
[`plot_crayons`](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/plot_crayons.R)
and [`brocolors`](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/brocolors.R),
you'll find that there are a bunch of extra fields that I've not
mentioned.

For example, in the
[`plot_crayons.R`](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage3/R/plot_crayons.R)
file, you'll see

    #' @author Karl W Broman, \email{broman@@wisc.edu}
    #' @references \url{https://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors}
    #' @seealso \code{\link{brocolors}}
    #' @keywords hplot
    #' ...
    #' @importFrom grDevices rgb2hsv
    #' @importFrom graphics par plot rect text

There's a lot more to `.Rd` files (and to Roxygen2) that I've left
unmentioned but that you'll ultimately want to adopt in order to make
comprehensive documentation.  The `@author`, `@references`,
`@seealso`, and `@keywords` bits are useful but not necessary, and
this should be straightforward, except perhaps for the `\email{}`,
`\url{}`, and `\code{\link{ }}`; those bits are from the `.Rd` format.

(Note that in my email address here, I've doubled the `@`, so it's
`broman@@wisc.edu`. Roxygen2 is looking for those `@`'s for
its field names; if you want an actual `@`, you need to double it like
this.)

The `@importFrom` bits tell Roxygen2 to add certain extra things to
the `NAMESPACE` file. I'd recommend also ignoring these for now.
Later, read the
[Roxygen2 vignettes](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html)
(and ultimately the
[Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)
manual)
to learn more about these things.

Also note: if you've already written a bunch of `.Rd` files for a package
and you want to convert to the Roxygen2 system, consider the
[Rd2roxygen](https://github.com/yihui/Rd2roxygen) package (and look at
its [vignette](https://yihui.name/Rd2roxygen/)).

---

### Homework

Remove that minimal `NAMESPACE` file from your R package and
add Roxygen2 comments to your R code.

Use the `document()` function in
[devtools](https://github.com/hadley/devtools) to process the Roxygen2
comments and so create the `NAMESPACE` file and the `.Rd` files.

Then go to the page about [software licenses](licenses.html).
