## POLI 30 D
## Lab 06
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

## Barplots
ggplot(data = chilesurv, aes(x = vote)) +
  geom_bar()

## Barplots (pretty)

ggplot(data = chilesurv, aes(x = vote)) +
  geom_bar(color = 'black', fill = 'lightblue', alpha = 0.6) +
  labs(title = 'Barplot of Vote Intention', x = 'Vote Intention', y = '') + theme_minimal()

## Mosaic Plots
ggplot(data = voting, aes(x = message, fill = as.factor(voted))) +
  geom_bar(position = 'fill')

\vspace{-2cm}

## Mosaic Plots (pretty)
ggplot(data = voting, aes(x = message, fill = as.factor(voted))) +
  geom_bar(position = 'fill', alpha = 0.7, color = 'gray') + 
  scale_fill_manual(values = c('red', 'blue'), name = 'Voted') + 
  labs(title = 'Mosaicplot of Vote x Message', 
       x = 'Message Status', y = 'Vote Intention') + theme_minimal()

## Violin Plots
ggplot(data = chilesurv, aes(x = as.factor(vote), y = statusquo)) +
  geom_violin()

## Violin Plots (pretty)
ggplot(data = chilesurv, aes(x = as.factor(vote), y = statusquo)) +
  geom_violin(fill = 'pink', alpha = 0.7, bw = 0.6, draw_quantiles = 0.5) + 
  labs(title = 'Vote x Status-quo Satisfaction', 
       x = 'Vote', y = 'Status-quo') + theme_minimal()

## Scatter plots
ggplot(data = educexp, aes(x = income, y = education)) +
  geom_point()

## Scatter plots (pretty)
ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  #geom_text(aes(label=states), size=2) + 
  labs(title = '', y = 'Per-Capita Education Expenditure', x = 'Per-Capita Income') + 
  theme_minimal()

## Scatter plots with trend line
ggplot(data = educexp, aes(x = income, y = education)) +
  geom_point() + geom_smooth(se = F, formula = 'y ~ x')

## Scatter plots with trend line (pretty)
ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  labs(title = '', y = 'Education Expenditure', x = 'Income') +
  geom_smooth(formula = 'y ~ x', method = 'lm', 
              se = F, color = 'blue', lwd = 1) + theme_minimal()

## Scatter plots with binary dependent
ggplot(data = chilesurv, aes(x = statusquo, y = voteYES)) +
  geom_jitter(height = 0.4, width = 0)

## Scatter plots with binary dependent (pretty)
ggplot(data = chilesurv, aes(x = statusquo, y = voteYES)) + 
  geom_jitter(fill = 'lightblue', alpha = 0.5, height = 0.4, width = 0) + 
  labs(title = '', y = 'Intention to vote YES\nin the plebiscite', 
       x = 'Status-Quo Scale') + theme_minimal()

## Correlation
cor(educexp$education, educexp$income)

# **Your turn:** what is the correlation between 
# education expenditure and proportion of young people?

## Bivariate regression
lm(education ~ income, data = educexp)

# **Your turn:** what is the regression estimates for
# education expenditure explained by proportion of young people?

# See you in the next lab!

## End of Script