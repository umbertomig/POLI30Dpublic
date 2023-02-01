## POLI 30 D
## In-Class Exercise 03
## Based on DSS Materials

# Load the tidyverse
library(tidyverse)

# Scatter-plots and correlation #

# Loading the STAR data
star <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/STAR.csv")

# Checking the data
head(star)

# Table with classroom size data
table(star$classtype)

# Proportions Table for Classroom size data
prop.table(table(star$classtype))

# Scatterplot reading x math
ggplot(star, aes(x = reading, y = math)) + 
  geom_point() + theme_light()

# Scatterplot reading x math with trend line
ggplot(star, aes(x = reading, y = math)) + 
  geom_point() + geom_smooth(method = 'lm') +
  theme_light()

# Correlation
cor(star$reading, star$math)

# Correlation: order does not matter
cor(star$math, star$reading)

# Median birth year
median(voting$birth)

## End of file