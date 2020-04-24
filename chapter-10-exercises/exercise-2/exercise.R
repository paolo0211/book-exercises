# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employee <- paste("Employee", 1:100)


# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salary <- runif(100,40000,50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adjustment <- runif(100,-5000,10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employee, salary, salary_adjustment, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$adjusted_salary <- salary + salary_adjustment


# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raised <- adjusted_salary > salary



### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
employee_57 <- salaries$adjusted_salary[57]

# How many employees got a raise?
num_raised <- length(salaries$employee[salaries$raised])

# What was the dollar value of the highest raise?
highest_raise <- max(salary_adjustment)

# What was the "name" of the employee who received the highest raise?
name <- salaries[salaries$salary_adjustment == highest_raise, "employee"]

# What was the largest decrease in salaries between the two years?
highest_decrease <- min(salary_adjustment)

# What was the name of the employee who recieved largest decrease in salary?
name_decrease <- salaries[salaries$salary_adjustment == highest_decrease, "employee"]

# What was the average salary change?
average_change <- mean(salary_adjustment)

# For people who did not get a raise, how much money did they lose on average?
average_lose <- mean(salaries$salary_adjustment[salaries$salary_adjustment <= 0])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
#yes it is very close

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries", row.names = FALSE)
