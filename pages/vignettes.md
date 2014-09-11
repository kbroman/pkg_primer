---
layout: page
title: Writing vignettes
---

It's important to write good and clear [documentation](docs.html), but
users don't often read it; at best they'll look at the examples, so be
sure to include informative examples. In my experience, what users
_really_ want are instructive tutorials demonstrating practical uses
of the software with discussion of the interpretation of the
results. In R packages, such tutorials are called &ldquo;vignettes.&rdquo;

The technical aspect of including a vignette with your R package is
simple. (The only hard part is the actual _writing_.) You can write
your vignette in [LaTeX](http://www.latex-project.org/) (with
[Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) or
[knitr](http://yihui.name/knitr/)), but it's far easier to use
[R Markdown](http://rmarkdown.rstudio.com/) (with
[knitr](http://yihui.name/knitr/)).

[Markdown](http://daringfireball.net/projects/markdown/) is a light
mark-up language that's much like what you'd write in an email, using
`_underscores_` or `**asterisks**` for emphasis and so
forth. [R Markdown](http://rmarkdown.rstudio.com/) is an extension of
Markdown to include chunks of R code. An R Markdown document (with a
`.Rmd` extension) is compiled (with knitr) to a Markdown document
(replacing R code with its results, e.g. graphics), which is then
converted to an HTML document, to be viewed in a web browser. For more
on knitr and Markdown, see my
[knitr in a knutshell tutorial](http://kbroman.org/knitr_knutshell).

To include an R Markdown document as a vignette in your R package, all
you need to do is:

- Create a `vignettes` subdirectory.
- Put your `.Rmd` file in that directory.
- Include code like the following at the top of the `.Rmd` file:

      <!--
      %\VignetteEngine{knitr::knitr}
      %\VignetteIndexEntry{Put the title of your vignette here}
      -->

- Add the following lines to your package's `DESCRIPTION` file:

      Suggests: knitr
      VignetteBuilder: knitr

For examples, look at the source for packages you like, e.g.
[Roxygen2](https://github.com/klutometis/roxygen/tree/master/vignettes),
[dplyr](https://github.com/hadley/dplyr/tree/master/vignettes),
[lubridate](https://github.com/hadley/lubridate/tree/master/vignettes),
and [knitr](https://github.com/yihui/knitr/tree/master/vignettes).

---

Now go to the page about [writing tests](tests.html).
