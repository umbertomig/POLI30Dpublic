## POLI 30 D
## In-Class Exercise 05
## Based on DSS Materials

## Loading packages (please install them, 
## if you still have not done so)
library(tidyverse)
library(gridExtra)

## Step 1: Load and Explore Data
survchile <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/survchile.csv")
head(survchile)

## Step 2.1: Identify the Dependent and Independent Variables
# Histograms
p1 <- ggplot(data = survchile, aes(x = statusquo)) + 
  geom_histogram(bins = 7, color = 'black', 
                 fill = 'lightblue', alpha = 0.4) + 
  labs(title = 'Status Quo Scale', y = '') + 
  theme_minimal()

p2 <- ggplot(data = survchile, aes(x = voteYES)) + 
  geom_histogram(bins = 7, color = 'black', 
                 fill = 'lightblue', alpha = 0.4) + 
  labs(title = 'Intention to vote YES\nin the plebiscite', y = '') + 
  theme_minimal()

grid.arrange(p1, p2, nrow = 1)

## Step 2.2: Identify the Dependent and Independent Variables
# Means
mean(survchile$voteYES)

## Step 3.1: What is the relationship between X and Y?
# Scatterplot
ggplot(data = survchile, aes(x = statusquo, y = voteYES)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  labs(title = '', y = 'Intention to vote YES in the plebiscite', 
       x = 'Status-Quo Scale') + 
  theme_minimal()

## Step 3.2: What is the relationship between X and Y?
# Scatterplot with a little jitter
ggplot(data = survchile, aes(x = statusquo, y = voteYES)) + 
  geom_jitter(fill = 'lightblue', alpha = 0.5, 
              height = 0.4, width = 0) + 
  labs(title = '', y = 'Intention to vote YES\nin the plebiscite', 
       x = 'Status-Quo Scale') + 
  theme_minimal()

## Step 3.3: What is the relationship between X and Y?
# Correlation
cor(survchile$statusquo, survchile$voteYES)

## Step 4.1: Fit a linear model using the least squares method
# Fitting the linear model
lm(voteYES ~ statusquo, data = survchile)


## Step 4: Fit a linear model using the least squares method
# The scatterplot with the linear model
ggplot(data = survchile, aes(x = statusquo, y = voteYES)) + 
  geom_jitter(fill = 'lightblue', alpha = 0.5, 
              height = 0.4, width = 0) + 
  labs(title = '', y = 'Intention to vote YES in the plebiscite', 
       x = 'Status-Quo Scale') + 
  geom_smooth(formula = 'y ~ x', method = 'lm', 
              se = F, color = 'blue', lwd = 1) +
  theme_minimal()

## Step 7.1: Measure how well the model fits the data
# R-square for the Chile Survey
cor(survchile$statusquo, survchile$voteYES)^2

## Step 7.2: Measure how well the model fits the data
# R-square for the education expenditure
educexp <- read.csv('https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/educexp.csv')
cor(educexp$income, educexp$education)^2

## End of file