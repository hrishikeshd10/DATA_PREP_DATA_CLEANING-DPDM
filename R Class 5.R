########################  HYPOTHESIS TESTING  ######################


# Hypothesis = assumption abt a thing and we validate it
# Hypothesis should be clear and testable
# Eg: avg salary of mba dsdsa students in placement is 10LPA
#   here, Population = DSDA Students
#         Now we validate using data collection, which will have 2 approaches
#         1. Collect data from ALL students -> this is called as CENSUS study.
#             Time and Cost is the major problems while doing Census Study.
#
#
#         2. Collect data from SOME SELECTED students. ->. this is called SAMPLE STUDY.
#             Sample is a SUBSET of a population and then draw inference
#             A SAMPLE SHOULD ALWAYS REPRESENT YOUR DATA, else IT WILL PRODUCE GARBAGE OUTPUT.
#             Eg: Testing the LED bulbs to infer about the warranty of the bulb
#                 Crass testing for cars


# IF We are doing Census study, we dont need hypothesis testing. We use only when we do sampling study and draw inference abt
# a population by studying the sample study.


# STEP 1 -  Define hYpothesis
# STEP 2- In order to test Hypothesis, define
#         a. NULL Hypothesis (no relation between the variables eg: no co-relation between the experience and salary offered)
#         b. ALTERNATE Hypothesis (some relation between the variables eg: some co-relation between the exp and salary)
#
#
# HOW TO DETERMINE THE RELATION BETWEEN TWO VARIABLES?
#   We can do this using concept of co-variance and Correlation (pearson adn spearman )


# CO-VARIANCE -> is Scale dependent measure (measuing height and weight in feet nad kgs , now change kgs to gms, then covariance changes)
# Co-RElation -> is Scale Independent measure (measuing height and weight in feet nad kgs , now change kgs to gms, then corelation DOES NOT changes)
# +ve corelation = as x increases y increase Eg: work ex and salary, ex increase, salary also increase
# -ve corelation = as x increases, y decreases Eg: Price rise, demands go down.
# NO corelation = graph of x and y is a scattered points. Eg: no of marriages adn yeild of Potatoes in India

# 3 main types of Data - NOminal, ORDINAL/RANK, RATIO
#NOMINAL VARIABLES  _ GENDER, NATIONALITY
#ORDINAL _has an order EG: Educational Qualification.
#RATIO-  HEight weight, age are ration scale variables.

# correlation value varies from -1 to 1
# 1 means perfect +ve corealtion
# -1 means perfect -ve corelation
# 0-0.3   -> no or negligible corelation
# 0.3-0.5 -> Modearate corealation
# 0.5-0.7 -> Strong corelation
# 0.7-1   -> Very strong corelation


#EX 1 .  When studying the relation between 2 NUMERIC variables, we use PEARSON Corelation
# EX 2. When studying the relation between 2 RANKED/ORDINAL variables, we use SPEARMAN Corelation
# EX. 3 When studying the relation between 2 NOMINAL/CAEGORICAL variables, we use chi- square Test / ASSOCIATION


#How to find 2 variables that have Higher corelation
# Now in iris we will use Pearson's coefficient'

#Check corelation between the variables
cor(iris[1:4])
plot(iris$Petal.Length, iris$Petal.Width)
#We use this to understand if two variables are related or not

# STATISTICALLY, There is no relation between Petal length and Petal width
# STATISTICALLY< There is a strong relation between petal length and petal width
cor.test(iris$Petal.Length, iris$Petal.Width)


############   IMPOERTANT RULE RULE RULE RULE.   #############################

# When p-value <0.5, you REJECT NULL hypothesis and accept alternative hypothesis.
# is p-value > 0.5, you ACCEPT NULL hypothesis.

#############.   CONFIDENCE INTERVAL             #############################
# p-value is nothing but confidence level
# pvalue - 1-confidence interval

#TRy changing the confidence interval i.e default to 95%


#############.  HOW TO FIND REALTION BETWEEN TWO RANKED VARIABLES. ############
#When We have rangked data, we use spearman correaltion
# WE have recorderd the snap score and interview score but we dont have it. now, instead we have ranks of the students
# Hypothesis => NULL=>There is no correlation between snap score and interview score
# ALTERNATIVE= > THere is some corelation between snap score and interview score

rank_data = read.csv(
  "/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/rank correlation.csv"
)
rank_data
#SPEARMAN MMETHOD => write method = 'spearman' in method parameter
cor.test(rank_data$Rintervi, rank_data$Raptitut, method = 'spearman')

#This test proves that there is corelation between the Aptitude ranking and InterView Ranking
#means there is consistency in the rank of sstudent in rank as well as snap (means scoring in snap means he is good in interview as well)

#############.  HOW TO FIND REALTION BETWEEN TWO CATEGORICAL VARIABLES. ######################################.


# We are using vcategorical variables JobCat and Minority
# When we talk between relation between two categorical variables,  we say Association
# and Corelation whem talk about numeric variobles
# NULL HYP = There is no ASSOCIATION between job category and minority category  
# ALTERNATE = There is some ASSOCIATION between jobn category and minority category

# chi- square test
empData = read.csv("/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/employeedata.csv")
head(empData)

#Create a contingency table
t1 = table(empData$jobcat, empData$minority) # TABLE in R GIVES FREQUENCY it is not an actual table
summary(t1) # function used for Chi-Square test. This is called as CHI-SQUARE TEst of ASSOCIATION
class(t1)
mat = matrix(t1,3,2)
#There is bias in the data, now e try to find the expected count
rowSums1 = as.vector(rowSums(t1))
colSums1 = as.vector(colSums(t1))

colnames(expValues) = c("NO", "YES")

rownames(expValues) = c("Clerical", "Custodial","Manager")
t1 = table(empData$jobcat, empData$minority) # TABLE in R GIVES FREQUENCY it is not an actual table

expValues = data.frame(ncol = 2,nrow = 3)
for(i in 1:3){
  for(j in 1:2){
    expValues[i,j] = (rowSums(t1)[i]*colSums(t1)[j]) / sum(t1)
  }
}
expValues







