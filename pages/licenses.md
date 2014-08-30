---
layout: page
title: Software licenses
---

The last thing you need to do before your package is a _proper_ R
package is to choose a license for your software and specify the
license within the `DESCRIPTION` file.

Software licenses are about two things: _copyright_, and _protecting
yourself_ from being held liable if your software screws something up
somewhere down the line.

I know next to nothing about copyright law outside the United States,
but in the US, [copyright](http://www.copyright.gov/circs/circ01.pdf)
is _automatic_ (you don't need to write &ldquo;&copy; 2014
A. Pendantic Person, All Rights Reserved&rdquo; all over the place, or
even once), and it gives you exclusive rights to copy your code. So if
you don't choose a license for your software, _no one else can use it!_

So, [pick a license, any license](http://blog.codinghorror.com/pick-a-license-any-license/).

There are
[lots of different software licenses](https://tldrlegal.com/) to
choose from. That's part of why this such a painful topic. (That they are almost
all really boring to read is another part of the pain. The
[WTFPL](http://www.wtfpl.net/) is one of the few that is not boring.)

Personally, I choose between the
[MIT license](http://en.wikipedia.org/wiki/MIT_License) and the
[GNU General Public License (GPL)](http://www.gnu.org/copyleft/gpl.html). The
MIT license is among the more permissive. The GPL is
&ldquo;viral&rdquo; in that it extends to derivative works: software
that incorporates code that was licensed under the GPL must also be
licensed under the GPL. So I use the GPL _if I have to_ (that is, if
I've incorporated others' GPL code), and I use the MIT license
otherwise.

### Don't use a Creative Commons license

An important thing to remember: **don't use a
[Creative Commons](http://creativecommons.org/) (CC) license for
software**. Creative Commons licenses (like [CC-BY](http://creativecommons.org/licenses/by/3.0/))
are great things, but they're for things like articles, books, and
videos, **but not software**. As
[they say in their FAQ](https://wiki.creativecommons.org/FAQ#Can_I_use_a_Creative_Commons_license_for_software.3F):

> We recommend against using Creative Commons licenses for software.

Use CC licenses for your lecture notes, slides, and articles, but not
for your software.


### Indicating your choice in your package

So, pick a license, any license. And then indicate your choice in the
`DESCRIPTION` file for your R package.

#### GNU General Public License (GPLv3)

If you choose the GPL, note that there are multiple
versions. [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) is the old
version. Don't choose that. Choose the newer one,
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The newer one fixes
some loopholes in the older one.

To use the GPLv3 with your R package, include the following line in
your `DESCRIPTION` file.

    License: GPL-3

That's it.

#### MIT license

If you're not incorporating code that is licensed under the GPL, I
recommend going with the MIT license.

Unfortunately, and for reasons that I don't understand, the R Core
considers the MIT license to be not a proper license but rather a
_template_ for a license. And so if you want to use the MIT license,
they want you to include a `LICENSE` file in your package that
includes the text of the actual license. You need a file
[like this](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage5/LICENSE),
but replacing &ldquo;Karl Broman&rdquo; with your name (and also
changing the copyright date).

Then, in your `DESCRIPTION` file, include the following line.

    License: MIT + file LICENSE
    
The all caps `LICENSE` in that line is the name of the file (within
your package) with the license text. You could call it `License.txt`
if you want. In this case, the relevant line in your `DESCRIPTION`
file should be the following.

    License: MIT + file License.txt

With this, our package looks
[like this](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage5)
and it is now a _proper R package_.

---

### Homework

Pick a license for your software, make the appropriate change to your
`DESCRIPTION` file, and if necessary add a `LICENSE` file.

Then go to the page about [checking an R package](check.html).
