# 2ndminiproject
How the run_analysis.R code works: 
I first read all the raw data to R into a table form, and assigned each to a variable. As I was reading the test and train datas, for each file, I assigned column names for easy identification. 
In between reading the test and train raw datas, in lines 12 and 22, I extracted the mean and standard deviation for each measurement. 
After reading and extracting the columns that contains the mean and standard deviation measurements, I column binded the three files to make a single data frame. 
Then, in line 27, i row binded the test and train data frame to form a single data frame.
In line 30, I changed the numerical labels of the activities into character labels for easy identification. 
As the last requirement of the project, I made an independent tidy data set containing the average of each variable for each activity and each subject. 
I first extracted all the variables that contains the mean and standard deviation columns and temporarily saved it to a temp variable using the grepl() function. 
Then, using aggregate.data.frame() function, I made a new data frame that contains the ActivityID, SubjectID, and the mean of the variables.
