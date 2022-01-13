#Reading variable names(features) and activity labels

names <- read.table("dataset/features.txt")
labels <- read.table("dataset/activity_labels.txt")

#Reading test and train data and creating individual data frames 
testfile <- read.table("dataset/test/X_test.txt", col.names = names[,2])
testlabels <- read.table("dataset/test/y_test.txt", col.names = "ActivityID")
subjecttest <- read.table("dataset/test/subject_test.txt", col.names = "SubjectID")

    #extracting the measurements on the mean and standard deviation for each measurement
      testfile <- testfile[, grepl("mean()", colnames(testfile)) | grepl("std()", colnames(testfile))]

test <- cbind(testfile, testlabels, subjecttest)


trainfile <- read.table("dataset/train/X_train.txt", col.names = names[,2])
trainlabels <- read.table("dataset/train/y_train.txt", col.names = "ActivityID")
subjecttrain <- read.table("dataset/train/subject_train.txt", col.names = "SubjectID")

    #extracting the measurements on the mean and standard deviation for each measurement
      trainfile <- trainfile[, grepl("mean()", colnames(trainfile)) | grepl("std()", colnames(trainfile))]

train <- cbind(trainfile, trainlabels, subjecttrain)

#combining test and train data frames into one data frame
final <- rbind(test, train)

#changing the numerical labels into names of the activity
final$ActivityID <- factor(final$ActivityID, levels = 1:6, labels = as.character(labels[,2]))

#making of second independent tidy data set with the average of each variable for each activity and each subject
temp <- grepl("std|mean", names(final))
tidydataset2 <- aggregate.data.frame(x = final[,temp], by = list(Activity = final$ActivityID, Subject = final$SubjectID), FUN = mean)

