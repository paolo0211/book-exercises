# Exercise 2: using `*apply()` functions

# Create a *list* of 10 random numbers. Use the `runif()` function to make a 
# vector of random numbers, then use `as.list()` to convert that to a list
ran_num <- runif(10,0,10)
ran_num <- as.list(ran_num)

# Use `lapply()` to apply the `round()` function to each number, rounding it to 
# the nearest 0.1 (one decimal place)
rounded <- lapply(ran_num, round)

# Create a variable 'sentence' that contains a sentence of text (something 
# longish). Make the sentence lowercase; you can use a function to help.
sentence <- "info201 is a tough class"

# Use the `strsplit()` function to split the sentence into a vector of letters.
# Hint: split on `""` to split every character
# Note: this will return a _list_ with 1 element (which is the vector of letters)
str_array <- strsplit(sentence,"")

# Extract the vector of letters from the resulting list
letters <- str_array[[1]]

# Use the `unique()` function to get a vector of unique letters
unique_letters <- unique(letters)

# Define a function `count_occurrences` that takes in two parameters: a letter 
# and a vector of letters. The function should return how many times that letter
# occurs in the provided vector.
# Hint: use a filter operation!
count_occurrences <- function(letter, vector){
  vector_of_same_letter <- vector[vector == letter] #vectorized operation
  result <- length(vector_of_same_letter)
  return(result)
}


# Call your `count_occurrences()` function to see how many times the letter 'e'
# is in your sentence.
count_occurrences("a", letters)


# Use `sapply()` to apply your `count_occurrences()` function to each unique 
# letter in the vector to determine their frequencies.
# Convert the result into a list (using `as.list()`).
count <- sapply(unique_letters, count_occurrences, letters)
frequencies <- as.list(count)


# Print the resulting list of frequencies
print(frequencies)


