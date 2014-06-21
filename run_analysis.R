library(reshape2)

# merges train/test features
xtrainset <- read.table('UCI HAR Dataset/train/X_train.txt')
xtestset <- read.table('UCI HAR Dataset/test/X_test.txt')
xset <- rbind(xtrainset, xtestset)

# merges train/test subjects
strainset <- read.table('UCI HAR Dataset/train/subject_train.txt')
stestset <- read.table('UCI HAR Dataset/test/subject_test.txt')
sset <- rbind(strainset, stestset)

# merges train/test activities
ytrainset <- read.table('UCI HAR Dataset/train/y_train.txt')
ytestset <- read.table('UCI HAR Dataset/test/y_test.txt')
yset <- rbind(ytrainset, ytestset)
activity_labels <- t(read.table('UCI HAR Dataset/activity_labels.txt'))[2,]
yset$afact <- factor(yset$V1, labels=activity_labels)

# merges features, subjects and activities
dset <- cbind(xset, sset, yset$afact)

# sets feature names from the file
feature_names <- t(read.table('UCI HAR Dataset/features.txt'))[2,]
names(dset) <- c(feature_names, "subject", "activity")

# extracts measurements on the mean and standard deviation
msset <- dset[,grep('mean\\(\\)|std\\(\\)|subject|activity',names(dset))] 

# creates a tidy data set with the average of each variable for each activity and each subject
msmelt <- melt(msset, id=c("activity","subject"))
tidyset <- dcast(msmelt, subject + activity ~ variable, mean)
write.table(tidyset, 'tidy.csv')
