---
layout: page
title: Writing tests
---

Hadley Wickham said it best, in
[his 2011 paper](http://rjournal.github.io/archive/2011-1/RJournal_2011-1.pdf#page=5)
on his [testthat](https://github.com/hadley/testthat) package:

> It's not that we don't test our code, it's that we don't
> store our tests so they can be re-run automatically.

How do you know that the code you write works? You try it out. How do
you know that your code still works a year later? Well, ideally you
saved those initial tests; even better, you don't just save them, but
you structure them in a way that you'll be running them
regularly. This will give you confidence that later changes haven't
broken things that worked.

### `R CMD check`

The simplest (but most crude) tests are the examples in your
[documentation](docs.html). These are run each time you use
`R CMD check`. But that doesn't check to see if your code is actually
giving the right answers. You're just notified if the code produces
errors.

- Also examples, run by `R CMD check`. Be careful about how much time
  they take. Use `\dontrun{}`, `\dontshow{}`, and `\donttest{}`.

### [testthat](https://github.com/hadley/testthat) package

For proper tests, in which you assess whether your code is giving the
correct answers, use the
[testthat](https://github.com/hadley/testthat) package. You're best
off reading the section in Hadley's [book on R packages](), but let me
give a brief synopsis with a few examples.

- [testthat](https://github.com/hadley/testthat) package

### Travis CI

- travis CI and `devtools:add_travis()`

### When you find a bug, write a test

- When you find a bug, first write a test and then fix the bug.
  - before fixing the bug, you want to be able to reproduce it. You
    should capture that effort as a formal test.
  - having the test formalized will help you to assess whether you've
    fixed the problem

---

Now go to the page about [including datasets](data.html).
