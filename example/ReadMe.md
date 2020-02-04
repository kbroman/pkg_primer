## Example R package

This directory contains a bunch of subdirectories with successively
improved versions of an example R package, `brocolors`.

- [`stage0/`](stage0)
  &ndash; the R code that is to be made into a package
- [`stage1/`](stage1)
  &ndash; the [minimal version](http://kbroman.org/pkg_primer/pages/minimal.html)
  of the package
- [`stage2/`](stage2)
  &ndash; filled out the `DESCRIPTION` file and adds a minimal
  `NAMESPACE` file
- [`stage3/`](stage3)
  &ndash; removed the minimal `NAMESPACE` file and added [Roxygen2](http://kbroman.org/pkg_primer/roxygen.html)
  comments to the functions in the `.R` files.
- [`stage4/`](stage4)
  &ndash; the `stage3` version after processing with the devtools
  function `doc()`
- [`stage5/`](stage5)
  &ndash; the `stage4` version but adding a License field to the
  `DESCRIPTION` file. This is now a proper R package. It passes
  `R CMD check` with no warnings.
