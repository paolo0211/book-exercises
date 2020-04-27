# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!
names <- read.csv("data/female_names.csv", stringsAsFactors = FALSE)

# Create a data frame `names_2013` that contains only the rows for the year 2013
names_2013 <- names[names$year == 2013,]

# What was the most popular female name in 2013?
most_popular_name <- names_2013[names_2013$prop == max(names_2013$prop), "name"]

# Write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year
most_popular_in_year <- function(year){
  year_df <- names[names$year == year,] 
  result <- year_df[year_df$prop == max(year_df$prop), "name"]
  return(result)
}

# What was the most popular female name in 1994?
name_1994 <- most_popular_in_year(1994)

# Write a function `number_in_million` that takes in a name and a year, and 
# returns statistically how many babies out of 1 million born that year have 
# that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.
number_in_million <- function(name, year){
  year_df <- names[names$year == year,]
  result <- year_df[year_df$name == name, "prop"]
  return(1000000*result)
}

# How many babies out of 1 million had the name 'Laura' in 1995?
laura_1995 <- number_in_million("Laura", 1995)

# How many babies out of 1 million had your name in the year you were born?
paolo_2000 <- number_in_million("Paolo", 2000)

## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
