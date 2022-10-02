# Implicit Expansion

This package implements a feature known as "Broadcasting" in Python 
(see e.g. [here](https://numpy.org/doc/stable/user/basics.broadcasting.html))
and as "Implicit Expansion" in Matlab
(see e.g. [here](https://ch.mathworks.com/help/matlab/matlab_prog/compatible-array-sizes-for-basic-operations.html)).
In operations involving multiple arguments of type array
(or vector, matrix, list) with mismatching dimensions, any argument is
repeated along its dimensions of size (exactly) 1, as often as necessary to
match the other argument(s).
See also [rray](https://github.com/r-lib/rray).

To install the [CRAN version](https://CRAN.R-project.org/package=implicitExpansion), run:
```r
install.packages('implicitExpansion')
```
To install the latest [development version](https://github.com/ManuelHentschel/implicitExpansion), run:
```r
remotes::install_github('ManuelHentschel/implicitExpansion')
```
