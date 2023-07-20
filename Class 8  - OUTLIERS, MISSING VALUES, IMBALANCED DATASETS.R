#####         DEALING WITH THE OUTLIERS  ########
# any value or obs which is far away from the other observations is outliers
# There is diff between error and oulier:
# Why 275 in age(person in years) column is error?
# -> Because we know that no one has lived till 275 (value not valid for the range)

# How do we find an outlier in R
# WE find it using
# 1. Boxplot method. (most common)
#2.

boxplot(iris[1:4])

summary(iris$Sepal.Width)

q1 = summary(iris$Sepal.Width)["1st Qu."]
q3 = summary(iris$Sepal.Width)["3rd Qu."]
q3


iqr = IQR(iris$Sepal.Width) # IQR = Q3 - Q1 where q3 and q1 are median of values above & below median resp.
iqr

lw = 2.800 - (1.5*iqr) # q1  - (1.5 *iqr)
lw
uw = 3.300 + (1.5 * iqr) # q1  - (1.5 *iqr)
print(uw)


subset(iris, iris$Sepal.Width < lw)
subset(iris, iris$Sepal.Width > uw)

# from the above 2 statements we get the outlier in the data

# 2 strategies top deal with outlier values
# ignore / Delete the oulier data rows and do the analysis

# Dont remove the outliers, create one more column and mention which are the record which are the outlier values
# name the column isOutlier and put values and yes and no in that column

# The choice of removeing outliers depends on ceircumstances:
# GEt OUTLIER VALUES

outliers = boxplot(iris$Sepal.Width)$out
ouliers

# Find out record numbers where the records with outliers exist
outliers_index  = which(iris$Sepal.Width %in% outliers) # which Index are the iris$Sepal WIdth which have outlier values.

# Create new iris data set with no outlier values
new_iris =  iris[-outliers_index,]
boxplot(new_iris)


##################################
set.seed(3147) # used to generate same random numbers again and again.
sample(3:10,5)  # Genearte a random aara from 3 to 10 , and size = 5 (5 items )

rnorm(100) # Random numbers from standard normal distribution
hist(rnorm(100))

rnorm(10,75,5)
#Generate 10 random numbers in normal dist, whose mean is 75 and sd is 5

set.seed(3147)
x = rnorm(100)
y = rnorm(100)

data_frame = data.frame(x,y)
data_frame
dim(data_frame)

# check if ouliers in x and y
boxplot(data_frame)
# we see outier in x (1 bubble)
# we see oulier in y (3 bubbles, 2 above uw and 1 below lw)
# Find out records with outliers in x
outliers_x = boxplot(data_frame$x)$out
outliers_y = boxplot(data_frame$y)$out
outliers_x
outliers_y

x_index = which(data_frame$x %in% outliers_x)
y_index = which(data_frame$y %in% outliers_y)
x_index
y_index

all_out = union(x_index,y_index) # Get all the ouliers (i,e oulioers in all the columns)
new_df = data_frame[-all_out,]
boxplot(new_df) # ther is an outlier, but now we dont remove it.
# TO check if really there is outlier in the new_data frame, make a scatter plot.
plot(new_df$x, new_df$y)

#Identify oulier values in data frame original random wala
points(data_frame[all_out,], col = "red", pch="+",cex= 2)
data_frame

