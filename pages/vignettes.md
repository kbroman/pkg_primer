---
layout: page
title: Writing vignettes
description: How to write vignettes to document an R package.
---

It's important to write good and clear [documentation](docs.html), but
users don't often read it; at best they'll look at the examples, so be
sure to include informative examples. In my experience, what users
_really_ want are instructive tutorials demonstrating practical uses
of the software with discussion of the interpretation of the
results. In R packages, such tutorials are called &ldquo;vignettes.&rdquo;

The technical aspect of including a vignette with your R package is
simple. (The only hard part is the actual _writing_.) You can write
your vignette in [LaTeX](https://www.latex-project.org/) (with
[Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) or
[knitr](https://yihui.name/knitr/)), but it's far easier to use
[R Markdown](https://rmarkdown.rstudio.com/) (with
[knitr](https://yihui.name/knitr/)).

[Markdown](https://daringfireball.net/projects/markdown/) is a light
mark-up language that's much like what you'd write in an email, using
`_underscores_` or `**asterisks**` for emphasis and so
forth. [R Markdown](https://rmarkdown.rstudio.com/) is an extension of
Markdown to include chunks of R code. An R Markdown document (with a
`.Rmd` extension) is compiled (with knitr) to a Markdown document
(replacing R code with its results, e.g. graphics), which is then
converted to an HTML document, to be viewed in a web browser. For more
on knitr and Markdown, see my
[knitr in a knutshell tutorial](https://kbroman.org/knitr_knutshell).

To include an R Markdown document as a vignette in your R package, all
you need to do is:

- Create a `vignettes` subdirectory.
- Put your `.Rmd` file in that directory.
- Within the YAML header at the top of the `.Rmd` file, include code
  like the following:

      ---
      title: "Put the title of your vignette here"
      output: rmarkdown::html_vignette
      vignette: >
        %\VignetteIndexEntry{Put the title of your vignette here}
        %\VignetteEngine{knitr::rmarkdown}
        \usepackage[utf8]{inputenc}
      ---

- Add the following lines to your package's `DESCRIPTION` file:

      Suggests: knitr, rmarkdown
      VignetteBuilder: knitr

- You can build your vignette with the `devtools::build_vignettes()` function.
  The resulting `.html` vignette will be in the `inst/doc` folder.

  Alternatively, when you run `R CMD build`, the `.html` file for the
  vignette will be built as part of the construction of the `.tar.gz`
  file for the package.

For examples, look at the source for packages you like, for example
[dplyr](https://github.com/hadley/dplyr/tree/master/vignettes).

---

Now go to the page about [writing tests](tests.html).
