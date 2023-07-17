######################### DEALING WITH MISSING VALUES  #########################

# While dealing with missing values there are 32 strategies to deal with the values:
# 1. Ignore the missing values and proceed with analysis
#     a) List wise Deletion / Complete case analysis Strategy - Delete all the rows where there are missing values.
#       Disadvantage => Due to this we aare losing a lot of information / ignoring lot of infomration
#
#     b) Pair wise Deletion - Just ignore the cell with NA value and go ahead with analysis
#        Disadvantage => Data inconsistency in the columns.
#                        There are some machine learing algos or statistical techniques, that dont allow us to enter
#                        such inputs with empty cells
#
#
# 2. Impute the missing values.

    # How do we impute rmissing values?
    #
    # STRATEGY 1
    #
    # => Replace values by taking MEAN / MEDIAN / MODE
    # if data follows normal dist, we replce by MEAN(column calues)
    # If data != Normal Distribution, i.e wheen data is skewed, we repalce by MEDIAN(column values)
    # If the variable is categorical, we replace NA value sin column using MODE(column values)
    #
    #
    # STRATEGY 2  - REPLACING MISSING VALUES BY STATIFIED MEAN

    # Divide the data into stratas / gategories base on a categorical variable and then calculate mean of each category
    # and then replace NA values and replace NA values as per the categorical mean values.
    #
    # STRATEGY 3 - Random sampling
    # Pick a random value from the sample and replace the value with it
    #
    # STRATEGY 4 - K N N - IMputation Method.

    # ('k' Nearest Neighbour technique) mostly k= 3 or 5 so that there is ease uing majority
    # Eg)  If k= 3, then we find 3 nearest neighbors of this. We find distance of all other records from  the missing value cell
    #     and then choose 3 out of them, Take MEAN( 3 nearest values ) and replace the NA values with it.
    #
    #     In case of categorical missing variable, we take distance, and check which 3 or 5 records are close to the missing record,
    #     We take the MODE(closest k categorical variable values) and assign it to the missing variable.

      # NOTE: WE TAKE DISTANCE OF THE RECORD WHERE THERE IS NA VALUE from the other records
      # If we have categorical values in the dataset, then we code the categories with numbers and then find the distance.


      # MULTIPLE IMPUTATION BY CHAIN EQUATION METHOD =>> Estimate multiple plausible values for a single missing values(3,4,5,etc)
      # and replace thae value.
      #
      # Why MUltiple imputation method?
      # => We cannot be absolutely sure that there is always one plausible value for the missing value.
      #
      # Why not to consider MULTIPLE IMPUTATION method?
      # => It is not feasible to use iton big data based datasets.
install.packages("mice")
library(mice)

# We use air quality data
air_data  = airquality
View(air_data)  #o pens the data in tablualr form
colSums(is.na(air_data)) # TOTAL no. of NA values in each column

complete.cases(air_data)  # returns true when record is complete and false even if one cell has NA value.
#it is like row indexes ka array, jiske against T ya f values hain

ocmplete_data = air_data[complete.cases(air_Data),] # returns air data where all the rows are filled with values
#Alternate moethod
subset(air_data, complete.cases(air_data) ==T)
sum(complete.cases(air_data)) # Gives the nubemr of records that have all the values
sum(!complete.cases(air_data)) # Give the number of records that have missin values

mean(air_data$Ozone, na.rm=T)
sd(air_data$Ozone,na.rm = T )

subset(air_data$Ozone, is.na(air_data$Ozone) == T)
air_data[is.na(air_data[,1]),1] # is>na wala code return the rows where there are na values in column 1 air_data{isna,1] will return

air_data[is.na(air_data[,1]),1] = mean(air_data$Ozone, na.rm=T)
air_data[is.na(airdata[,2]),2]=mean(air_data[,2], na.rm = T)

air_data=airquality
colSums(is.na(air_data))
for (i in 1:length(air_data)){
  air_data[is.na(air_data[,i]),i]=median(air_data[,i], na.rm = T)
} # Means ke jaha jaha jo jo columsn me NA values hain, waha hwaha us column ke mean values assign kar do.



## COmplete the code ifrom sir'(s code)'


# KNN REPEATATIONfacetie
install.packages("VIM")
library(VIM)
air_data = airquality
colSums(is.na(air_data))
air_data_1 = kNN(air_data)




