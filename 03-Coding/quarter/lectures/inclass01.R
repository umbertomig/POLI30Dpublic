## POLI 30 D
## In-Class Exercise 01
## Based on DSS Materials

# Does social pressure increase turnout? #

# Loading the data
voting <- read.csv("https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/voting.csv")

# Checking the data
head(voting)

# Trick to create a numeric treatment variable
voting$pressure <- # stores return values in new variable
  ifelse(voting$message=="yes", # logical test
         1, # return value if logical test is true
         0) # return value if logical test is false

# Checking the head again
head(voting)

# Average proportion of people that voted
mean(voting$voted)

# Average proportion of people that received the message
mean(voting$pressure)

# Average by groups
tapply(voting$voted, voting$pressure, mean)

# If you want, the tapply function works with the message variable
tapply(voting$voted, voting$message, mean)

# Average Treatment Effect (ATE)
mean(voting$voted[voting$pressure == 1]) - mean(voting$voted[voting$pressure == 0])

# Very cool, right?!

## End of file