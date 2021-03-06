## remember to restart R here!

## create a data frame by reading from data/installed-packages.csv
## hint: readr::read_csv() or read.csv()
## idea: try using here::here() to create the file path
library(here)
library(dplyr)
setwd(here('Data','Produced'))
df=read.csv('01_write-installed.packages.csv')
## filter out the base and recommended packages
## keep the variables Package and Built
## if you use dplyr, code like this will work:
apt <- df %>%
  filter(is.na(Priority)) %>%
  select(Package, Built)

write.csv(apt,'add-on-packages.csv')
## write this new, smaller data frame to data/add-on-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

write.csv(apt_freqtable,'add-on-packages-freqtable.csv')

## write this data frame to data/add-on-packages-freqtable.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path

## YES overwrite the files that are there now
## they are old output from me (Jenny)
## they are just examples
