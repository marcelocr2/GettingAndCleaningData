The original data is described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

the data came separated in different file, e.x X_train, y_train, activity_labels. The first step was joinig this text files

Since we had test and train datasets, the srcipt appends the train data set to the test dataset

I only use the variables that have the -mean() or -std() in the variable name, and subject and activity

the final dataset contains the mean of the variables selected before grouped by subject and activity.

In order to mantain consistency the final variable names are equal to the variable names that came with the dataset

