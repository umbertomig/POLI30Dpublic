## POLI 30 D
## In-Class Exercise 04
## Based on DSS Materials

## Loading packages (please install them, 
## if you still have not done so)
library(tidyverse)
library(gridExtra)

## Step 1: Load and Explore Data
educexp <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/educexp.csv")
head(educexp)

## Step 2: Identify the Dependent and Independent Variables
p1 <- ggplot(data = educexp, aes(x = income)) + 
  geom_histogram(bins = 7, color = 'black', 
                 fill = 'lightblue', alpha = 0.4) + 
  labs(title = 'Per-Capita Income', y = '') + 
  theme_minimal()
p2 <- ggplot(data = educexp, aes(x = education)) + 
  geom_histogram(bins = 7, color = 'black', 
                 fill = 'lightblue', alpha = 0.4) + 
  labs(title = 'Per-Capita Education Exp.', y = '') + 
  theme_minimal()
grid.arrange(p1, p2, nrow = 1)

## Step 3.1: What is the relationship between X and Y?
ggplot(data = educexp, aes(x = income, y = education)) + 
  #  geom_point(fill = 'lightblue', alpha = 0.4) + 
  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = 'Per-Capita Education Expenditure', 
       x = 'Per-Capita Income') + 
  theme_minimal()

# And if you want the points instead of the State labels:
ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  #geom_text(aes(label=states), size=2) + 
  labs(title = '', y = 'Per-Capita Education Expenditure', 
       x = 'Per-Capita Income') + 
  theme_minimal()

# Both in the same plot look bad. If you find a way to make
# them look better, please let me know :)

## Step 3.2: What is the relationship between X and Y?
# Correlation coefficient
cor(educexp$income, educexp$education)

## Step 4.1: Fit a linear model using the least squares method
p1 <- ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  #  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = '', x = '') + 
  geom_hline(yintercept = mean(educexp$education), 
             color = 'blue', lwd = 1) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30))
p2 <- ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  #  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = '', x = '') + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 30)) + 
  geom_smooth(formula = 'y ~ x', method = 'lm', 
              se = F, color = 'blue', lwd = 1)
grid.arrange(p1, p2, nrow = 1)

## Step 4.2: Fit a linear model using the least squares method
# Using mean of Y as a prediction
pred1dist <- rep(mean(educexp$education), dim(educexp)[1])

# Using the least square line as a prediction
pred2dist <- as.numeric(lm('education ~ income', 
                           data = educexp)$fitted.values)

# Doing the plots
p1 <- ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  geom_segment(aes(xend = income, yend = pred1dist), 
               color = "red", lty = 3) +
  #  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = '', x = '') + 
  geom_hline(yintercept = mean(educexp$education), 
             color = 'blue', lwd = 1) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30))
p2 <- ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_point(fill = 'lightblue', alpha = 0.4) + 
  geom_segment(aes(xend = income, yend = pred2dist), 
               color = "red", lty = 3) +
  #  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = '', x = '') + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 30)) + 
  geom_smooth(formula = 'y ~ x', method = 'lm', 
              se = F, color = 'blue', lwd = 1)
grid.arrange(p1, p2, nrow = 1)

# Removing the predictions (be careful with rm(.)...
# It is used for removing objects that you don't need more.)
rm(pred1dist, pred2dist)

## Step 4.3: Fit a linear model using the least squares method
# Now actually doing the estimation!
lm('education ~ income', data = educexp)

# And drawing a nice plot. The additional stuff is
# to customize the plot, but you can do:
####
# > ggplot(data = educexp, aes(x = income, y = education)) + 
# >   geom_text(aes(label=states), size=2) + 
# >   geom_smooth(formula = 'y ~ x', method = 'lm', se = F)
###
# And it would be enough...
ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_text(aes(label=states), size=2) + 
  labs(title = '', y = 'Education Expenditure', x = 'Income') +
  geom_smooth(formula = 'y ~ x', method = 'lm', 
              se = F, color = 'blue', lwd = 1) + 
  theme_minimal()

## Step 5: Interpretation of Coefficients
# Where is the intercept?
ggplot(data = educexp, aes(x = income, y = education)) + 
  geom_text(aes(label=states), size=2) + 
  # Changing the start and endpoints of the plot
  xlim(0, max(educexp$income)) + 
  ylim(0, max(educexp$education)) +
  labs(title = '', y = 'Education Expenditure', x = 'Income') +
  # Note the fullrange = T!
  geom_smooth(formula = 'y ~ x', method = 'lm', se = F, 
              color = 'blue', lwd = 1, fullrange = T) +
  theme_minimal() + 
  # This part makes the little red line
  geom_segment(aes(x = 0, y = 0, xend = 0, 
                   yend = mod$coef[1]), color = 'red')

## End of file