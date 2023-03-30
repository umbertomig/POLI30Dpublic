## POLI 30 D
## Lab 07
## Based on DSS Materials

## Getting Started

# tidyverse
library(tidyverse)

# Education expenditure
educexp <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/educexp.csv")
head(educexp)

# Chile survey
chilesurv <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/survchile.csv")
head(chilesurv)

# Voting experiment
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv")
head(voting)

## Select without pipe: the boring way
educ2 <- select(educexp, education, income, young, urban)
head(educ2)

## Select with pipe: the pro way
educ3 <- educexp %>%
  select(education, income, young, urban)
head(educ3)

## Selecting Variables (useful methods)

# | Method             | Effect                                          |
# |--------------------|-------------------------------------------------|
# | v1, v2, v3 (etc)   | Select given variables                          |
# | starts_with('xyz') | Select starting with `xyz`                      |
# | ends_with('xyz')   | Select ending with `xyz`                        |
# | contains('xyz')    | Select variables that have `xyz` in their names |
# | vk:vn              | All variables between `vk` and `vn`             |
# | -(vk:vn)           | All but the variables between `vk` and `vn`                            |

## Selects all but states
educ4 <- educexp %>% select(-states)
head(educ4, 3)

## Selects onlyn the variables that starts with
##  `vote` in their names:
chile2 <- chilesurv %>% 
  select(starts_with('vote'))
head(chile2)

## Rename
chile3 <- chilesurv %>% 
  rename(votebinary = voteYES)
head(chile3)

## Pipeing like a boss
# Pipe is very useful to combine commands
chile4 <- chilesurv %>%
  select(starts_with('vote')) %>%
  rename(votebinary = voteYES)
head(chile4)

## Filtering Rows
voting2 <- voting %>% 
  filter(birth >= 1975)
head(voting2)

## Arrange
educexp %>% 
  arrange(desc(education))

## Arrange
voting %>% 
  arrange(birth, desc(message)) %>%
  head()

# Kind of weird having so many folks born 
# in 1900... what do you think?

## Mutating
educ5 <- educexp %>% 
  mutate(logeduc = log(education), 
         sum_iyu = income + young + urban)
head(educ5)

## Summarize without grouping:
educexp %>%
  summarize(avgeduc = mean(education), 
            stdeveduc = sd(education), 
            neduc = n(),
            avginc = mean(income), 
            stdevinc = sd(income), 
            ninc = n())

## There are lots of functions:
# mean: compute means
# sd: compute standard deviation
# median: compute median
# var: computes variance
# sum: computes sum of values
# n: count the number of cases
# and so on...

## Group-by and Summarize (as tibble)
voting %>% 
  group_by(message) %>%
  summarize(avgvote = mean(voted) * 100, 
            ncases = n())

## Group-by and Summarize (as data.frame)
voting %>% 
  group_by(message) %>%
  summarize(avgvote = mean(voted) * 100, 
            ncases = n()) %>%
  data.frame()

## **Your turn:** Adapt this example here to 
## compute the percentage of voters in the 
## treatment and the control group, filtering 
## by younger voters (born on or after 1975).

## Example:
# voting %>% 
#   group_by(message) %>%
#   summarize(avgvote = mean(voted) * 100, 
#             ncases = n())

## `ggcorrplot` and `GGally`

## To install them, un-comment the code below
#install.packages('ggcorrplot')
#install.packages('GGally')

## Important: you only need to install once.
## After that, it is going to be in your computer
## But you always need to keep loading it!

## Loading the two useful packages
library('ggcorrplot')
library('GGally')

## Pairs-plot
educexp %>% 
  select(-states) %>%
  ggpairs(aes(alpha = 0.4)) + 
    theme_minimal()
  
## Correlation (the numbers)
educexp %>% 
  select(-states) %>% 
  cor()

# Note the "select" step: we need to remove the states names!

## Correlations (with squares)
educexp %>% 
  select(-states) %>% 
  cor() %>%
  ggcorrplot() 

## Correlations (with circles)
educexp %>% 
  select(-states) %>% 
  cor() %>%
  ggcorrplot(method = 'circle') + 
    theme_minimal()

# See you in the next lab!

## End of Script