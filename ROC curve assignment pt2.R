
# package install and library call
install.packages("ROCR")
library(ROCR)
# ROC Example in Fawcett(2006)
actual_class1<-c("p","p","p","p","p","n","n","n","n","n","n","n")
prob1<-c(0.80,0.75,0.50,0.40,0.85,0.70,0.20,0.55,0.35,0.65,0.60,0.50)

actual_class2<-c("p","p","p","p","p","n","n","n","n","n","n","n")
prob2<-c(0.60,0.90,0.35,0.65,0.45,0.20,0.30,0.70,0.55, 0.40, 0.30, 0.65)
model1_data<-data.frame(actual_class1,prob1)
model1_data
model2_data<-data.frame(actual_class2,prob2)
model2_data

pred1<-prediction(model1_data$prob1, model1_data$actual_class1)
perf1<-performance(pred1, measure="tpr",x.measure="fpr")
plot(perf1)
abline(a=0,b=1)
pred2<-prediction(model2_data$prob2, model2_data$actual_class2)
perf2<-performance(pred2, measure="tpr",x.measure="fpr")
plot(perf2)
abline(a=0,b=1)
# The following displays AUC
auc_obj1<-performance(pred1, "auc")
auc_obj1@y.values
auc_obj2<-performance(pred2, "auc")
auc_obj2@y.values
