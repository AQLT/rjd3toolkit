# The Gamma Distribution

Density, (cumulative) distribution function and random generation for
Gamma distribution.

## Usage

``` r
density_gamma(shape, scale, x)

cdf_gamma(shape, scale, x)

random_gamma(shape, scale, n)
```

## Arguments

- shape, scale:

  shape and scale parameters.

- x:

  vector of quantiles.

- n:

  number of observations.

## Examples

``` r
density_gamma(shape = 1, scale = 2, x = 1:10)
#>  [1] 0.303265330 0.183939721 0.111565080 0.067667642 0.041042499 0.024893534
#>  [7] 0.015098692 0.009157819 0.005554498 0.003368973
cdf_gamma(shape = 1, scale = 2, x = 1:10)
#>  [1] 0.3934693 0.6321206 0.7768698 0.8646647 0.9179150 0.9502129 0.9698026
#>  [8] 0.9816844 0.9888910 0.9932621
random_gamma(shape = 1, scale = 2, n = 10)
#>  [1] 0.9440337 2.1271972 0.3572869 0.9968715 1.7987407 0.4249235 0.1597337
#>  [8] 1.7671013 3.5011841 4.4231391
```
