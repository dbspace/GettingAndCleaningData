#Set dataset path relative to the working directory, 
#The data set is unzip and remove the space
datasetPath <- 'UCIHARDataset'

#Set the location of all the files 
featuresFile <- file.path(datasetPath, 'features.txt')
labelFile <- file.path(datasetPath, 'activity_labels.txt')
trainLabelFile <- file.path(datasetPath, 'train/y_train.txt')
trainSetFile <- file.path(datasetPath, 'train/X_train.txt')
trainSubjectFile <- file.path(datasetPath, 'train/subject_train.txt')
testLabelFile <- file.path(datasetPath, 'test/y_test.txt')
testSetFile <- file.path(datasetPath, 'test/X_test.txt')
testSubjectFile <- file.path(datasetPath, 'test/subject_test.txt')

# read the train data
trainSet <- read.table(trainSetFile)
trainSubject <- read.table(trainSubjectFile)
trainLabel <- read.table(trainLabelFile)
trainData <- cbind(trainLabel,trainSubject,trainSet)

# read the test data
testSet <- read.table(testSetFile)
testSubject <- read.table(testSubjectFile)
testLabel <- read.table(testLabelFile)
testData <- cbind(testLabel,testSubject,testSet)

#Finish 1 merges the training and the test data set in one
combineData <- rbind(trainData, testData)

#read features
features <- read.table(featuresFile)

#read label
label <- read.table(labelFile)

#create the column label for dataset
features <- features[2]
colnames(features) <- "colLabel"
colLabel <- rbind(data.frame(colLabel=c('label', 'subject')), features)

#name the columns of combineData
names(combineData)<-colLabel[1:563,]

#get the desire columns (std and mean, including the label and subject)
dcolumns <- grep("std|mean|label|subject", colLabel$colLabel)

#getting the data that contains only mean and std
#Finish 2 Extracts only the measurements on mean and std
meanStdData <- combineData[, dcolumns]

#Factor meanStdData with loaded Labels
#Finish 3 Uses descriptive activity names
meanStdData$label <- factor(meanStdData$label, levels=label[,1], labels=label[,2])

#Finish 4 use appropriately labels with descriptive name
# meanStdData have the appropriately labels with descriptive name
# because we subset from combineData

#create tidy data with the mean of every variable
tidyData <- aggregate(meanStdData[, 3:81], 
                      by = list(meanStdData$subject, meanStdData$label), FUN = mean)
colnames(tidyData)[1:2] <- c("subject", "activity")

#write out the data
write.table(tidyData, "tidyData.txt", row.names=FALSE)
