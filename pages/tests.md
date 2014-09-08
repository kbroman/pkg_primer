---
layout: page
title: Writing tests
---

- Hadley Wickham (2011)
  [testthat: Get started with testing](http://rjournal.github.io/archive/2011-1/RJournal_2011-1.pdf#page=5). R
  Journal 3: 5-10

  > It's not that we don't test our code, it's that we don't
  > store our tests so they can be re-run automatically.

- [testthat](https://github.com/hadley/testthat) package
- Also examples, run by `R CMD check`. Be careful about how much time
  they take. Use `\dontrun{}`, `\dontshow{}`, and `\donttest{}`.

- travis CI and `devtools:add_travis()`

---

Now go to the page about [including datasets](data.html).
