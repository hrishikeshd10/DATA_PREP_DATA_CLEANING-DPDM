
###########################             JOINS IN TABLES (SQL)         ###################################

# JOIN / EQUIJOIN / INNER JOIN => Extracts common information between two table based on a common column_names
    # if there is no value for a key in the right table for a key in left table, the record is not considered in the record.

# LEfT Outer => All records from left side table and fetch corresponding info from right table
      # if there is no value for a key in the left table, the opuput has the record from the left table, and NA in corresponding table 

# RIGHT OUTER JOIN => all the records from right table and corresponding values from left table based on a common key
  # if no infor from left table, values in the column that come from left table are name_column

# FULL OUTER JOIN => Fetch all the records from both the tables, and NA wherever the values are missing.


###########################################################################################################
file_pasth_base = "/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/datasets_class7/"


file_path_data1 = paste(file_pasth_base,"data1.csv",sep="")
file_path_data2 = paste(file_pasth_base,"data2.csv",sep="")
file_path_data3 = paste(file_pasth_base,"data3.csv",sep="")
file_path_data4 = paste(file_pasth_base,"data4.csv",sep="")



data1 = read.csv(file_path_data1)
data2 =read.csv(file_path_data2)
data3 =read.csv(file_path_data3)
data4 =read.csv(file_path_data4)

data1
data2

data3
data4

rbind_13 = rbind(data1,data3) # Stack data on top of one another
rbind_13

cbind_14 = cbind(data1,data4) # join horizontally
cbind_14


inner_join = merge(data1, data2)
inner_join
# PERFORM INNER JOIN ON COMMON COLUMN, the croatia column is excluded as it is not in the data2

left_join = merge(data1, data2, all.x =T) # x here means left table and y means Right table
left_join

right_join = merge(data1, data2, all.y = T) 
right_join

full_outer_join = merge(data1, data2, all.x= T, all.y = T) # write all.x and all.y = T for full outer Join
full_outer_join


####################################################################################################################################
data2
colnames(data2)[1] = "My Country"
colnames(data2)
data2
# NOW JOIN DATA 1 and Data 2

inner_join_new= merge(data1, data2)
inner_join_new 
# WE observe that the new column gets added and thte inner join did not perform as we wanted
# TO DO SO, we mention the column name in the merge comamnd like so:

inner_join_new = merge(data1, data2, by.x = "country", by.y = "My Country")
inner_join_new



# What is fundamental principle of standard normal distribution? =>
# mean median mode is same
# we get bell shaped curve
# 68 - 98% observations lie around center

# POSITIVE (RIGHT SKEWED):
#   Mean > median >mode

########################################## CHECK IF THE DATA HS NORMAL DISTRBUTION OR NOT #################################

# We check if the data has normal distribution using 3 ways -> Histogram,  wuantile Plot and SHAPIRO TEST.
# 
# 1. HISTOGRAM

hist(iris$Sepal.Length, probability = T)
# To Add the curve on the histogram, write the following line
curve(dnorm(x,mean =mean(iris$Sepal.Length), sd = sd(iris$Sepal.Length)), add = T)
# Usually not followed as looking at histogram we cannot surely say that the data follows normal distribution.

# 2. Quantile Plot

qqnorm(iris$Sepal.Length) #qq means.  quantile-quantile plots
qqline(iris$Sepal.Length)
# Quantile gives the PERCENTILE value.
# We expect that all the points fall on the line, then we say that it is a perfect normal distribution curve
# From the above data plot, we conclude that the data does not follow a normal distribution


############################################################################################################################################

# 3. SHAPIRO TEST

# NULL HYPOTHESIS = distribution of data is not significantly different from the normal distribution
# ALTERNATE = data does no follow normal distribution

shapiro.test(iris$Sepal.Length)

shapiro.test(trees$Volume) # TRees is the inbuilt dataset in R
# here p<0.05 so we accept alternate hypothesis that data does not follow normal distribution 







##########################################################################################################################################################################
#                                         DATA TRANSFORMATION TECHNIQUES
####################################################################################################################################################################################
# if some of the machine learning algo req the data to follow the normal distribution, then 
# we use data transformation techniques to make the data follow Normal Distribution

# we know that tree$volume is skewed data, So we transform it to a normal one.

# 1. Square Root transformaion method
data = trees$Volume
hist(data)
#NORMALISED DATA USING SQRT TRASFORMATION METHOD
sdata = sqrt(trees$Volume)
sdata
hist(sdata)
# hEre, we chcecked using hist to see if data followed normal distribution or not.
# However, It does not., So we use another method

# 2. Log Transformation technique
hist(log(trees$Volume))
# here, from the graph, we see that the data follows normal distribution.


#NOTE:
# Positively Skewed to NORMAL
#   1. Square root transformation
#   2. Log Transformation
#   
# NegativeLy Skewed Data:
#   Power transformation method

# THERE IS NO SUREITY THAT SQRT OR LOG transformation always work. W have to figure out 

# POWER TRANSFORMATION NEVER WORKS ON THE Positively Skewed Data.
# Create a negatively skewed data
skewed_vector <- c(10, 12, 14, 15, 16, 16, 18, 20, 22, 25, 30, 40, 50)
hist(skewed_vector,probability = T)

hist(sqrt(x))
hist(log(x))
hist(x^2,probability = T) # This is power transformation method
curve(dnorm(x,mean=mean(x),sd = sd(x)),all = T)


# USUALLY, inverse Transformation is used to turn. +vely skewed to negatively Skewed Distribution
  # It is not laways true though
x= trees$Volume

hist(x,probability = T)

curve(dnorm(x,mean=mean(x),sd = sd(x)),all = T)

hist(1/x)
curve(dnorm(1/x, mean = mean(x),sd = sd(x)), all = T)

# Exam - Question : What are different techniques that are used for NORMALISATION?
# Standardisation -> Zscore Transformation - > (x-mu) / sd(x)
# Min-max transformation -> x - min(x) / max(x) - Min(x)    ; The denominator is called as range
# Decimal Scaling = x / 10^n  Where n= no of digits in max value of x

# WHY THERE IS NEED OF NORMALISATION?

name = c("a",'b','c','d','e')
height = c(170,167,168,160,172)
weight = c(65,64,67,25,67)
salary = c(34000, 23000,63000,33000,23500)

data = data.frame(name, height, weight, salary)
data

# Find the distance between the two points a and b
# 1. Manhattan distance between a and b => | x2- x1 | + | y2-y1 |
man_distance_ab = sum(abs(data[1,2:4] - data[2,2:4]))
man_distance_ac = sum(abs(data[1,2:4] - data[3,2:4]))
man_distance_ad = sum(abs(data[1,2:4] - data[4,2:4]))
man_distance_ae = sum(abs(data[1,2:4] - data[5,2:4]))
man_distance_ab
man_distance_ac
man_distance_ad
man_distance_ae


dist(new_data) # this calculated distance using Euclidian method
dist(new_data,2:4, method = "manhattan") # this calculated distance using manhattan method


# By looking at the values, we thought that e i closer to a, but on calcualting
# the manhattan distance we find that d is more closer to a
#
# Heighest weightage to salary column , then height and then weight as thery are measured
# in 5,3 and 2 digits respectively

# Correct way to write above statements
for (i in 2:5){

  print(paste("a to ", data[i,1] ))
  print(sum(abs(data[1,2:4] - data[i,2:4])))
}

######### SAME TRANSFORMATION SHOULD BE APPLIED ON ALL THE COLUMNS OF THE DATA

#   QUESTION: WHY IS SCALING THE DATA IMPORTANT
#     1. Scaling the data brings all variables to a common scale,
#        making it easier to compare and understand their relative importance and impact.
#
#     2.  Many machine learning algorithms use distance-based calculations. Variables with larger scales can dominate
#         the learning process, leading to biased models. Scaling ensures that all variables contribute equally to the
#         analysis, preventing any one variable from overpowering the others.
#
#     3. When plotting data, having different scales can distort the visual representation. Scaling the data ensures that
#        the plots accurately reflect the relationships and patterns in the data.

############################## Z SCORE TRANSFORMATION ##############################
# Z = (x - μ) / σ  : x = each value , μ = Mean, σ = SD
(iris$Sepal.Length -mean(iris$Sepal.Length) )/ sd(iris$Sepal.Length)



############################## THIS IS MIN-MAX TRANSFORMATION ########################

# MIN-MAX TRANSFORMATION => (x - min(column)) / { max(colum) - min(column)}


new_data = data.frame() # this shalll create error ar line 213 ads new_data[,j] does not exist
new_data = data
new_data

for(j in  2:4){
new_data[,j] = (data[,j] - min(data[,j])) / (max(data[,j]) - min(data[,j]))
  print(data[,j])
}
new_data

scale(data[,2:4])
#  using this method, you cannot get ONLY table of scaled values, you get center etc

#Instead you can foolow line255 on how to do it if yo uneed only tabulated data for scaled values.
scaled_data <- data
scaled_data[, 2:4] <- scale(data[, 2:4])

mean(scaled_data[,2])
sd(scaled_data[,2])

# Observe that mean of scaled values of a column are o (tend to 0)
# Also , The SD for the column of scaled values of the column is 1.

#That is what scaling does.


for( iu in 2:5){
  print(sum(abs(new_data[1,2:4] - new_data[2,2:4])))
}



######################### Decimal TRANSFORMATION  #############################
# Decimal Scaling = x / 10^n  Where n= no of digits in max value of x

max_value = max(iris$Sepal.Length)

n = nchar(max(floor(iris$Sepal.Length)))
decimal_sacaled_iris_values = iris$Sepal.Length / (10 ^ n)
decimal_sacaled_iris_values


#############################################################################

#
# After Z-Score transformation,  The scaled values will be in the range of -3 to + 3
# After MIn-Max transformation, The scaled values will be in the range of -1 to +1
# After Decimal Transformation,  The scaled values will be in the range of 0-1


age = c(12,13,14,15,19,20,23,24,40,45,46)
# you donto want to treat this a numeric , convert it to categorical to nominal.

# Define the age intervals for categorization
# Implicit breaks: R decides the breaks
age_category <- cut(age, 3, labels = c("Child", "Teenage", "Adult"))
# Exclusively introduce breaks
age_intervals <- c(0, 12, 18, 25, 50, 100)
age_category <- cut(age, breaks = age_intervals, labels = c("Child", "Teenage", "Adult"))

# View the transformed categorical variable
age_category

for(i in 1:length(age)){
  print(paste(age[i] , age_category[i]))
}

