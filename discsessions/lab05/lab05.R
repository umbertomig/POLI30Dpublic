## POLI 30 D
## Lab 05
## Based on DSS Materials
## Thanks to the amazing Adam Wu for reminding me
##        to post this script :)

# Loading tidyverse
library(tidyverse)

## Factor variable types
# Voted
voted <- c(0,0,1,0,1) # 0=no and 1=yes
table(voted)

## Factors
voted_factor <- factor(voted, 
                       levels = c(0,1), 
                       labels = c('No', 'Yes'))
table(voted_factor)

## Factors with prop.tables
prop.table(table(voted_factor))

## Booleans
ages <- c(40, 20, 64, 20, 26, 21, 29, 32)
ages

# Which ages are above 30?
ages
ages > 30

# Which ages are equal to 20?
ages
ages == 20

# Subsetting people 20 years old
ages[!(ages == 20)] # same as ages[ages != 20]

## Lists
# Example:
mylist <- list('numbers' = c(1,2,3), 
               'ages' = c(19,20,33), 
               'text' = 'My name is Tom')
mylist

# Lists indexing
mylist[[1]]
mylist$text

# Lists: adding elements
mylist$newelement = 3

## Tables
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv")
table(voting$message)
prop.table(table(voting$message))

## Plots of a single variable

# Histograms: syntax

# ggplot(data = dataset, aes(x = variable_x_name)) +
#   geom_histogram()

# Histogram: crude
ggplot(data = voting, aes(x = birth)) + geom_histogram()

# Histogram: fancy
ggplot(data = voting, aes(x = birth)) +
  geom_histogram(aes(y = ..density..), 
                 binwidth = 5, 
                 color = 'black', 
                 fill = 'lightblue', 
                 alpha = 0.6) +
  labs(title = 'Histogram of Birth Year', 
       x = 'Birth Year', y = '') + 
  theme_minimal()

# See you in the next lab!

## End of Script