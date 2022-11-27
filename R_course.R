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
##生成一下实验编号
a <- 1:50
b <- c("A","B")
b <- rep(b, each = 50)
paste(b,a, sep = "")

########数据索引########
rivers
class(rivers)
rivers[1]  ###一维索引
rivers[-1]   #负索引表示删除数据

rivers[seq(1,141,2)]
rivers[c(T,F)]

rivers[rivers > mean(rivers)]
mean(rivers)

rivers[rivers == 1000] <- 1001  ###可以修改数字

#######################
x <- read.csv("Rdata/homo_length.csv")
x <- head(x,24)
barplot(x[,2], names.arg = x[,1])

#######矩阵########
#二维数据
x <- 1:100
m <- matrix(x, nrow = 25, byrow = T)
dim(m)

x <- read.csv("Rdata/heatmap.csv", header = T, row.names = 1)
class(x)
x <- as.matrix(x)
heatmap(x)

x <- x[,c(1:5,11:15,6:10,16:20)]   ###可以直接调整列的顺序

#apply函数可以将一维的函数拓展到二维
apply(x,1,sum)  #1是行，2是列
apply(x,2,sd)

apply(state.x77, 2, sum)
apply(state.x77,2, mean)[2]

######数据框########
#矩阵和数据框的区别在于矩阵的内容只能是一种属性，只能都是逻辑值、数值或者是字符串，矩阵是一种特殊的数据框
#数据每一列是一个向量，而每一行则不是
#read读入的文件默认都是数据框

library(openxlsx)
x <- read.xlsx("Rdata/2015.xlsx", rowNames = T)
class(x)

id <- c(57,46,77,17,36,23,75,39,33)
treatment <- rep("Treated",9)
sex <- rep("Male",9)
age <- c(27,29,30,32,46,58,59,59,63)
improved <- c("some","none","none","marked","marked","marked","none","marked","none")
x <- data.frame(id,treatment,sex,age,improved)

x$City  #学会$

#要牢记向量化操作

##########
x <- read.csv("Rdata/200genes.csv", stringsAsFactors = F, row.names = 1)
y <- read.csv("Rdata/121genes.csv",stringsAsFactors = F)
x[1,]
dta <- na.omit(x[unique(y$gene),])
write.csv(dta, file = "Rdata/86genes.csv")
###########











 