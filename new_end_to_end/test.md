``` {#name1 .r echo="FALSE"}
# This is to test code blocks which produce no output, and so can't easily be
# diffed
d <- data.frame(x = rnorm(10), y = rnorm(10))
```

Important Subheading
====================

This is a sentence, which I've changed locally. My favorite number is
`r 2 + 2`.

Here's a plot:

``` {#name2 .r echo="FALSE" fig.width="8" fig.cap="§This is a caption and stuff here§"}
plot(d)
```
