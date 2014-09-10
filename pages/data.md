---
layout: page
title: Including datasets
---

It can be useful to include example datasets in your package, to use
in examples or vignettes, or to illustrate the expected format. 

If your example datasets are enormous, you might want to make a
separate package just with the data. Examples of data packages include
[Hadley Wickham](http://had.co.nz/)'s
[babynames](https://github.com/hadley/babynames),
[nycflights13](https://github.com/hadley/nycflights13), and
[usdanutrients](https://github.com/hadley/usdanutrients) packages.

To include datasets with your package, create a `data` subdirectory
and place your datasets there in `.RData` format, as created with the
`save` function. For example,

    save(mydata, file="data/mydata.RData")
    
\[documentation\]

---

Now go to the page about [connecting to other R packages](depends.html).
