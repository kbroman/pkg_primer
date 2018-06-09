---
layout: page
title: Including datasets
description: How to include datasets in an R package
---

It can be useful to include example datasets in your R package, to use
in examples or vignettes or to illustrate a data format.

If your example datasets are enormous, you might want to make a
separate package just with the data. Examples of data packages include
[Hadley Wickham](http://had.co.nz/)'s
[babynames](https://github.com/hadley/babynames),
[nycflights13](https://github.com/hadley/nycflights13), and
[usdanutrients](https://github.com/hadley/usdanutrients) packages.

To include datasets with your package, you create a `data` subdirectory
and place your datasets there, in `.RData` format (or use the extension
`.rda`). Use the `save` function to create such files, as follows:

    save(mydata, file="data/mydata.RData")

Next, create a `.R` file with
[Roxygen2](https://github.com/klutometis/roxygen) comments that will
produce the documentation for the dataset, and place the file in the
`R` subdirectory with all of your other `.R` files. Here's an example,
for the dataset `grav` in my
[R/qtlcharts](https://kbroman.org/qtlcharts) package; see
[`grav-data.R`](https://github.com/kbroman/qtlcharts/blob/master/R/grav-data.R).

    #' Arabidopsis QTL data on gravitropism
    #'
    #' Data from a QTL experiment on gravitropism in
    #' Arabidopsis, with data on 162 recombinant inbred lines (Ler x
    #' Cvi). The outcome is the root tip angle (in degrees) at two-minute
    #' increments over eight hours.
    #'
    #' @docType data
    #'
    #' @usage data(grav)
    #'
    #' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
    #'
    #' @keywords datasets
    #'
    #' @references Moore et al. (2013) Genetics 195:1077-1086
    #' (\href{https://www.ncbi.nlm.nih.gov/pubmed/23979570}{PubMed})
    #'
    #' @source \href{https://phenome.jax.org/projects/Moore1b}{QTL Archive}
    #'
    #' @examples
    #' data(grav)
    #' times <- attr(grav, "time")
    #' phe <- grav$pheno
    #' \donttest{iplotCurves(phe, times)}
    "grav"

This is much like documenting a function, but we need to include
`@docType data` and `@usage data(grav)`, and where the function
definition would ordinarily go, we just include a line with the
name of the dataset as a character string.

You'll want to describe the `@format` of the data, and it's good to
include the `@source` (where you got it) and `@references`. And
everyone likes `@examples`.

That's it! Put `.RData` datasets in `data/` and add Roxygen2
documentation in a `.R` file in `R/`.

Well, one more thing: you might also want to include the following
line in the `DESCRIPTION` file for your package:

    LazyData: true

If you do this, the datasets in your package will be immediately
available when the package is loaded; there'll be no need to use
`data()`. The data isn't actually _loaded_ into R until you use it
(that's what &ldquo;lazy load&rdquo; means.

Okay, one _more_ thing: you can also include R code (in a `.R` file)
in the `data` directory, and also tabular data as `.txt` or `.csv`
files. (See
[Data in packages](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Data-in-packages)
in the
[Writing R Extensions manual](https://cran.r-project.org/doc/manuals/r-release/R-exts.html).)
An advantage to this is that the data could be viewed on
[GitHub](https://github.com), if you
[put your package there](github.html). And you might use such `.txt`
or `.csv` files to demonstrate file formats and how to load data into R.

---

Now go to the page about [connecting to other R packages](depends.html).
