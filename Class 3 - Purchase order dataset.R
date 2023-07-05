######### PURCHSE ORDER DATASET ####################
 purchase_order = read.csv("/Users/hrishi445/Desktop/ACADEMICS/R - PRogramming Data-prep-anad-cleaning/Purchase Orders.csv",header = T)
 purchase_order
 
 sum(purchase_order$Cost.per.order) # Sum of Cost per oprder column
 
 #TOtal qty of airframe purchased
 head(purchase_order)
 airframe_subset =subset(purchase_order,  purchase_order$Item.Description== "Airframe fasteners")
sum(airframe_subset$Quantity)  

#TOAL ORDER PLACED BY MANLEY VALLVE
manley_valve_subset = subset(purchase_order,purchase_order$Supplier=="Manley Valve")
sum(manley_valve_subset$Cost.per.order)


## Items having  total cost of all orders by item description

column_names = unique(purchase_order$Item.Description)
column_names

sum_by_items = c('numeric')

for(i in 1: length(column_names)){
  desc_subset = subset(purchase_order,purchase_order$Item.Description == column_names[i])
  sum_by_items[i] = sum(desc_subset$Cost.per.order)
  
  
}



final_data_frame = as.data.frame(column_names,sum_by_items)
final_data_frame


##Find the supplier with highest Cost = Do the same as above just replace item.description with supplier


v1=c(34,56,34,67,78,NA,66,NA,90,99)
is.na(v1)
sum(is.na(v1)) #how many NA values are there

sum(!is.na(v1)) #! is negation symbol

subset(v1, !is.na(v1))

v1[v1>20]

v1[v1>20 & is.na(v1)!=T]
mean(v1,na.rm=T)

# for (i in length(v1))
# {
#   if(is.na(v1))
#   {
#     v1[i] = mean()
#   }
# }

v1[is.na(v1)]=mean(v1,na.rm=T)
v1




