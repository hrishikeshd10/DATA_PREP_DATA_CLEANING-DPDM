# Q1: Which media has most impact on sales?
# => Coreelation
#
# Q2: How much is the impact of each media on the sales?
# => Build a regression Model.
#
# Q3: If I am sapenign x,y,z amounts on the a,b,c media, what is goig to be the imapct on sales?
# => Regression Model
filePath = "/Users/hrishi445/Desktop/ACADEMICS/DATA_PREP_DATA_CLEANING-DPDM-/DATA MINING/Datasets/"
data = read.csv(paste(filePath,"Advertising.csv",sep = ""))
print(data)


#Q1: Which media has most impact on sales?
cor(data[2:5])
# WE infer that TV advertisement has strong correlation with sales.
plot(data[2:5])
# Lesser the scatter, more stronger the correlation.


# Q2: How much is the impact of each media on the sales?

model1 = lm(sales~TV, data) # lm = Linear Model, sales is dependend var, TV is independent var, data = dataset.
summary(model1)

# We can make the eqn, y = mx + c like so
# Sales = 0.048*(x) + 7.03

# slope = Estimate variable of DV in Coefficients Section.
# c = Intercept  ka Estimate in Coefficients Section.

# how to interpret 0.048:
# If I increase tv ad budget by 1000 rs, sales of TV likely to increase by 48 Units.
# Even If we dont spend on ad, sales will be 7 units.

# Coefficient of Determination  = R-squared -> Amount of change in y explained by x
# amt of change in Sales explained by budget in advertisement.
#
# i.e 62 percent is happening because of TV advertisement.

# Residual Standard eror:
# It givres error in the model.
# The Distance betn value of DV in dataset, and value predicted.

predict(model1, newdata = data ) # This gives PRedicted sales based on TV ad budget
rss = sum(model1$residuals ^2) # residuals mtlb errors and this is code to find RSS - Residual Sum Square
rse = sqrt(rss / 198)  # RSE = RSS / N-(p+1)
rse

# The Pr(>|t|) column is p value, which says if the dependent variable is significatnt or not
#i.e In this case kya TV ka ad budget hona is significant in sales of Product?
# IF P<0.5, The vaariable is significant

model_radio = lm(sales~radio,data = data)
summary(model_radio)
sales = 0.202*x + 9.311
# if 100 Rs budget increased in radio, 202 units more will be sold


model_news = lm(sales~newspaper,data=data)
summary(model_news)
y = 0.054*x + 12.3

#From this , we infered that sales by radio will be more,
# which contradicted our cor() test that showed k TV was most significant
# So there is a contradiction here.

# Q: Witehr use one of thebudget . Which model should You use for prediction
# => You should go T V model as RSE is very less in all the 3 models

################################################################
model_all  = lm(sales~TV+radio+newspaper,data = data)
summary(model_all)

# sales = 0.045 TV + 0.188 Radio -0.001 Newspaper + 2.93
# As pe the aboce analysis
# Tv and radio is significant and NEwspaper is not significant
# so we reject newspaper as IV in the final model

model_final = lm(sales~TV+radio, data = data)
summary(model_final)
# sales = 0.045 TV + 0.187 RADIO + 2.92

# on doing this, we noticed that Newspaper has no impact
# kyuki considering newspaper and rejecting it did not make any difference in the R- Squared value.


# IMPACT ANALYSIS KARNE K LIYE ALL VARIABLES MUST BE ON SAME SCALE.
client_req_data = read.csv(paste(filePath,"client_req_data.csv",sep=""))
new_data = predict()
