---
layout: page
title: Putting your R package on GitHub
---

This page will be more motivational than instructional, but there's
a bit of instruction at the end.

### Use version control

If you are developing an R package, well really for almost everything you
do on a computer, you need a system for keeping track of the changes
to the source code for the package.  There are three basic ways to
keep track of those changes.

1. Don't keep track at all.
2. Periodically save numbered zip files (or `*.tar.gz` files).
3. Use a formal version control system, like [git](http://git-scm.com).

Over my career, I did a bit of the first, then a whole bunch of the
second, I dipped my toe in the first third with a single project, and
now I use [git](http://git-scm.com) to keep track of _everything_ I
do: software, data analysis projects, manuscripts, slides for talks,
and websites (like [this one](http://github.com/kbroman/pkg_primer)).

The advantages of a formal version control system like git include

- You have a full record of exactly how your code got to be in its
  current state.
- If something stops working, you can easily go back to previous
  versions to see when it stopped working, and so more easily identify
  _why_ it stopped working.
- You can try out new features without worrying about breaking things
  that work.
- [git](http://git-scm.com), in particular, does a fantastic job at
  merging simultaneous changes from multiple collaborators. Even if
  your collaborator is not using version control, that you yourself
  are using it will make it easier to incorporate and understand their
  changes.

If you're totally new to version control, consider my
[git/github guide](http://kbroman.org/github_tutorial).


### What is GitHub?

[GitHub](http://github.com) is a website that serves as home for
[git](http://git-scm.com) repositories. It's sort of like facebook for
programmers (and data scientists): everyone's on there; you can look
at what they're working on and easily peruse their code and make
suggestions or changes.

GitHub lowers the barriers to collaboration. It's easy to offer
suggested changes to others' code through GitHub, and it's easy for
them to incorporate your suggested changes.

### Why put your R package on GitHub?

There are a number of advantages to putting your R package on GitHub.

- It'll be easier for others to peruse your code. They can do so in
  the web browser without having to download, extract, and start
  fishing.
- GitHub includes issue tracking: people (including yourself) can note
  problems they're having or suggestions for improvements they'd like
  you to make.
- In addition to just pointing out problems, people can actually fix
  the problem and send you a patch, which you can easily test and then
  incorporate into your package. Some of this can be done entirely
  online, with no knowledge of git. Rather than having someone say,
  &ldquo;There's a typo in your documentation,&rdquo; they can say
  &ldquo;Here, I've fixed a typo in your documentation.&rdquo;
- With the `install_github()` function in
  [Hadley Wickham](http://had.co.nz/)'s
  [devtools](https://github.com/hadley/devtools) package, it's easy
  for people to install your package directly from GitHub. It doesn't
  have to be on [CRAN](http://cran.r-project.org). (As
  [you'll see](cran.html), getting your package on CRAN can be a bit
  difficult.)

It's important to mention that there are alternatives to GitHub. The
main one is [BitBucket](http://bitbucket.org). GitHub has the
advantage of being more popular, and I prefer its interface. But
BitBucket allows unlimited private repositories. (With a free account
at GitHub, all of your repositories must be completely open, though
faculty and students can
[get a free upgrade](http://education.github.com), for educational
use, to an account that allows up to 5 private repositories.) With
BitBucket, you can use either git or the
[mercurial](http://mercurial.selenic.com/) version control system;
mercurial is a bit simpler than git.

### How to install a package from GitHub

How do you install a package that's sitting on GitHub?

1. First, you need to install the
   [devtools](https://github.com/hadley/devtools) package. You can do
   this from [CRAN](http://cran.r-project.org). Invoke R and then type

       install.packages("devtools")

2. Load the devtools package.

       library(devtools)

3. In most cases, you just use `install_github("author/package")`.
   For example, with my [R/broman](https://github.com/kbroman/broman)
   package, which exists at
   [github.com/kbroman/broman](https://github.com/kbroman/broman),
   you'd type

       install_github("kbroman/broman")

There's some extra fanciness that you need to do if the version you
want sits on some
[branch](http://kbroman.org/github_tutorial/pages/branching.html) of
the repository, or if the package is in a subdirectory of the main
repository.

For example, [Bill Engels](http://genetics.wisc.edu/Engels.htm) has an R package
[HWxtest](https://github.com/wrengels/HWxtest), but the package
actually sits in the `pkg` subdirectory. To install his package with
`install_github()`, you'd need to do:

    install_github("wrengels/HWxtest", subdir="pkg")

His package includes some C code, so you may need some extra tools to
install it (e.g.,
[Xcode](https://developer.apple.com/xcode/downloads/) for Mac users,
and [Rtools](http://cran.us.r-project.org/bin/windows/Rtools/) for
Windows users).

### Extra stuff to add to your R package

---

Now go to the page about [getting your R package on CRAN](cran.html).
