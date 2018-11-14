<!-- README.md is generated from README.Rmd. Please edit that file -->
**NOTE: This is a toy package created for expository purposes. It is not meant to actually be useful. If you want a package for factor handling, please see [forcats](https://cran.r-project.org/package=forcats).**

### foofactors

Factors are a very useful type of variable in R, but they can also drive you nuts. This package provides some helper functions for the care and feeding of factors.

### Installation

``` r
devtools::install_github("STAT545-UBC-students/hw07-Irissq28/foofactors_package/foofactors")
```

### Quick demo

#### `fbind()`

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
#> [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
#> [1] character hits      your      eyeballs  but       integer   where it 
#> [8] counts   
#> Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
#> x
#>  a  b  c  d  e 
#> 25 26 17 17 15
as.data.frame(table(x))
#>   x Freq
#> 1 a   25
#> 2 b   26
#> 3 c   17
#> 4 d   17
#> 5 e   15
```

#### `freq_out()`

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
#> # A tibble: 5 x 2
#>   x         n
#>   <fct> <int>
#> 1 a        25
#> 2 b        26
#> 3 c        17
#> 4 d        17
#> 5 e        15
```

#### `fcheck`

This is the basic function to check the whether the input is a factor or not, if true it returns nothing, otherwise it will throw an error.

``` r
fcheck(iris$Species)
fcheck(gapminder::gapminder$continent)
```

#### `fconvert`

This function is used to encode a vector/vectors as a factor/factors

``` r
fconvert("apple")
#> [1] apple
#> Levels: apple
fconvert(c("low","medium","high"))
#> [1] low    medium high  
#> Levels: high low medium
```

#### `flevel`

This function returns the levels by the order they appear in the dataset and the number of levels which its factor has.

``` r
flevel(iris$Species)
#> [1] "setosa"     "versicolor" "virginica"  "3"
flevel(gapminder::gapminder$continent)
#> [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"  "5"
```

#### `fdetect`

This function is used to detect factors that should be character based on the fact that the length of character equals the number of its unique values, however, factor doesn't have that characteristic.

``` r
# the input is character
fdetect(factor(c("a","b","c")))
#> [1] FALSE
# the input is factor
fdetect(factor(c("a","b","c","b")))
#> [1] TRUE
```

#### `fset`

This function is used to set levels to the order in which they appear in the data

``` r
fset(factor(c("c", "d", "b", "a")))
#> [1] c d b a
#> Levels: c d b a
```

### Family of related funcitons `order_doc`

#### `fordered`

fordered(x) is the function used to sets levels to the order in which they appear in the data, the input should be a factor, otherwise, the function will come to an error.

``` r
fordered(iris$Species)
#> [1] setosa     versicolor virginica 
#> Levels: setosa < versicolor < virginica
fordered(gapminder::gapminder$continent)
#> [1] Asia     Europe   Africa   Americas Oceania 
#> Levels: Africa < Americas < Asia < Europe < Oceania
```

#### `fdesc`

fdesc(x) is used to reorder factor in descenging order, it will come to an error when the param is not a factor.

``` r
fdesc(factor(c("a","b","c"))) # Levels: c b a
#> [1] a b c
#> attr(,"scores")
#>  a  b  c 
#> -1 -2 -3 
#> Levels: c b a

# compare to the fordered function
fordered(factor(c("a","b","c")))
#> [1] a b c
#> Levels: a < b < c
```

### Family of related funcitons `df_read_write`

#### `df_write`

Use `df_write` to write the data frame into text file.

``` r
lev <- levels(gapminder::gapminder$continent) 
continent_df <- as.data.frame(lev)
df_write(continent_df, "continent.txt")
```

Use `df_read` to read from the "continent.txt" we wrote before.

``` r
re_df <- df_read("continent.txt")
re_df
#>        lev
#> 1   Africa
#> 2 Americas
#> 3     Asia
#> 4   Europe
#> 5  Oceania
```
