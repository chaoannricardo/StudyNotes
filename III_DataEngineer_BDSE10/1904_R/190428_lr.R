#=====================================================================

s = read.csv("C:/Users/Student/Desktop/salary.csv")
head(s,3)

x = s$Experience
y = s$Salary

#最小平方法
beta = sum((x - mean(x)) * (y - mean(y))) / sum((x-mean(x))^2)
beta

alpha = mean(y) - beta * mean(x)
alpha

s = read.csv("C:/Users/Student/Desktop/salary.csv")
head(s,3)

model = lm(Salary ~ Experience, data = s)
summary(model)
model$coefficients

y_hat <- predict(model, s)

#Scatter Plot
x <- s$Salary
y <- y_hat

plot(x, y, main = "Main title",
     xlab = "Actual Value", ylab = "Predicted Value",
     pch = 19, frame = FALSE)

# Add Ideal line
abline(1, 1, col = "blue")


#=====================================================================
x = read.csv("C:/Users/Student/Desktop/home_prediction.csv")
head(x,3)

y = x$Value
y = as.matrix(y)
y

x = x[2:5]
x
x = cbind(intercept = 1, x)
x
x = as.matrix.data.frame(x)
x

xx = t(x) %*% x
xx

beta = solve(xx) %*% t(x) %*% y
beta

x = read.csv("C:/Users/Student/Desktop/home_prediction.csv")
x = x[-1]
head(x,3)

model = lm(x$Value ~ x$Space + x$Offices + x$Entrances + x$Age)
summary(model)

model = lm(Value ~ ., data = x)
summary(model)

y_hat <- predict(model, x)

results <- as.data.frame(cbind(y_hat, x$Value))
names(results) <- c("y_hat","y")

#Scatter Plot
x <- x$Value
y <- y_hat

plot(x, y, main = "Main title",
     xlab = "Actual Value", ylab = "Predicted Value",
     pch = 19, frame = FALSE)

# Add Ideal line
abline(1, 1, col = "blue")

#=====================================================================

# Read CPU Performance Prediction Dataset
data = read.csv("C:/Users/Student/Desktop/CPU.csv")[,-1]


# Generate Training & Test Datasets
set.seed(112)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Linear Regression Model
LR <- lm(PERF ~ ., data=train)
LR

# Make Predictions
test_set.y_hat = predict(LR, newdata=test)
test_set.y_hat

# Model Evaluation
mae = sum(abs(test_set.y_hat-test$PERF)) / length(test$PERF)
mae

#Scatter Plot
x <- test$PERF
y <- test_set.y_hat

plot(x, y, main = "Main title",
     xlab = "Actual Value", ylab = "Predicted Value",
     pch = 19, frame = FALSE)

# Add Ideal line
abline(1, 1, col = "blue")


















