#Package to read csv files
library(readr)
TSL <- read_csv("C:/Users/ADMIN/OneDrive/Desktop/Sowjanya/Woxsen/Term3/Deep Learning/Datasets/KOTAKBANK.csv")

#neuralnet package
library(neuralnet)
#Scaling the data to particular range
scaledata = scale(TSL)
#normalizing the data (choosing minimum and maximum value)
norm = function(x){
  return((x-min(x))/max(x)-min(x))
}
#applying the above formula to the data
minmax_df1 = as.data.frame(lapply(TSL,norm))
#Data is split for test & train
train1 = minmax_df1[1:150,]
test1 = minmax_df1[151:200,]
names(TSL)
#Command for feed forward
#nn = neuralnet(Close~+Open+High+Low,data=train1,rep=3,hidden = c(2,1),threshold = 0.01)
#nn$result.matrix
#plotting the neural network structure
plot(nn)
#Command for the back propogation
backprop = neuralnet(Close~+Open+High+Low,data=train1,algorithm="backprop",rep = 5,hidden = c(2,1),threshold = 0.01,learningrate = 0.0001)
#plotting the neural network for back propogation
plot(backprop)
