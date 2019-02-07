## Data Transformation

library(nycflights13)
library(tidyverse)

###### 5.1.2 nycflights13

flights

# flights is a tibble
# Tibbles are dataframes that are slightly tweaked
# to work better in tidyverse

###### 5.1.3 dplyr basics


# 5 key dplyr functions

# 1.    filter() : picks observations by their values
# 2.   arrange() : reorders the rows
# 3.    select() : picks variables by their names
# 4.    mutate() : creates new variables with functions of existing variables
# 5. summarise() : collapses many values downt to a single summmary

##### 5.2 filter rows with filter()

# first argument is name of the data frame
# second and subsequent arguments are the expressions that filter the dataframe

filter(flights, month == 1, day == 1)

# to save the result use the assignment operator " <- " 

jan1 <- filter(flights, month == 1, day == 1)

# to save variable and print result surround in ()
(dec25 <- filter(flights, month == 12, day ==25))

##### 5.2.1 Comparisons

# common problem using " == " operator: floating point numbers

sqrt(2) ^ 2 == 1
1/49 * 49  == 1 

# to fix the isssue use the "near()" function

near(sqrt(2) ^ 2, 2)
near(1 / 49 * 49, 1)

##### 5.2.2 Logical Operators 

# the following code finds all the flights that departed in november or december

filter(flights, month == 11, month == 12)

nov_dec <- filter(flights, month %in% c(11,12))

# Sometimes you can simplify complicated subsetting by remembering De Morgan’s law: 
# !(x & y) is the same as !x | !y, and !(x | y) is the same as !x & !y

#if you wanted to find flights that weren’t delayed (on arrival or departure) by more than two hours, 
#you could use either of the following two filters:

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay > 120, dep_delay > 120)

##### 5.2.3 Missing values 

NA > 5
10 == NA
NA == NA

x = NA
is.na(x)

# filter automatically excludes NA's
# if you want to see them you must ask explicitly
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

##### 5.2.4 Exercises

#1 Find all flights that
  #1 Had an arrival delay of two or more hours

filter(flights, arr_delay >= 2)

  #2 Flew to Houston (IAH or HOU)

filter(flights, dest %in% c("IAH","HOU"))

  #3 Were operate by United, American, or Delta

filter(flights, carrier %in% c("UA", "AA", "DL"))

  #4 Departed in summer (july, August, September)

filter(flights, month %in% c(7,8,9))

  #5 Arrived more than two hours late, but didn't leave late

filter(flights, arr_delay >2, dep_delay <= 0)

  #6 Were delayed by at least an hour, but made up over 30 minutes in flight

filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)

  #7 Departed beteen midnight and 6 am (inclusive)

filter(flights, dep_time <= 600 | dep_time == 2400)

#2 Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?

filter(flights, between(month, 7, 9))

#3 How many variables have a missing dep_time 
# arrival time is also NA
# these are cancelled flights
filter(flights, is.na(dep_time))

##### 5.3 Arrange row with arrange() 

arrange(flights, year, month, day)

# use desc() to re-order by a column in descending order

arrange(flights, desc(dep_delay))

# Missing values are always sorted at the end

df <- tibble(x = c(5,2, NA))
arrange(df, x)

arrange(df, desc(x))  


##### 5.3.1 Exercises

#1 How to use arrange to sort all missing values at the start
arrange(flights, desc(is.na(dep_time)), dep_time)

#2 
arrange(flights, desc(dep_delay))

#3 
arrange(flights, (dep_time - arr_time))

#4 
arrange(flights, distance)

##### 5.4 select coluns with select() 


