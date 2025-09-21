## Author: Jillian Neece
## Zoo800 Week 3 HW: Coding1

## Submitted as an individual assignment because I 
## was gone for field work during class

#loading packages
library(dplyr)

## -----------------------------------------------
## Part 1: Basic Syntax and Variables
temp_C <- 18.5 #assigning value to a variable

temp_F <- (temp_C* 9/5)+32 #creating new variable based on existing variable

paste("The water temperature is ", 
      temp_C, 
      " °C (",
      temp_F, 
      " °F)", 
      sep= "") #pasting the sentence


## -----------------------------------------------
## Part 2: Vectors and Arrays
species_counts <- c(Bluegill = 23, 
                    Bass = 7,
                    Sunfish = 21,
                    Carp = 3) #creating a named vector

sum(species_counts) #finding total number of fish

max(species_counts) #finding the highest count value
names(species_counts)[species_counts== 23] #finding which 
# species name corresponds to that value

chlorophyll_df <- data.frame(
  day = c(rep(1, 3), rep(2,3), rep(3,3)),
  depth = rep(c("surface", "mid", "bottom"), 3), 
  chlorophyll.ugL = c(42, 19, 7, 
                      47, 30, 11,
                      39, 22, 8)
) # creating the matrix

chlorophyll_df %>% 
  group_by(depth) %>% 
  summarize(average.chlorophyll = mean(chlorophyll.ugL))
# calculating that average chlorophyll concentration at each 
# depth across days


## -----------------------------------------------
## Part 3: Data Frames

lakes <- data.frame(
  Lake = c("Mendota", "Wingra", "Monona", "Waubesa", "Kegonsa"), 
  Temp_C = c(22.4, 25.1, 23.7, 24.6, 26.0),
  DO_mgL = c(8.3, 6.7, 7.5, 7.9, 6.2)
) #creating data frame

lakes %>% 
  summarise(mean.Temp_F = mean(Temp_C), 
            mean.DO_mgL = mean(DO_mgL)) #calculating mean 
# temp and DO across all lakes

lakes$Temp_F <- (lakes$Temp_C* 9/5)+32 #adding Temp in F as
# a column
lakes #checking that the column was added
