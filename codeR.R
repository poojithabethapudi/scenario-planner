rm(list = ls())

require(nnet)
require(data.table)

df = fread('New_BranchWise.csv')

names(df)
str(df)

df$`State Type` = as.factor(df$`State Type`)

spl = caTools::sample.split(df$`State Type`, .7)

train = df[spl == T,]
test = df[spl == F,]

model = multinom(`State Type`~ `Average Ticket Size`+Productivity , data = train)

model
pred = predict(model, test)

pred = predict(model, train)

confusionMatrix(pred, train$`State Type`)
confusionMatrix(pred, test$`State Type`)

require(caret)
model

table(train$`State Type`)

