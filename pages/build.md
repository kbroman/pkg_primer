---
layout: page
title: Building and installing an R package
description: How to build and install an R package
---

You now have the raw materials for a simple R package. Next you need
to _build_ it. This will create a file like `brocolors_0.1.tar.gz`
that you can then _install_ (so that you can load it and use it within
R) or give to a friend to install.

I generally do so from the command line (on my Mac). If you're using
Windows, you'll want to install
[Rtools](https://cran.r-project.org/bin/windows/Rtools/).

### Building an R package

- Open a terminal window
- Go to the directory that _contains_ your package
  directory.
- Type

      R CMD build brocolors

  (Replace `brocolors` with the name of your package directory,
  which hopefully is also the name of your package.)
- You'll see something like this

      $ R CMD build brocolors
      * checking for file 'brocolors/DESCRIPTION' ... OK
      * preparing 'brocolors':
      * checking DESCRIPTION meta-information ... OK
      * checking for LF line-endings in source and make files
      * checking for empty or unneeded directories
      * creating default NAMESPACE file
      * building 'brocolors_0.1.tar.gz'

  And you should then have the `brocolors_0.1.tar.gz` file (or the
  equivalent for _your_ package).

### Installing an R package

To install the package, type (at the command line)

    R CMD INSTALL brocolors_0.1.tar.gz

Then start R and type `library(brocolors)` to see that it was indeed
installed, and then try out one of the functions. For my package, I'd
try

    brocolors()
    plot_crayons()

### Building and installing a package using devtools

Even easier then the above is to use [Hadley Wickham](http://had.co.nz/)'s
[devtools](https://github.com/hadley/devtools) package. You can then
build and install the package from within R.

Start R _within your package directory_ (so that your package
directory is R's _working directory_).

Install [devtools](https://github.com/hadley/devtools) by typing
(within R)

    install.packages(devtools)

Then load the devtools package with

    library(devtools)

Then, to _build_ the package, type

    build()

This will create the `brocolors_0.1.tar.gz` file.

**Note**: If your R working directory is something other than your package directory, you
could specify the location of your package in the call to `build`, like `build("~/Code/brocolors")`.

To _install_ the R package, you'd type

    install()

But if you try this with our minimal package, you'll find that it
_doesn't work_; devtools complains about the lack of a `NAMESPACE`
file. (You _could_ install the package from the command line, with `R
CMD INSTALL brocolors_0.1.tar.gz`, because `R CMD build` created a
minimal `NAMESPACE` file for you.  devtools is a bit more particular
in this case.)

### Installing a package in a personal directory

If you wish to install your package somewhere other than the standard
location (which may be write-protected), you need to do two things.

First, create a file called `~/.Renviron` containing the following
line:

    R_LIBS=/path/to/Rlibs

replacing `/path/to/Rlibs` with the path that you want to use. For
example, I use `/Users/kbroman/Rlibs`.

Second, when you run `R CMD INSTALL` at the command line, use the flag
`--library=/path/to/Rlibs`, as follows:

    R CMD INSTALL --library=/path/to/Rlibs brocolors_0.1.tar.gz

If you install the package using `devtools::install()`, you just need
the `~/.Renviron` file; you don't need to do anything different with
the `install()` command. devtools will use the path defined by the
`R_LIBS` variable.

---

### Homework

Try building and installing your own package.

Then go to the page about [making it a proper package](proper.html).
