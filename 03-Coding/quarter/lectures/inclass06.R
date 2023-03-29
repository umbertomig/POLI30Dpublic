## POLI 30 D
## In-Class Exercise 06
## Based on DSS Materials

## Loading packages (please install them, 
## if you still have not done so)
library(tidyverse)
library(gridExtra)

## Loadging the voting dataset
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv") # loads and stores data
head(voting)

## Creating the numeric treatment variable
voting$pressure <-  ifelse(voting$message=="yes", 1, 0)

## Checking the result
head(voting)

## Differences-in-means: the brave way
mean(voting$voted[voting$pressure==1]) -
  mean(voting$voted[voting$pressure==0]) 

## Differences-in-means: the nicer way
lm(voted ~ pressure, data=voting) 

## End of file