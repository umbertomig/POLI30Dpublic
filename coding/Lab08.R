## POLI 30 D
## Lab 08

## Getting started
library(tidyverse)

# Education expenditure data
educexp <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/educexp.csv")
head(educexp)

# Chile survey data
chile <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/survchileComplete.csv")
head(chile)

# Voting experiment data
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv")
head(voting)

## Group-by and Summarize

# Find the maximum age by region 
# in the Chile Survey data.
chile %>% group_by(region) %>%
  summarize(maximumage = max(age))

# Suppose you want to check the vote 
# of the oldest person in each region.
chile %>% group_by(region) %>% arrange(desc(age)) %>%
  summarize(voteoldest = first(vote), 
            ageoldest = first(age))
# `Y` stands for a vote for Pinochet, and `U` stands for undecided.

# **Question**: How about the vote of the 
# youngest person in each of the regions?

## Recoding variables

# Create a binary variable that is one 
# when the person has `PS` schooling 
# (some college or more).
chile2 <- chile %>%
  mutate(postsec = ifelse(education == 'PS', 1, 0))
chile2 %>% select(education, postsec) %>% head(4)

# Create a binary variable that is one when 
# the person is older than 40.
chile3 <- chile %>%
  mutate(olderthan40 = ifelse(age > 40, 1, 0))
chile3 %>% select(age, olderthan40) %>% head(4)

# **Your turn:** What is the proportion of 
# people over 40 years old by region?

# Let us say you want to create a binary indicator 
# of whether the person lives in the `North` or 
# `Central` regions.
chile4 <- chile %>%
  mutate(NCind = ifelse(region %in% c('N', 'C'), 1, 0))
chile4 %>% count(NCind)

# **Your turn:** Adapt the code above to add 
# also the South region.

# Suppose we want to recode a continuous variable 
# into a discrete one.

# Suppose we want to recode age into three groups:
  # From youngest to 30 years old
  # From 31 to 60 years old
  # Older than 60 years old
chile5 <- chile %>%
  mutate(agecat = 
           cut(age, breaks = c(-Inf, 30, 60, Inf), 
               labels = c('<= 30', '31 to 60', '> 60'), 
               right = T))
chile5 %>% count(agecat)

## Missing Values
chile %>%
  group_by(region) %>%
  summarize(avgsquo = mean(statusquo), nobs = n())

# Most functions in R have a way to deal with it. 
# In `mean`, we add the `na.rm = TRUE` to fix:
chile %>%
  group_by(region) %>%
  summarize(avgsquo = mean(statusquo, na.rm = T), nobs = n())

# We can remove missing using `na.omit`. 
# It removes the missing values and returns a 
# *clean* dataset.
chile %>% select(region, statusquo) %>%
  na.omit() %>% group_by(region) %>%
  summarize(avgsquo = mean(statusquo), nobs = n())

## Random samples
# Extract a 10% sample of the data, 
# **without** replacement.
set.seed(123456) # change here for a different result

educexp10pct <- 
  educexp %>% sample_frac(0.1, replace = F)
educexp10pct %>% head()
educexp10pct %>% dim()

# Extract a 10% sample of the data, 
# **with** replacement.
educexp10pctwr <- 
  educexp %>% sample_frac(0.1, replace = T)
educexp10pctwr %>% head()
educexp10pctwr %>% dim()

# Extract a 10-case sample of the data, 
# **without** replacement.
educexp10case <- 
  educexp %>% sample_n(10, replace = F)
educexp10case %>% head()
educexp10case %>% dim()

# Extract a 10-case sample of the data, 
# **with** replacement.
educexp10casewr <- 
  educexp %>% sample_n(10, replace = T)
educexp10casewr %>% tail(10)

## Creating Random Bernoulli
rv <- rbinom(1000, 1, prob = 0.3)
ggplot(data = data.frame(rv)) + geom_bar(aes(x = rv))

## Creating Random Normal Variables
rv <- rnorm(1000, mean = 33, sd = 7)
ggplot(data = data.frame(rv)) + 
  geom_histogram(aes(x = rv), bins = 20, color = 'white') + 
  theme_minimal()

## Regression summary

# Voting experiment
summary(lm(voted ~ message, data = voting))

# Education expenditure
summary(lm(education ~ income + young + urban, data = educexp))
  
# Questions?

# See you in the next lab!

## End of file