####
## Lab 02 - POLI 30 D
####

# You just installed your R and R Studio. Now, let's take it for a spin!

## Calculations
20+5 # To send it to the Console, run the line using CMD + Return (or CTRL + Enter)

## Objects
# To create objects use the following syntax: obj_name <- obj_content
# For example
twentyfive <- 25
twentyfive 

# Or for a text
class <- "POLI30D"
class

# Under quotation marks, you can place strings (character vectors)
# It doesn't matter if you use single or double quotations:
class2 <- 'POLI30'
class2

# both should work, provided you open and close with the same mark.

## Errors
# When we start programming, we make a lot of mistakes. It is part of the process.
# To check one example of an error:
class <- POLI30D

# And it should tell you that there is no object with this name.

## Environment: You can see the objects loaded in the memory at the top-right.

## Overwrite
# If you save data with the same name as an object in the memory, it rewrites it:
class <- "data analysis" 
class

## Case Sensitive
# Note that R is case-sensitive. Meaning:
class # exists
Class # does not exist...

## Functions: do things with the objects that we assign
sqrt(25) # Takes the square-root of 25 and displays the resulting value

# Or:
x <- 2
sqrt(x) # Square-root of 2

# There are many useful functions! We will see many of them!

# If you have any questions, please reach out!

####
## End of Lab 02
####