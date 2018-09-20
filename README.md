<!-- README.md is generated from README.Rmd. Please edit that file -->
pipestarter
===========

The goal of pipestarter is to provide an RStudio add-in for converting a
variable name to an assignment string. The project framework was cloned
from Ben Marwick’s “snakecaser”
<https://github.com/benmarwick/snakecaser>

Examples
--------

Start a line with:

my\_varname

if the cursor in the RStudio editor is at the end of the variable name
this is what the addin will change it to:

my\_varname &lt;- my\_varname %&gt;%

That’s it!

Alternatively, highlighted text will be modified the same way.

Installation
------------

This add-in can be installed with:

``` r
devtools::install_github("apsteinmetz/startpipe")
```
