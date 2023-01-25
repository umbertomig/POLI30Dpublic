####
## Lab 03 - POLI 30 D
####

# Variables
x <- 20
y <- 'POLI 30 D'
print(x)
print(y)

# class of a variable
class(x)
class(y)

# Structure
str(x)
str(y)

# Create vectors
voted   <- c(1, 0, 0, 1) # Binary vector (1=yes; 0=no)
age     <- c(48, 23, 18, 33) # Numeric vector with ages
message <- c('yes', 'yes', 'no', 'no') # Got message?
place   <- c('La Jolla', 'Del Mar', 
             'Del Mar', 'Poway') # Character with places

# First person voted
voted[1]

# Sequence from 1:3
1:3

# First to third positions age
age[1:3]

# All but second person's message
message[-2]

# Place (entire thing)
place
  
# Change the position two of the age vector
age[2] <- 24
age

# ifelse with message
message
message_num <- 
  ifelse(message == 'yes', # Check if message is yes
         1, # change to 1 if yes
         0) # change to 0 if no
message_num
  
# Length of the vector
length(message)

# Remove `message_num`
rm(message_num)

# Create dataset
dat <- data.frame(
  v1 = c(1,2,3),
  v2 = c('a', 'b', 'c'),
  v3 = c('Treatment', 'Control', 'Control')
)
dat

# Create dataset
dat3 <- data.frame(voted, age, message, place)
dat3

## Loading a CSV dataset from GitHub

# Load dataset
countries <- read.csv('https://raw.githubusercontent.com/umbertomig/POLI30Dpublic/main/data/countries.csv')


## Exploring a dataset

# head and tail of the dataset
head(countries)
tail(countries)

# Structure
str(countries)

# Dataset dimensions
dim(countries)

# View
View(countries)

# Summary
summary(countries)

# See you in the next lab!

####
## End of Lab 03
####