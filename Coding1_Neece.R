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
  surface=  c(42, 47, 39), 
  mid = c(19, 30, 22),
  bottom = c(7, 11, 8)) # creating the matrix

mean(chlorophyll_df$surface);  mean(chlorophyll_df$mid); mean(chlorophyll_df$bottom)
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


# -------------------------------------------------------
## Part 4: For Loops

for (i in 1:10){
  print(i^2)
} #loop that prints the square of 1 to 10

pop<- NULL #creating an empty object to store each 
# N_t 
for (t in 1:10){ 
  N_0 = 10
  r = 0.3
  N_t = N_0 * exp(r*t) #filling with the N_t value 
  # at that time t
  
  pop = rbind(pop, N_t) #binding the results into
  # a vector
  
  N_t = NULL #clearing out the temporary object so
  # I can reuse it for the next iteration
  }


phosphorus <- list(Lake1 = c(9, 24, 37, 26),
                Lake2 = c(47, 49, 32, 11), 
                Lake3 = c(14, 29, 17, 33), 
                Lake4 = c(20, 16, 31, 43), 
                Lake5 = c(7, 36, 27, 40))

lake_means <- NULL #making empty vector to stor means in
for (i in 1:length(phosphorus)) {
  mean_P.mgL = mean(phosphorus[[i]]) #calculating means
  lake_means = rbind(lake_means, mean_P.mgL) #creating vector of 
  #all means
  print(paste("Lake", i, "mean phosphorus =", mean_P.mgL, "ug/L"))
  #pasting statement
  
  mean_P.mgL = NULL #emptying this object so I can fill it 
  # with the next iteration
}

row.names(lake_means)<- NULL #removing row names for easier reading
lake_means #final vector of means

# ----------------------------------------------------------
#Part 5: Apply Functions

apply(chlorophyll_df, 2, mean) #mean chlorophyll concentration
# for each depth
apply(chlorophyll_df, 1, mean) #mean chlorophyll concentration 
# for each day

apply(lakes[,2:4], 2, function(x) max(x)-min(x)) #lake ranges 

sapply(c(1:10), 
       function(t) N_t = 10 * exp(0.3*t)) #calculating population
#growth
## I prefer the for loop for this calculation, because it is easier
## for me to follow. 
