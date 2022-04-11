## Started: April 03, 2022
## Due: April 11, 2022
## STA 308 Homework 3 Assignment
## Author: Bailey Burdick

## The purpose of this assignment is to create functions 
##    that determine test grades
## These test grades are based off of the person's mood earlier that day.
## If you are in a good mood, you have a 80% chance of getting 
##    an 100 and a 20% chance of getting a 75.
##If you are in a bad mood, you have a 20% chance of getting an 100%, 
##    a 30% chance of getting a 75%, and a 50% chance of getting a 50%.

## Number 1
takeOneTest <- function(probGood = .6, probBad = .4){
 my_mood <-sample(c("good", "bad"),
         size = 1,
         prob = c(probGood, probBad))
  
  if (my_mood == "good") {
    sample(c(100, 75),
           size = 1,
           prob = c(.8,.2)) }
    
    else{
      sample(c(100, 75, 50),
             size = 1,
             prob = c(.2,.3, .5))
  }
}
# This code is creating the takeOneTest function with the probability of earning
#   the test score for the mood.
  

## Number 2 
SemesterGrades<- function(num_tests=1) {
  multipleTests <- c()
  for (i in 1:num_tests) {
    multipleTests <-c(multipleTests, takeOneTest() )
  }
  (multipleTests)
  }
SemesterGrades(6)

# This code is creating the SemesterGrades function. 
# The goal of this function is to run the takeOneTest function for n=num_tests.


##Number 3
# For 12 tests
meanSemesterGrades<- function(num_tests=1) {
  multipleTests <- c()
  for (i in 1:num_tests) {
    multipleTests <-c(multipleTests, takeOneTest() )
  }
mean(multipleTests)
}
## here I am finding the mean of semester grades for the num_tests

sample_tests_12 <- c()
for (i in 1:10000) {
  sample_tests_12<- c(sample_tests_12, 
                      meanSemesterGrades(num_tests = 12))
}
mean(sample_tests_12)
summary(sample_tests_12)
hist(sample_tests_12)

# For 3 tests
sample_tests_3 <- c()
for (i in 1:10000) {
  sample_tests_3<- c(sample_tests_3, 
                      SemesterGrades(num_tests = 3))
}
summary(sample_tests_3)
hist(sample_tests_3)
## In this code I am making the code for 12 tests and three tests. 
##  I am them creating a summary and histogram so I can compare the two.


## Based on the summaries of 12 tests and 3 tests, I would choose to have 12 tests for the semester.
##    This is because the mean and medians are both similar (mean of 84.10 and median of 83.33 for 3 
##    and mean of 84.05 and median of 83.33 for 12).
##    Additionally, the minimum and 1st quartile for 12 tests is higher (minimum of 60.50 and 1st quartile of 81.25).
##    Although the 3rd quartile is higher for 3 tests, it is better to air on the lower side of grades.
##    The histogram for 3 tests is a little more left skewed, but it has more lower grades overall than 12 tests does. 


