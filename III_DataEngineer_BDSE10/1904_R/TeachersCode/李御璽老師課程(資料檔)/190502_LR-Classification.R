# Read Credit Card Dataset
library(AER)

data(CreditCard)
head(CreditCard)

table(CreditCard$card)

# Just Select 5 Input Attributes
bankcard <- subset(CreditCard, 
                   select = c(card, reports, age, income, owner, months))


# Build Logistic Regression Model
card_glm <- glm(formula = card ~ ., family = "binomial", data = bankcard)
summary(card_glm)

# Single Record Prediction
new <- data.frame(reports = 0, age = 30, income = 10, 
                  owner = "yes", months = 50)
result <- predict(card_glm, newdata = new, type = "response")
result

new <- data.frame(reports = 1, age = 30, income = 5, 
                  owner = "no", months = 50)
result <- predict(card_glm, newdata = new, type = "response")
result

# Test Set Prediction
bankcard <- CreditCard

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(bankcard),nrow(bankcard)*0.8)
train <- bankcard[select,]
test <- bankcard[-select,]

# Build Logistic Regression Model for All Attributes
card_glm2 <- glm(formula = card ~ ., family = "binomial", data = train)
summary(card_glm2)

# Prediction for Test Dataset
result <- predict(card_glm2, newdata = test, type = "response")
test.y_hat <- ifelse(result > 0.5, "yes", "no")

result_all <- data.frame(Prediction=test.y_hat, 
                         Prob_for_yes=round(result,3),
                         Actual=test$card)
result_all

# Model Evaluation
accuracy.lr <- sum(test.y_hat==test$card) / length(test.y_hat)
accuracy.lr

cm <- table(test$card, test.y_hat, dnn = c("Actual","Prediction"))
cm


step(card_glm2, direction = "both", data = train)
















