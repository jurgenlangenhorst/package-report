#' Which libraries does R search for packages?


library(dplyr)
#' Installed packages

## use installed.packages() to get all installed packages
ipr=as.data.frame(installed.packages())

## how many ipr?
nrow(ipr)

#' Exploring the ipr

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
ipr %>% count(LibPath)
ipr %>% count(Priority)
ipr %>% count(LibPath,Priority)
##   * what proportion need compilation?
ipr %>% count(NeedsCompilation) %>% mutate(prop = n/sum(n))
##   * how break down re: version of R they were built on
ipr %>% count(Version) %>% mutate(prop = n/sum(n))


#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
