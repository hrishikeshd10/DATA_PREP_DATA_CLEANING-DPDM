base_path = "/Users/hrishi445/Desktop/Academics/DATA_PREP_DATA_CLEANING-DPDM-/datasets_class10/"
db_password = "montfort321"
# #########READING CSV FILES
income_data = read.csv(paste(base_path,"incomedata_test.csv",sep = ""))
income_data
# header = F means there is no header in the file; Header - T by default
# Separator = Default for csv is comma, mention if ther is any other separator other than comma.


income_data = read.table(gsub(" ", "", paste(base_path, "incomedata_test.csv")))

#### READ TAB SEPARATED TXT FILE
file_path = paste(base_path,"Tabseperated.txt",sep = "")
tab_data = read.csv(file_path,sep = '\t')
tab_data

#########################################################################
# Reading the comma separated txt file using read.csv

file_path = paste(base_path,"CommaSeperated.txt",sep = "")
comma_sep_missing_data = read.csv(file_path)
comma_sep_missing_data

# There is no headerhere,s o aps header = F
comma_sep_missing_data = read.csv(file_path,header = F)
comma_sep_missing_data
# in 4th record, there is . and wish to treat it as missing value
# For that, add na.strings = c(" ", ".", "%")   #array of values to be treated as NA

comma_sep_missing_data = read.csv(file_path,header = F, col.names = c("Name", "City"),na.strings = c(" ", ".", "%",""))
#mentioned column names for the missing column names
comma_sep_missing_data

############################################################################

file_path = paste(base_path,"kings.csv",sep = "")
kings_data  = read.csv(file_path)
kings_data

#Now we dont want to read the first 3 rows, so wu use the parameter skip
kings_data <- read.csv(file_path, skip =3)
kings_data
# now by default R took x 60 as column name, so specify column names.

kings_data = read.csv(file_path,skip = 3, col.names = c("Kings Age"))
kings_data

############################################################################

# In Kings1.csv, there is text in between the rows.
# so when tehre are comments in the file, we can ignore the comment ldata like so:
# using comment.char
file_path = paste(base_path,"kings1.csv",sep = "")
#now, the be,ow line wont work
kings1_data = read.csv(file_path, col.names = c("Age"),comment.char = c("$"))
kings1_data

# we can remove only one comment character at at time if ther are more than one comment characters.
kings1_data = read.csv(file_path, col.names = c("Age"),comment.char = "#")
kings1_data

# SO HERE , WE NEED TO CLEAN THE DATA TO MAKE SURE THAT IF THERE ARE COMMENTS ,
# WE MAKE SURE THAT WE MAKE ALL THE COMMENTS START BY ONLY ONE CHARACTER.

###########################################################################
# DATA DESCRETISATION MEANS DIVIDING VCALUS INTO CATEGORIES ;IKE AGE IN INFANT, TEEN, MIDDLE AGE, OLD AGE ETC.
# The above is done using cut function in R

###########################################################################

                          # READING EXCEL FILES IN R

###########################################################################

install.packages("readxl")
library(readxl)

exel_data = read_excel("/Users/hrishi445/Desktop/excel_sheet.xlsx")
excel_data[0]


###########################################################################

#                       READING XML FILE IN R

###########################################################################

install.packages("XML")
library(XML)
file_path = paste(base_path,"simple.xml",sep = "")
doc = xmlTreeParse(file = file_path,useInternalNodes = T )
doc
# now we dont need that <?xml version 1.8>  wala line, so we eliminate it like so:
rootnode = xmlRoot(doc)
rootnode

# xpathSApply() creates an array of items under the specified tag: tag is given by //, suffixed with tag names.
names = xpathSApply(rootnode,"//name",xmlValue)
price = xpathSApply(rootnode,"//price",xmlValue)
desc = xpathSApply(rootnode,"//description",xmlValue)
calories = xpathSApply(rootnode,"//calories",xmlValue)
names
price
desc
calories

xml_to_table = data.frame(names,price,desc,calories)
View(xml_to_table)

#now prices are in Dolalrs, so we convert the column to numeric like so

xml_to_table$price = as.numeric("\\$","",xml_to_table$price)
xml_to_table$calories = as.numeric(xml_to_table$calories)
class(xml_to_table$price)
str(xml_to_table)


#######################################################################

#                         READING JSON FILES IN R

# 1. JSON file is very lite than XML
# 2. It is compatible with java
#######################################################################

install.packages("jsonlite")
library(jsonlite)

file_path = paste(base_path,"sample.json",sep = "")
json_data = fromJSON(file_path)
json_data
# WE can access JSoN LDATAL IKE SO
for(i in 1: length(json_data)){
  json_data[i]
}
json_data$ID[2]


###############################################################
install.packages("RMySQL")
library(RMySQL)

my_con = dbConnect(MySQL(), user ="root", password = db_password, host ="127.0.0.1" )
#ip of local machine or localhost is 127.0.0.1
