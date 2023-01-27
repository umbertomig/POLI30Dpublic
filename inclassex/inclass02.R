## POLI 30 D
## In-Class Exercise 02
## Based on DSS Materials

# Installing the tidyverse package (more on that on Lab 04)
install.packages('tidyverse')

# Load the tidyverse
library(tidyverse)

# Summary Statistics Based on Voting Data #

# Loading the data
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv")

# Checking the data
head(voting)

# Table with voting data
table(voting$voted)

# Proportions Table for Voting Data
prop.table(table(voting$voted))

# Histogram of birth
ggplot(voting, aes(x = birth)) + 
  geom_histogram(binwidth = 5) + theme_light()

# Barplot of the voted variable
ggplot(voting, aes(x = voted)) + 
  geom_bar(aes(x = as.character(voted))) + theme_light()

# Average proportion of people that voted
mean(voting$voted)

# Average birth year
mean(voting$voted)

# Median birth year
median(voting$birth)

# Median is unaffected by extreme values:
mean(c(voting$birth, 1000000000))
median(c(voting$birth, 1000000000))

# Standard deviation birth
sd(voting$birth)

# Variance of birth
var(voting$birth)

## End of file