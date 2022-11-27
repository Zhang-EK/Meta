### 在R中行叫做观测(observ)，列叫做变量（varibles）

########对于数字的一些基本处理######
x <- runif(200000, min = 1, max = 100)
length(x)
sum(x)
mean(x)
var(x)
sd(x)
median(x)

########R的三种括号######
##xxx():函数
##【】索引
###{}代码块

###################读取csv文件######
x <- read.csv("Rdata/CountMatrix.csv", header = T, row.names = 1)
y <- read.csv("Rdata/heatmap.csv", row.names = 1)
install.packages("pheatmap")
library(pheatmap)
pheatmap(y)

################读取excel文件#######
install.packages("openxlsx")
library(openxlsx)
x <- read.xlsx("Rdata/2015.xlsx", sheet = 1)

################使用R保存数据集#######
x <- runif(100000,min = 1, max = 100)
y <- runif(100000,min = 1, max = 100)
z <- data.frame(x=x, y=y)
#使用saveRDS() save()这两个命令 RDS单个数据集，Rdata是多个数据集

##########数据结构######
##vector 其实就是一个数字或者字符的集合 所有数据都是由向量构成的
a <- c(1,2)
class(a)
a <- c(1, "apple")
class(a)
seq()
rep()
##character 字符






