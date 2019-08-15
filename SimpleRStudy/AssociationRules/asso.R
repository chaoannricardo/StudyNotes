library(arules)

tr <- read.transactions("C:/Users/richi/Desktop/Temp/R_Lesson/bank.csv", format = "single", cols = c(1,2),sep=",")
inspect(tr)

rules <- apriori(tr,parameter=list(supp=0.1,conf=0.1,minlen=2,maxlen=10))

inspect(rules)

rulesData=as(rules,"data.frame")

rule2=rules[which(rules@quality$lift>1.1)]
inspect(rule2)

rule3=sort(rules,by="lift",decreasing=T)
inspect(rule3)

library(arulesViz)
plot(rules, shading="lift")