set datafile separator ","

plot "exportedVariables.csv" every::1 using 1:2 with line ,\
     "exportedVariables.csv" every::1 using 1:5 with line 
