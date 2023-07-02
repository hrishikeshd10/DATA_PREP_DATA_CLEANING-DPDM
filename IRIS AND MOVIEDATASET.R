################################################################################################################################################################
##############     I R I S -  is a pre installed data set in R

iris #pre-installed data set in R
View(iris) # Opens the data set in a tablualr form in a new Window
help(iris) #Gives info in the help tab
summary(iris) #Summary, returns mean, median, 1st quartile, 3rd quartile, min, max, etc.
str(iris) #structure of the data - datatypes, etc.
head(iris)
unique(iris$Species) #returns the unique values in species column of iris dataframe
table(iris$Species) #returns the number/frequency of unique values
gender=c("m","f","m","m")
table(gender)#Another example for table
subset(iris,Species=="setosa") #display all rows where column 'Species' = 'setosa'
nrow(subset(iris,Species=="setosa")) #nrow to get the count
dim(subset(iris,Species=="setosa")) #dimension - no. of rows & columns
dim(subset(iris,Species=="setosa"))[1] #dimension but only no. of rows
range(iris$Sepal.Length) #Range of values in Sepal.Length
nrow(subset(iris,Sepal.Length>5.0)) #no. of rows where sepal length > 5
subset(iris,Sepal.Length>5.0 & Sepal.Width<4.0)
nrow(subset(iris,Sepal.Length>5.0 & Sepal.Width<4.0)) #no. of rows with an additional condition using & operator

nrow(subset(iris,Sepal.Length>5.0 & Sepal.Width<4.0 & Species == "setosa")) #3 conditions

subset(iris,Sepal.Length>5.0 & Sepal.Width<4.0 & Species == "setosa",select=c(1,2,5)) #only 1st,2nd and 5th row
subset(iris,Sepal.Length>5.0 & Sepal.Width<4.0 & Species == "setosa",select=c("Sepal.Length","Sepal.Width","Species"))
#It is always better to use the column names while retrieving data, 
#instead of just specifying index numbers.

mean(iris$Sepal.Length)
summary(iris)


mean(iris[1])

iris[1] #returns a dataframe

iris$Sepal.Length #returns a vector

for(i in c(1,2,3,4)) #for loop for returning mean values of each column
{
  print(mean(iris[,i]))
}

colMeans(iris[1:4]) #returns means of each column

rowMeans(iris[1:4]) #returns means of each row

colMeans(iris[-c(5)]) #returns means of each column,except for 5 -c(5)
colMeans(iris[-c(1,3,5)])

############.  Working with Datasets.  ####################

mdata=read.csv("/Users/hrishi445/Desktop/ACADEMICS/R - PRogramming Data-prep-anad-cleaning/moviedata.csv", header = F) #header = F.. there is no header
mdata
head(mdata)
colnames(mdata)=c("Movie_no","Movie_Name","Release_Year","Movie_Rating","Duration_in_Seconds")
head(mdata)
subset(mdata,Release_Year>=1950 & Release_Year<=1960) #released between 1950 and 1960
nrow(subset(mdata,Release_Year>=1950 & Release_Year<=1960)) #number of rows for the above
nrow(subset(mdata,Movie_Rating>4)) #number of rows for rating >4
nrow(subset(mdata,Movie_Rating>=3 & Movie_Rating<=4)) #number of rows, where movie rating is between 3 and 4
nrow(subset(mdata,Duration_in_Seconds>7200)) #number of rows, where movie duration in seconds is >7200 / 2 hours
mdata$Duration_in_Hours=mdata$Duration_in_Seconds/3600 #creating a new column for Duration in hours

table(mdata$Release_Year) # Frequency table of the column value 
movie_df_new=as.data.frame(table(mdata$Release_Year))
head(movie_df_new)
max(movie_df_new$Freq)
subset(movie_df_new,Freq==max(movie_df_new$Freq))
subset (movie_df_new, Var1 == 1914)

weight=c(23,42,53,12,75,24,65)
sort(weight)
weight
sort(weight,decreasing=T)
order(weight) # Index of values that are ranked from 1 to x, when Array looks in a sorted form
weight
weight[order(weight)] # Sorting the array using order method on a vector

#Maximum movies released in an year
year_wise_movies = table(mdata$Release_Year)
year_wise_movies = as.data.frame(year_wise_movies)
class(year_wise_movies)
year_wise_movies
max_movies = subset(year_wise_movies, Freq == max(year_wise_movies$Freq))
max_movies

#SORT DATA FRASM ACCORDING TO PRIORITIES OF COLUMNS
sorted_output = year_wise_movies[order(year_wise_movies$Var1),] # DO NOT FORGET THE COMMA, as it gives the number of coluk=mns you want to display

sorted_output


