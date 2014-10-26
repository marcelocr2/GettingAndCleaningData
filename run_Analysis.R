#loading the txt files
test=read.table("X_test.txt")
train=read.table("X_train.txt")
y_test=read.table("y_test.txt")
y_train=read.table("y_train.txt")
s_train=read.table("subject_train.txt")
s_test=read.table("subject_test.txt")
test_f=cbind(test,y_test,s_test)
train_f=cbind(train,y_train,s_train)
#creating a dataframe with train and test
final=rbind(test_f,train_f)
#getting the variable names txt
names=read.table("features.txt")
#getting the mean and sd variables
wstd=grep("-std()",names[,2])
wmean=grep("-mean()",names[,2])
#mean and sd variables plus activity and subject
vars=c(wstd,wmean,562,563)
#keeping the neccesary variables
dt_keep=final[,vars]
#factoring
dt_keep$activity=factor(dt_keep$V1.1,labels=c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying"))
#getting variable names from names
var_names=names[vars,2]
var_names=as.character(var_names)
var_names[80]="Activity number"
var_names[81]="Subject"
var_names=c(var_names,"Activity")
#setting colnames
colnames(dt_keep)=var_names
#preparing to use dplyr
tbl_new=tbl_df(dt_keep)
#grouping by subject
new_aux=group_by(tbl_new,Subject)
#getting the mean by subject
new_final=summarise_each(new_aux,funs(mean))