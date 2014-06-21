run_analysis.R 
==============

The run_analysis.R script performs all the steps of the analysis as requested in the task description.

First, training and test sets for features, subjects and activities are combined.
Then, the names of variables and activities are loaded from the UCI dataset files and used to set names of the data frame variables.
Features that contain 'mean()' or 'set()' in their names are selected using grep together with the 'activity' and 'subject' features.
The tidy data set is created by using the melt and dcast functions.
Finally, the tidy data set is saved using the write.table function.
