# Use cmd + Enter to run the lines

# Addition
45+90 
# Hit cmd + Enter to check the result of the same in the console.

# Subtraction
45-90

# Multiplication
5*4


# Division
13/3


# Integer Division 

13 %/% 3 

# Remainder or mod
13 %% 3

# SQUARE IN R
a^2

# SQUARE ROOT
sqrt(100)
#

# Find log to base e
log(20)
#LOg to the base 2
log2(20)

#Log to the base 10
log10(100)

#ANTILOGS
exp(2.997532)


# READING INPUT FROM USER
 my_name = readline(prompt = "Enter Your Name: ")
 print(my_name)
 
 # CREATE A SEQUENCE
 seq(20,28)
 
# Create n random values in a given range
 sample(-50:50, 10, replace = T)


 
#FUNCTIONS IN R
#<fun_name> = function(<params>){}
 
 


################################################################################################################################################################
# DATA TYPES IN R

a = 10
# check Data type of a variable
class(a)

b= 23.98
class(b)

#typeof() gives the accurate Data type

typeof(a)

# CHARACTERS / STRINGS IN R
name = "Hrishikesh"
class(name)
typeof(name)

# LOGICAL OR BOOLEAN IN R (TRUE or T / FALSE or F)
status = TRUE
class(status)


#CONTCATIONATION FUNCTION - paste()
name = "Hrishikesh Deshmukh"
weight_hrishikesh = 89
paste("Weight of ", name, " is ", weight_hrishikesh)

################################################################################

#                           DATA STRUCTURES IN R

# VECTORS -> One dimenson Array

# use function c() to create a vector or an array

vectors1 = 1:10
print(vectors1[c(3,5,7)]) #Prints the elements at positions 3, 5 and 7
vectors1[vectors1<5]
vectors1[vectors1>5 & vectors1<9] #Return values >5 and <9


weights = c(23,12,45,67,98,23,56,23,10)
weights
class(weights)
length(weights) # number of elements in array

sum((weights)) # sum of all the elements in the vector
mean(weights)  # Mean of all the elements in the vectors
sd(weights) # Standard Deviation of all the elements in  (By default it is sample SD) - Shows Dispersion in the data
var(weights) # find the variance of the elements in the vector

# Add value to each of the element in the vector
weights + 2


names = c("Hrishikesh Deshmukh", "Aditi Pathrabe", "Shantanu Vaidya")
names
class(names)


passfail = c(T, TRUE, F, FALSE)
class(passfail)

# Vectors can contain value of any Data Type
mix_vector = c(12,"Hrishikesh", 234.09, T)
mix_vector
# becausse of one Char value, system did the implicit conversion of the numeric
#values as well and hence class = Character
class(mix_vector) 



# Here, T can easily be reperesenteed bhy 0 or 1, hence implicitly converted to 
# numeric

mixv1 = c(1,2,3, T)
class(mixv1) 

# This proves thar numbers and booleancs can be converted to characters
mixv2 = c(1,2,3.4, "Hrishi", T)
class(mixv2)

#CREATE  a vector with character and numeric values and convert it to all numeric
marks = c(89,56,98,"78",34,100)
class(marks)
marks =as.numeric(marks)
class(marks)
as.numeric(marks)


#CREATE  a vector with character(alphabetic) and numeric values and convert it to all numeric
marks = c(89,56,98,"Hrishikesh",34,"Dinar",100)
class(marks)
marks =as.numeric(marks) # NA comes in place of Alphabets as it cannot convert it to numbers
class(marks)
as.numeric(marks)

mixv4 = c(89,56,98,T,34,"Dinar",100)
mixv4  = as.logical(mixv4)
class(mixv4)
mixv4

################################################################################################################################################################################################################################################

# MATRIX - A two dim array  = R creates Vectors Column wise adn not row wise
# Create this matrix
#| 10  20 |
#| 20  30 |

m1 = matrix(c(10,20,30,40),2)
m1

# Create matrix of 2x3
m1 = matrix(c(10,20,30,40,50), nrow = 2, ncol = 3)
m1

# IF  x*y values are not there, then after that matrix will repeat th sataring valus till x*y number is met

# MAKE MATRIX ROW WISE , USRE NROW
m1 = matrix(c(10,20,30,40),2,2,byrow = T)
m1

#nrow and ncol are the ndefault parameters in R with some default values

# Assign Names to the rows and columns, use "dimnames"

m1 = matrix(c(10,20,30,40),2,2,byrow = T,)
rownames(m1) = c('Row1', "Row2")
colnames(m1) = c("Col1","Col2")
colnames(m1)[2] = "col3"
m1

# Create 2 matrices 
m1 = matrix(c(1,2,3,4),2,2)
m1
m2 = matrix(c(10,20,30,40),2,2)
m2

m1 + m2
m1-m2
m1*m2 # NEVER EVER USE * FOR MATRIX MULTIPLICATION it is used for elementwise multiplication
# THIS IS CORRECT WAY TO MULTIPLY MATRICES
m1%*%m2

# Access Matrix Values
m1[1,2]

# CREATE A MATRIX FROM EXISTING VECTORS
v1 = c(1,2,3,4)
v2 = c(10,20,30,40)
v1
v2
#use cbind() function to create vectors column wise (column binding)
cbind(v1,v2)
# use rbind() function to create vectors row wise (row Binding)
rbind(v1,v2)

################################################################################################################################################################

#                       DATA FRAMES 

# Data Frame is must like a table in a database (Tabular form)
# IN real scenarios We NEVER create Data in R, R isa tool to read data from external resources and Process it.

#Create Data Frame - Create Emp table. -  data.frame()
empData = data.frame( )
empData
fix(empData)
empData
str(empData)
dim(empData) # dimensionsa, how many rows and columns
nrow(empData)
ncol(empData)
colnames(empData) # Get names of al the columns in the data frame
head(empData,3) # Get the top 3 rows
tail(empData,3) # Get the last 3 rows

mean(empData$empsal) # get the mean of empSAl Column in empData Table

# ALTERNATE WAY TO CREATE A DATA FRAME
empNo = c(11,12,13,14)
empNames = c("Shaily","Indraj","Aryan","Pramod")
empSalaries= c(100,200,300,400)
empData1 =data.frame(empNo,empNames,empSalaries)
empData1


# DIFF BETWEEN MATRIX AND DATA FRAME IS : in matrix data type shouldbe numeric only of each element
empData1[empData1$empSalaries >100,c(1:2)] # if nothing after comma, it means return all the rows
empData1[c(2:4 ),] # pickup all rows from  2 to 4 and return all the columns
empData1[c(2:4),c(1:2)] # pickup all rows from  2 to 4 and return first 2 columns
empData1[c(2,4),] # Return only 2nd and 4th row with all the column values

# Rename Column Name
colnames(empData1)[3] = "salary"
empData1

#Make a new column with nane "empNewColumn" by adding id and salary column values
empData1$empNewColumn = empData1$salary + empData1$empNo
empData1

################################################################################################################################################################

#                             LISTS

# A list can store Every thing in itself
weights = c(23,12,45,67,98,23,56,23,10)
empData
m1
  
# DUmp all these 3 in the list

myList = list(weights, empData,m1)
myList
myList[3]
# REMOVE THE index that gets printed [[1]], just put the index in [] like so"
myList[[3]]

# REFER ELEMENTS bY NAME in a List
#we can give names like so:
namedList = list(weighOfPerson = weights, myMatrix = m1, empDataFrame = empData)
namedList["empDataFrame"]







