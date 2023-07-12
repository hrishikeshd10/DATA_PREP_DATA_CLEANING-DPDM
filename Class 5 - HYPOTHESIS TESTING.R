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


# IF We are doing Census study, we don't need hypothesis testing. We use only when we do sampling study and draw inference abt
# a population by studying the sample study.


# STEP 1 -  Define hYpothesis
# STEP 2- In order to test Hypothesis, define
#         a. NULL Hypothesis (no relation between the variables eg: no co-relation between the experience and salary offered)
#         b. ALTERNATE Hypothesis (some relation between the variables eg: some co-relation between the exp and salary)
#
#
# HOW TO DETERMINE THE RELATION BETWEEN TWO VARIABLES?
#   We can do this using concept of co-variance and Correlation (pearson and spearman )


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

# NULL => STATISTICALLY, There is no relation between Petal length and Petal width
# ALTERNATIVE => STATISTICALLY< There is a strong relation between petal length and petal width
result = cor.test(iris$Petal.Length, iris$Petal.Width)

# GET THE ORIGINAL p-value instead of 'e' notation
result = format(result$p.value,scientific = F)

result


############   IMPOERTANT RULE RULE RULE RULE.   #############################

# When p-value <0.05, you REJECT NULL hypothesis and accept alternative hypothesis.
# is p-value > 0.05, you ACCEPT NULL hypothesis.

#############.   CONFIDENCE INTERVAL             #############################
# p-value is nothing but confidence level
# pvalue - 1-confidence interval

#TRy changing the confidence interval i.e default to 95%


#############.  HOW TO FIND REALTION BETWEEN TWO RANKED VARIABLES. ############
#When We have ranked data, we use SPEARMAN correaltion
# WE have recorded the snap score and interview score but we dont have it. now, instead we have ranks of the students
# Hypothesis => NULL=>There is no correlation between snap score and interview score
# ALTERNATIVE= > THere is some corelation between snap score and interview score

rank_data = read.csv(
  "/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/rank correlation.csv"
)
rank_data
#SPEARMAN MMETHOD => write method = 'spearman' in method parameter
cor.test(rank_data$Rintervi, rank_data$Raptitut, method = 'spearman')

#This test proves that there is corelation between the Aptitude ranking and InterView Ranking
#means there is consistency in the rank of student in rank as well as snap (means scoring in snap means he is good in interview as well)



#############.  HOW TO FIND REALTION BETWEEN TWO CATEGORICAL VARIABLES. ######################################.


# We are using vcategorical variables JobCat and Minority
# When we talk between relation between two categorical variables,  we say Association
# and Corelation whem talk about numeric variobles
# NULL HYP = There is no ASSOCIATION between job category and minority category  
# ALTERNATE = There is some ASSOCIATION between jobn category and minority category

# CHI-SQUARE TEST OF ASSOCIATION

empData = read.csv("/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/employeedata.csv")
head(empData)

#Create a contingency table
t1 = table(empData$jobcat, empData$minority) # TABLE in R GIVES FREQUENCY it is not an actual table
t1
summary(t1) # function used for Chi-Square test. This is called as CHI-SQUARE TEst of ASSOCIATION. Performed on the contingency table
class(t1)
mat = matrix(t1,3,2)
#There is bias in the data, now e try to find the expected count
# WE know this because p-value is Less than 0.05
p_value = format(summary(t1)$p.value,scientific = F)

p_value

## FORMULA TO CALCULATE THE EXPECTED VALUE ##
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


################################## CHI_SQUARE GOODNESS OF FIT TEST  ##################################
# this is diff than chi-square test to find association of categorical variables
#Also called as One proportion Test
# when => 

chisq.test(c(1775,1457),p=c(.5,.5))
# NULL:  There is NO difference in the hypothesised and sample proportions i.e Proportion of Boys & Girls is 50:50
# ALTERNATE: The proportion of boys and girls is not 50:50
# p = proportion of the population.

## NULL => prop of 1st to 2nd class is 20:80
## Alternate=> Prop of 1st to 2nd is not 20:80
result = chisq.test(c(70,330), p=c(0.3,0.7))
result$p.value
formatted_p_value <- format(result$p.value, scientific = ic = FALSE)
formatted_p_value


#if p<0.05we accept alternative
#if p>0.05 we accept NULL



################################## TWO PROPORTION TEST  ##################################
# In grp 1 350/600 responded +ve
# in grp 2 360/500 responded +ve
# Research unit want to test whether there is difference between the efficacy of the said 2 drugs
# 
# NUll => Satistically, There is no significatnt diff in the efficay of the 2 drugs
# ALternate => Satistically, There is a significant diff in the efficay of the 2 drugs

result = prop.test(c(350, 260),c(600,500)) 
result

# prop of people getting cured from drug 1=58%
# and prop of people getting cured from drug 2 = 52%
# so we an conclude that drug 2 is more effective


##Question 2:
# in a city 400 out of 500 men were smokers
# after tax, 400 out of 600 were smokers.
# So was the observed decrease in the proportions of smokers significant?

# Null => Statistically, there is no significatnt diff in the smokers befor and after tax
# Alternate => Statistically, there is a significatnt diff in the smokers befor and after tax

result = prop.test(c(400,400), c(500,600))
result = format(result$p.value,scientific = F)
result


## QUESTION 3:
# A company has two ads A nd B for a product. Ad A used in anrea of 60 people of wich 18 tried product
# Ad B in are of 100 people, 22tried the product. Does this indicxate that a advertisement A is more effective than advertisement B, if 5% level of significance is used?

result = prop.test(c(18,22),c(60,100))
result
result = format(result$p.value,scientific = F)

result
  

  



