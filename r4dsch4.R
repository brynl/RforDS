#4.1 Coding Basics

1/ 200 * 30 

(59 + 73 + 2) / 3

sin(pi/2)

x <- 3 *4 

#4.2 What's in a Name

this_is_a_really_long_name <- 2.5 

r_rocks <- 2^3 

#4.3 Calling Functions 

#function_name(arg1 = val1, arg2 = val2)

seq(1,10)

x <- "hello world"

(y <- seq(1,10, length.out = 5))

#4.4 Practice

#1
my_variable <- 10 
my_variable

#2
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) 

filter(mpg, cyl == 8) 
filter(diamonds, carat > 3)
