file_pasth_base = "/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/datasets_class7/"

###########################             JOINS IN TABLES (SQL)         ###################################

# JOIN / EQUIJOIN / INNER JOIN => Extracts common information between two table based on a common column_names
    # if there is no value for a key in the right table for a key in left table, the record is not considered in the record.

# LEfT Outer => All records from left side table and fetch corresponding info from right table
      # if there is no value for a key in the left table, the opuput has the record from the left table, and NA in corresponding table 

# RIGHT OUTER JOIN => all the records from right table and corresponding values from left table based on a common key
  # if no infor from left table, values in the column that come from left table are name_column

# FULL OUTER JOIN => Fetch all the records from both the tables, and NA wherever the values are missing.


###########################################################################################################


file_path_data1 = paste(file_pasth_base,"data1.csv",sep="")
file_path_data2 = paste(file_pasth_base,"data2.csv",sep="")
file_path_data3 = paste(file_pasth_base,"data3.csv",sep="")
file_path_data4 = paste(file_pasth_base,"data4.csv",sep="")



data1 = read.csv(file_path_data1)
data2 =read.csv(file_path_data2)
data3 =read.csv(file_path_data3)
data4 =read.csv(file_path_data4)

# data1
# data2
# data3
# data4

rbind_13 = rbind(data1,data3) # Stack data on top of one another
rbind_13

cbind_14 = cbind(data1,data4) # join horizontally
cbind_14


inner_join = merge(data1, data2) # PERFORM INNER JOIN ON COMMON COLUMN, the croatia column is excluded as it is not in the data2
merged_data12

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
sdata = sqrt(trees$Volume)
sdata
hist(sdata)
# hEre, we chcecked using hist to see if data followed normal distribution or not. It does not., So we use another method

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
hist(1/x)


