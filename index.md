---
layout: page
title: R package primer
tagline: a minimal tutorial
description: A minimal tutorial on how to make an R package.
---

R packages are the best way to distribute R code and documentation,
and, despite the impression that the official manual
([Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html))
might give, they really are quite simple to create.

You should make an R package even for code that you don't plan to
distribute. You'll find it is easier to keep track of your own
personal R functions if they are in a package. And it's good to write
documentation, even if it's just for your future self.

[Hadley Wickham](http://had.co.nz/) wrote
[a book about R packages](http://r-pkgs.had.co.nz/) (free online; also
available in paper form from
[Amazon](https://www.amazon.com/gp/product/1491910593?ie=UTF8&tag=7210-20)). You
might just jump straight there.

[Hilary Parker](https://hilaryparker.com) wrote a
[short and clear tutorial on writing R packages](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/).
If you want a crash course, you should start there. A lot of people
have successfully built R packages from her instructions.

But there is value in having a diversity of
resources, so I thought I'd go ahead and write my own minimal tutorial.
The following list of topics looks forbidding, but each is short and
straightforward (and hopefully clear). If you're put off by the list
of topics,
and you've not already abandoned me in favor of
[Hadley's book](http://r-pkgs.had.co.nz/), then why aren't you reading
[Hilary's tutorial](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)?

If anyone's still with me, the following pages cover the essentials of
making an R package.

- [Why write an R package?](pages/why.html)
- [The minimal R package](pages/minimal.html)
- [Building and installing an R package](pages/build.html)
- [Making it a proper package](pages/proper.html)
- [Writing documentation with Roxygen2](pages/docs.html)
- [Software licenses](pages/licenses.html)
- [Checking an R package](pages/check.html)

The following are important but not essential.

- [Putting it on GitHub](pages/github.html)
- [Getting it on CRAN](pages/cran.html)
- [Writing vignettes](pages/vignettes.html)
- [Writing tests](pages/tests.html)
- [Including datasets](pages/data.html)
- [Connecting to other packages](pages/depends.html)

The following contains links to other resources:

- [Further resources](pages/resources.html)

If anything here is confusing (or _wrong_!), or if I've missed
important details, please
[submit an issue](https://github.com/kbroman/pkg_primer/issues), or (even
better) fork [the GitHub repository for this website](https://github.com/kbroman/pkg_primer),
make modifications, and submit a pull request.

---

The source for this tutorial is [on github](https://github.com/kbroman/pkg_primer).

Also see my [tutorials](https://kbroman.org/pages/tutorials) on
[git/github](https://kbroman.org/github_tutorial),
[GNU make](https://kbroman.org/minimal_make),
[knitr](https://kbroman.org/knitr_knutshell),
[making a web site with GitHub Pages](https://kbroman.org/simple_site),
[data organization](https://kbroman.org/dataorg),
and [reproducible research](https://kbroman.org/steps2rr).
