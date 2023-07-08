# Write a R program to create a Dataframes which contain details of 5 employees and display the details.
empData = data.frame()
fix(empData)
empData

# Display Summary of the data frame
summary(empData)

people1<-subset(people, select=c(Hand.Span, Sex, Eye.Color))