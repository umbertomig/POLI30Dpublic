## POLI 30 D
## In-Class Exercise 08
## Based on DSS Materials

## Loading the dataset
star <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/STAR.csv") # reads and stores data

## Create treatment status
star$small <- # stores return values as new variable
  ifelse(star$classtype=="small", # logical test
         1, # return value if true
         0) # return value if false

## Checking the star dataset
head(star) # shows first observations

## Linear regression: estimation
mod <- lm(math ~ small, data = star)
mod

## Linear regression: hypothesis testing
summary(mod)

## End of file