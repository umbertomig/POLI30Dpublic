## POLI 30 D
## In-Class Exercise 07
## Based on DSS Materials

## Loading the dataset
leaders <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/leaders.csv")

## Checking the first few observations
head(leaders)

## Quick summary of the dataset
summary(leaders)

## Linear regression of polity after the assassination attempt
#   explained by the attempt's success:
lm(polityafter ~ died, data = leaders)  

## Confounder: maybe the places with successful attempts were
#   different than the places without a successful attempt:
mean(leaders$politybefore[leaders$died==1]) # treatment
mean(leaders$politybefore[leaders$died==0]) # control

## Linear regression controlling for previous democracy
#   levels:
lm(polityafter ~ died + politybefore, data=leaders)  

## End of file