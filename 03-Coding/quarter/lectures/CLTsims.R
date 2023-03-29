## POLI 30 D
## Central Limit Theorem -- Illustration
## Based on DSS Materials

## Loading required library
library(tidyverse)

# The previous US elections had 155,507,476 voters for 
# both tickets.
#     1. Biden: 81,283,501
#     2. Trump: 74,223,975

# This line creates the "population", a vector of
# 81,283,501 ones (Biden voters) and 74,223,975
# zeros (Trump voters). The statistic is Biden votes.
# If we were looking at Trump voters, we would do
# the reverse.

# Be careful: if your computer is old, it is going to 
# take a while to get this done.

# Vote for Biden
us_biden_voters <- c(rep(1, 81283501), rep(0, 74223975))

# The true mean: the result of the election
mean(us_biden_voters) * 100
(1-mean(us_biden_voters)) * 100

# 52.3 percent voted for Biden while
# 47.7 percent voted for Trump

## 10 samples, each sample with 10 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 10 samples, each sample with 100 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 10 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 100 samples, each sample with 10 people:
means <- numeric()
for (i in 1:100) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 100 samples, each sample with 100 people:
means <- numeric()
for (i in 1:100) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 1000 samples, each sample with 100 people:
means <- numeric()
for (i in 1:1000) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 1000 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:1000) {
  spl <- sample(us_biden_voters, size = 1000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 10,000 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:10000) {
  spl <- sample(us_biden_voters, size = 1000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

## 10,000 samples, each sample with 10,000 people:
means <- numeric()
for (i in 1:10000) {
  spl <- sample(us_biden_voters, size = 10000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2) +
  xlim(0, 100)

#####
## Without upper and lower limits
####

## 10 samples, each sample with 10 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 10 samples, each sample with 100 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 10 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:10) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 100 samples, each sample with 10 people:
means <- numeric()
for (i in 1:100) {
  spl <- sample(us_biden_voters, size = 10)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 100 samples, each sample with 100 people:
means <- numeric()
for (i in 1:100) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 1000 samples, each sample with 100 people:
means <- numeric()
for (i in 1:1000) {
  spl <- sample(us_biden_voters, size = 100)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 1000 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:1000) {
  spl <- sample(us_biden_voters, size = 1000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 10,000 samples, each sample with 1000 people:
means <- numeric()
for (i in 1:10000) {
  spl <- sample(us_biden_voters, size = 1000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## 10,000 samples, each sample with 10,000 people:
means <- numeric()
for (i in 1:10000) {
  spl <- sample(us_biden_voters, size = 10000)
  means[i] <- mean(spl)
}
ggplot(mapping = aes(x = means * 100)) + 
  geom_histogram() +
  geom_vline(xintercept = mean(us_biden_voters) * 100, 
             color = 'red', lty = 3, lwd = 2)

## Conclusion

# Note that the values get closer and closer to 52.3%
# With samples of 1 million people, they are pretty much it.

# But also note that very small samples would have
# a high chance of predicting a Trump win.

## End of File