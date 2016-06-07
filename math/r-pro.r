# d <- data.frame(rep(c("A", "B"), each = 10), rnorm(20, rep(c(3.7, 6.5), each = 10)) )
# colnames(d) <- c("type", "weight")

# hist(rnorm(50, rep(1:5, each = 10))) # 正規分布の平均を、0.1 から 10まで 0.1 ずつ増やす

# x <- rep(c('Dog', 'Cat', 'Mouse'), each = 10) # Dog, Cat, Moust が10個ずつ並んだベクトル
# y <- sample(x, length(x))                     # 順番をシャッフルする

# d <- data.frame(rnorm(50, mean = 10, sd = 4),rnorm(50, mean = 10, sd = 4),
# 	rnorm(50, mean = 10, sd = 4),rnorm(50, mean = 10, sd = 4))
# colnames(d) <- c("a","b","c","d")


# ClassAves <- colMeans(d[,c(1:4)])
# dim(ClassAves)

# ClassCov <- cov(d[,c(1:4)])
# dim(ClassCov)

d <- data.frame(rnorm(50, mean = 5, sd = 2),rnorm(50, mean = 5, sd = 2))
colnames(d) <- c("x", "y")
# plot(d,col="red",xlim = c(-20, 20),ylim = c(-20, 20))
# par(new=T)
a <- matrix(c(1,2,1,2),2,2)
d <- a * d
plot(d,col="green",xlim = c(-20, 20),ylim = c(-20, 20))
par(new=T)
# dd <- scale(d)
# plot(dd,col="green")
ClassCov <- cov(d[,c(1:2)])
eg <- eigen(ClassCov)
A <- solve(eg$vectors) %*% ClassCov %*% eg$vectors
U <- svd(A)$u
V <- svd(A)$v
D <- diag(sqrt(svd(A)$d))
B <- solve(U %*% D %*% t(V)) 
d <- B %*% t(eg$vectors) %*% t(d)
ClassAves2 <- colMeans(t(d))
ClassCov2 <- cov(t(d))
plot(t(d),col="blue",xlim = c(-20, 20),ylim = c(-20, 20),xlab="x",ylab="y")


