 # 3 x 3 matrix with labels and fill the matrix by rows and 


v1 = c(1,2,3)
v2 = c(4,5,6)
v3 = c(7,8,9)
m3 = rbind(v1,v2,v3)``
rownames(m3) = c("Row1", "Row2", "Row 3")
colnames(m3) = c("Col 1", "Col 2","Col 3")
m3


# 2 × 2 matrix with labels and fill the matrix by columns.
v4 = c(1,2)
v5 = c(4,5)
m2 = cbind(v4,v5)
rownames(m2) = c("Row1", "Row2" )
colnames(m2) = c("Col 1", "Col 2")
m2




