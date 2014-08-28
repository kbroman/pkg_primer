---
layout: page
title: Getting your R package on CRAN
---

- Also mention [bioconductor](http://bioconductor.org), for
  computational biology or bioinformatics packages
- Use `R CMD check --as-cran` and eliminate _all_ problems.
- Read the CRAN policy carefully.
- How to submit
- Be nice.
- Examples should be quick, as every example in every package on CRAN
  is tested daily on multiple systems. Use `\dontrun{}` and `\dontshow{}` (and
  also `\donttest{}` to make the examples go fast.

---

Now go to the page about [writing vignettes](pages/vignettes.html).
