# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
grouped <- group_by(flights, month)
dep_delay_by_month <- grouped %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
month <- dep_delay_by_month %>%
  filter(mean == max(mean)) %>%
  pull(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
group_des <- group_by(flights, dest) 
highest_delay <- group_des %>%
  summarize(mean = mean(arr_delay, na.rm = TRUE)) %>%
  filter(mean == max(mean, na.rm = TRUE)) %>%
  pull(dest)

# You can look up these airports in the `airports` data frame!
cae <- filter(airports, faa == "CAE")

# Which city was flown to with the highest average speed?
highest_speed <- group_des %>%
  mutate(speed = distance / (air_time / 60)) %>%
  summarize(mean = mean(speed, na.rm = TRUE)) %>%
  filter(mean == max(mean, na.rm = TRUE) ) %>%
  pull(dest)
