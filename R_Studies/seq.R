library(arulesSequences)

data=read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/bankS.csv")

data1=data.frame(item=factor(data$ITEM))
tran=as(data1,"transactions")
transactionInfo(tran)$sequenceID=data$SID
transactionInfo(tran)$eventID=data$EID
inspect(tran)

rule.seq = cspade(tran, parameter = list(support = 0.2, maxlen = 10))

inspect(rule.seq)

rules=rule.seq[which(rule.seq@quality$support>0.5)]
inspect(rules)

rule.seq=sort(rule.seq,by="support",decreasing=T)
inspect(rule.seq)














