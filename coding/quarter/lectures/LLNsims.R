## POLI 30 D
## Law of Large Numbers -- Illustration
## Based on DSS Materials

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

## 10-people samples
# Let us extract representative samples of 10 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 10)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## 100-people samples
# Let us extract representative samples of 100 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 100)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## 1,000-people samples
# Let us extract representative samples of 1,000 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 1000)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## 10,000-people samples
# Let us extract representative samples of 10,000 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 10000)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## 100,000-people samples

# Let us extract representative samples of 100,000 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 100000)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## 1,000,000-people samples

# Let us extract representative samples of 1,000,000 people.
# We will do 10 samples:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 1000000)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## How about samples of 10,000,000 people? You do it!

## 2,500-people samples
# 2,500 people samples tend to be a good trade-off between
# costs to run it and the precision of the estimates

# 10 samples of 2,500 people yields the following estimates:
for (i in 0:9) {
  spl <- sample(us_biden_voters, size = 2500)
  cat('Sample ', i, ' had ', round(mean(spl), digits = 3)*100, '% of Biden voters and ', round(1-mean(spl), digits = 3)*100, '% of Trump voters.\n')
}

## Conclusion

# Note that the values get closer and closer to 52.3%
# With samples of 1 million people, they are pretty much it.

# But also note that very small samples would have
# a high chance of predicting a Trump win.

## End of File