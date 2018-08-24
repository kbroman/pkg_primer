---
layout: page
title: Connecting to other packages
description: How to use (and document usage of) functions from other R
             packages within your R package
---

Generally, your R package will make use of functions in other R
packages. You need to tell R about that, to ensure that those packages
are installed when your package is installed, and that they're made
available when your package is loaded.

This gets a little complicated (and _boring_!), and the procedures
have changed over time, and my understanding of R
[is not always up-to-date](https://kbroman.org/hipsteR). So some of
this may not be quite right. (If you find a mistake or want to suggest
improvements, please tell me, by submitting an
[Issue](https://github.com/kbroman/pkg_primer/issues) or
[Pull Request](https://github.com/kbroman/pkg_primer/pulls), or via
[Twitter](https://twitter.com/kwbroman).)

### Using functions in other packages

There are several different ways to make use of functions in other
packages. You can load the package with `library()` and then just use
the functions. Or you can use the `::` operator, for example writing
`broman::runningmean( )` rather than `library(broman)` and then
`runningmean()`.

The move is towards the latter, where only the necessary functions
will be loaded, rather than attaching the whole package.

The `::` operator only works for functions that are in the namespace
of that other package. Other functions, that weren't exported, can be used
with the `:::` operator. But [CRAN](https://cran.r-project.org) doesn't
allow the `:::` operator. If you want to use functions that aren't in
that other package's namespace, you need to either get the author to
add it, or (if allowable by the package's [license](licenses.html))
just incorporate the code directly into your own package.

### `NAMESPACE` file

You don't _really_ need to use the `::` operator, as you can _import_
the namespace of that other package into your own. With
[Roxygen2](https://github.com/klutometis/roxygen), you do this with
`@import` or `@importFrom`.

A line like

    #' @import jsonlite

will add a line to your package's `NAMESPACE` file that imports the
_entire_ namespace of that other package into your own, so you can
use any of its functions without the `::` operator.

A line like

    #' @importFrom jsonlite toJSON unbox

will add lines to your package's `NAMESPACE` file to import just the
named functions.

If your package is thoroughly dependent on another package, so that
you're using all sorts of functions from that other package, I'd go
ahead and use `@import` and import the entire namespace of the other
package.

If, on the other hand, you're just using one or two functions, I'd use
`@importFrom` to import just the particular functions.

And probably it's best to skip the whole `@import` and `@importFrom`
technique and just use the `::` operator, particularly for clarity:
`jsonlite::unbox( )` makes it clear that `unbox` is not part of the
present package but is part of
[jsonlite](https://github.com/jeroenooms/jsonlite).

### Depends, Imports, Suggests, and Enhances

If your package is using functions in other packages, you also need to
add some lines to your `DESCRIPTION` file.

Here's the
[`DESCRIPTION` file](https://github.com/kbroman/qtlcharts/blob/master/DESCRIPTION)
for my [R/qtlcharts package](https://github.com/kbroman/qtlcharts).

    Package: qtlcharts
    Version: 0.2-44
    Date: 2014-09-08
    Title: Interactive graphics for QTL experiments
    Author: Karl W Broman <broman@wisc.edu>
    Maintainer: Karl W Broman <broman@wisc.edu>
    Description: Web-based interactive charts (using D3.js) for the analysis of
        experimental crosses to identify genetic loci (quantitative trait
        loci, QTL) contributing to variation in quantitative traits.
    Depends:
        R (>= 2.15),
        qtl (>= 1.30-4)
    Imports:
        jsonlite,
        graphics,
        stats,
        utils
    Suggests:
        knitr,
        devtools,
        roxygen2,
        testthat
    License: MIT + file LICENSE
    URL: https://kbroman.org/qtlcharts
    VignetteBuilder: knitr

Note the `Depends`, `Imports`, and `Suggests` lines.

- `Depends` is used to indicate dependency on a particular version of
  R, and on packages that are to be loaded (with `library()`) whenever
  your package is loaded. If you expect that users would want to load
  that other package whenever they loaded yours, then you should
  include the package name here. But this is now relatively rare. (I
  think the namespaces for these packages should _also_ be imported,
  with `@import`.)

- `Imports` is used for packages that are needed by your package but
  that don't need to be loaded with `library()`. Packages referred to
  in `@import` or `@importFrom` statements in your Roxygen2 comments,
  or whose functions are accessed via the `::` operator, should be
  here.

- `Suggests` is for packages that aren't really necessary, but that
  you're using in your examples, vignettes, or tests. Any
  package listed in `Imports` will _need_ to be installed with your
  package, while packages listed in `Suggests` _do not_ need to be
  installed with your package.

There's one more: `Enhances`. But it's not so common, and I don't
quite understand the point, and so I'll just
say: go read the
[Package Dependencies](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Package-Dependencies)
section in the
[Writing R Extensions manual](https://cran.r-project.org/doc/manuals/r-release/R-exts.html).
Or put that off until you think you need to.

A package should appear in just _one_ of these four sections
(`Depends`, `Imports`, `Suggests`, and `Enhances`).

- If you need to attach the package with `library()`: **`Depends`**
- If you use functions from the package (`::`, `@import`, or
  `@importFrom`) but don't need to use `library()`: **`Imports`**
- If it's not used in the code but is used in examples, vignettes, or tests:
  **`Suggests`**
- Otherwise maybe `Enhances`

You shouldn't use `Depends` or `Imports` if it's not _necessary_, as
then your package can't be installed if one of those is not
installable. Packages in `Suggests` don't _need_ to be available.

---

Finally, go to the [resources page](resources.html).
