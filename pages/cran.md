---
layout: page
title: Getting your R package on CRAN
description: How to get your R package onto the Comprehensive R
             Archive Network (CRAN)
---

The
[Comprehensive R Archive Network (CRAN)](https://cran.r-project.org) is
the main repository for R packages. (If your package concerns
computational biology or bioinformatics, you might be interested in
[Bioconductor](https://bioconductor.org), instead.)
The main advantage to getting your
package on CRAN is that it will be easier for users to install (with
`install.packages`). Your package will also be tested daily on
multiple systems.

It used to be that putting your package on CRAN also gave it some
exposure, but with >6000 packages, that's no longer quite true. To get the
word out about your package, I'd recommend
[twitter](https://twitter.com), writing a blog, or writing a paper
(perhaps for [The R Journal](https://journal.r-project.org/) or
[Journal of Statistical Software](https://www.jstatsoft.org/), though
many other journals, including
[Bioinformatics](https://bioinformatics.oxfordjournals.org/) and
[Genetics](http://www.genetics.org), publish software notes).

Here, I'll give some advice on how to get your package on CRAN. It can
be a [painful](https://twitter.com/xieyihui/status/508650816001945600)
[process](https://twitter.com/_inundata/status/504144292634701825), so
you want to get your package in order before you submit.

1. Run `R CMD check --as-cran` and eliminate _all_
problems. If there are any errors or warnings, your package will not
be accepted at CRAN. And even a &ldquo;Note&rdquo; will likely disqualify
you. So figure out what all of those errors, warnings, and notes mean and then
revise your package so that they are no longer issued.

2. Read the
[CRAN repository policy](https://cran.r-project.org/web/packages/policies.html).
To keep up-to-date with changes, look at
[Dirk Eddelbuettel](http://dirk.eddelbuettel.com)'s
[github repository for the CRAN policy](https://github.com/eddelbuettel/crp),
or follow [@CRANPolicyWatch](https://twitter.com/CRANPolicyWatch) on
twitter.

3. While the official manual on R packages,
[Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html),
is rough going, it would probably be a good idea to read through it
before attempting to submit your package to CRAN.

4. Examples in the help files for your package (`@examples` with
[Roxygen2](https://github.com/klutometis/roxygen)) should be quick, as
every example in every package on CRAN is tested daily on multiple
systems. Use `\dontrun{}` to skip over very-long-running bits of code,
or `\dontshow{}` to add a bit of code to subset an example dataset to
make it much smaller and to make subsequent commands faster. You can
also use `\donttest{}`, which prevents a command from being run during
the tests, but still has the command run during a call to `example()`
(which enables a user to run all of the examples for a function).
`R CMD check --as-cran` and `devtools::check()` will give warnings
about examples that take more than a few seconds to run.

5. Check your package on as many systems as you can. If you have
access to a Unix server, run `R CMD check --as-cran` there; if you
have access to Windows and Mac computers, do the same on both. If you
have no access to a Windows computer, you can submit your package to
the <https://win-builder.r-project.org> to build and check your package
on Windows. You can use `build_win()` in the
[devtools package](https://github.com/hadley/devtools) for this.

6. Also check your package using the development version of R, as this
may reveal additional issues. I find it easiest to accomplish this by
submitting to <https://win-builder.r-project.org> (which gives you the
option of using R-release or R-devel), as then I don't need to
take the time to install R-devel locally.

7. Submit your package at the beginning of a week in which you don't
have many commitments. If CRAN finds problems in your package, you'll
want to have some time to make changes and
resubmit. ([Not everyone agrees with me](https://twitter.com/_inundata/status/509379592830722048)
on this point.)

8. Instructions on how to submit your package to CRAN are at the
bottom of the [CRAN front page](https://cran.r-project.org/),
&ldquo;Submitting to CRAN.&rdquo; Submission is now via a
[web form](https://xmpalantir.wu.ac.at/cransubmit/).  If this process
fails, you can go back to the &ldquo;old&rdquo; method: upload your
package to <ftp://CRAN.R-project.org/incoming> and send an email to `cran@r-project.org`.
The email should be carefully phrased (and must
be sent as `plain text`!). Be sure to mention that you've read and
agree to the
[CRAN policies](https://cran.r-project.org/web/packages/policies.html).

9. Finally, _put on your armor_. One of the people that handles CRAN
submissions can be unnecessarily offensive and pedantic. Try to put
his little barbs out of your mind and focus on his actual advice on
how to revise your package to make it suitable for CRAN.  (Please
don't be put off by CRAN from this
comment. [Many](https://twitter.com/timtriche/status/509144278648381440)
[people](https://twitter.com/KasperDHansen/status/509119291716030464)'s
[experiences](https://twitter.com/ucfagls/status/509045370588889089)
are entirely positive. And you can't expect yourself to have memorized
the entire
[Writing R Extensions manual](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)
nor kept track of all changes to the
[CRAN policy](https://cran.r-project.org/web/packages/policies.html). So
if limitations in your understanding are bluntly pointed out, just
learn from that, revise your package, and resubmit.)

---

Now go to the page about [writing vignettes](vignettes.html).
