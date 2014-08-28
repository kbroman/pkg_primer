---
layout: page
title: Writing documentation with Roxygen2
---

Basics of `.Rd` files for R documentation.

How to use Roxygen2 to create these files (plus the `NAMESPACE` file).

R -e 'library(devtools);document()'

Using a Makefile

---

Remove that minimal `NAMESPACE` file from your R package and
add Roxygen2 comments to your R code.

Use the `document()` function in devtools to process the Roxygen2
comments and so create the `NAMESPACE` file and the `.Rd` files.

Then go to the page about [software licenses](licenses.html).
