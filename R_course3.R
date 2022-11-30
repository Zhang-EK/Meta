#######统计检验#######
#假设检验 有关系 没关系， 先定假设，再算概率，推翻还是维持
#离散型数据 fish或者卡方检验 连续性数据：t检验

######卡方检验######
#离散数据
install.packages("vcd")
library(vcd)
library(tidyverse)
data("Arthritis")

class(Arthritis)
dim(Arthritis)
table(Arthritis$Improved)
table(Arthritis$Treatment)     #table计算频数
table(Arthritis$Treatment, Arthritis$Sex)

Arthritis$Improved[Arthritis$Improved == "Some"] <- "Marked"
levels(Arthritis$Improved) <- c("None", "Marked", "Marked")
y <- table(Arthritis$Treatment, Arthritis$Improved)
chisq.test(y)   #假设相互独立  卡方检验
fisher.test(y)     #精确检验

z <- table(Arthritis$Improved, Arthritis$Sex)
chisq.test(z)
fisher.test(z)

#卡方检验用于检测观察到的类别变量的分布是否与期望的不同，也就是期望值和观测值是否有显著差异

#单因素卡方检验也就是卡方拟合度检验 chi-square goodness of fit test
#零假设：期望值和观测值没有差异，如果假设成立的可能性很低，就说明不合理，就可以推翻，一般p<0.05就可以拒绝假设
#单因素卡方检测其实就是检测期望值和观测值之间的差异  df为自由度，为组数-1

#二因素检验也就是独立性卡方检验 chis square test of independence
#检验两个类别变量之间是否有关系
#df为 行数-1 * 列数-1

#一定要注意零假设，默认都是没有差异

#######独立t检验########
#连续数据，且符合正态分布，否则使用wilcox
#比如基因表达量的不同
#假设也是符合同一个正态分布，也就是没有区别
x <- read.csv("Rdata/heatmap.csv",row.names = 1)
t.test(x[1,1:5],x[1,6:10])

apply(x, 1, function(i){
  t.test(i[1:5], i[6:10])$p.value
})     #在r中要尽量避免循环

######配对t检验######
#用来检测同一对象在实验前后是否有差异，是否符合同一个正态分布，假设也是没有差异
p <- apply(x, 1, function(i){
  t.test(i[1:5], i[11:15], paired =T)$p.value
})

######wilcox test######
#如果数据不符合正态分布那么就使用这个检测
wilcox.test(as.numeric(x[1,1:5]),as.numeric(x[1,6:10]))
apply(x, 1, function(i){wilcox.test(i[1:5], i[6:10])$p.value})
apply(x, 1, function(i){
  wilcox.test(i[1:5], i[11:15], paired =T)$p.value
})


#####多重检验矫正#######
#q value
p.adjust(p)

###########
x <- ToothGrowth
dim(x)
t.test(x[1:10,1],x[31:40,1])
t.test(x[x$supp=="VC" & x$dose=="0.5",]$len, x[x$supp=="OJ" & x$dose=="0.5",]$len)
t.test(x[11:20,1],x[41:50,1])
t.test(x[x$supp=="VC" & x$dose=="1",]$len, x[x$supp=="OJ" & x$dose=="1",]$len)
t.test(x[x$supp=="VC" & x$dose=="2",]$len, x[x$supp=="OJ" & x$dose=="2",]$len)

t.test(dplyr::filter(x, x$dose==0.5 & x$supp=="VC")$len, dplyr::filter(x, x$dose==0.5 & x$supp=="OJ")$len) 
#以上的几种方法都可以

########相关性########
#正相关、负相关
#相关系数-1 0 1
#pearson spearman kendall
x <- state.x77
cor(state.x77[,5],state.x77[,2])
cor(state.x77[,5],state.x77[,1])
cor(state.x77[,5],state.x77[,3])
cor(state.x77[,5],state.x77[,3], method = "spearman")

round(cor(state.x77), digits = 2)

#相关性检验
cor.test(state.x77[,5],state.x77[,3])
cor.test(state.x77[,5],state.x77[,4])

#######统计建模#######
#回归 regression 数据挖掘
#数据建模不是使用的等号方程 而是使用的相关性
women
plot(women$height,women$weight, type = "line")   #线性模型
fit <- lm(weight ~ height, data = women)   #y=3.45*x-87.52
summary(fit)
plot(fit)

newdata <- data.frame(height=c(73,60))
predict(object = fit, newdata = newdata )

#线性回归的函数
lm()
summary()
coef()
resid()
fitted()
predict() #根据模型预测新数据 

#评价模型：R方 pvalue 残差值

###########
state.x77 <- as.data.frame(state.x77)
colnames(state.x77)
fit <- lm(state.x77$Murder ~ state.x77$Population+state.x77$Income+state.x77$Illiteracy+state.x77$`Life Exp`+state.x77$`HS Grad`+state.x77$Frost+state.x77$Area, data = state.x77)
fit %>% summary()
fit2 <- lm(state.x77$Murder ~ state.x77$Population+state.x77$`Life Exp`, data = state.x77) #调整，排列组合了
fit2 %>% summary()

######建模估算基因组大小和基因多少的关系######
x <- read.csv("Rdata/prok_representative.csv")
colnames(x)
fit <- lm(x$Genes ~ x$Size, data = x)
summary(fit)      #y=843.7x+286.59

plot(x$Size,x$Genes, pch = 16, cex=0.8, xlab = "Genome Size", ylab = "Genes Numbers", main = "Genomesize with Gene Numbers") + 
  abline(fit, col="blue") +
  text(3.5, 10000, label = "y=843.7x+286.6 \n R2=0.9676")    #弄个大概扔到pdf中改就行了

x[x$Size>15,]
x[x$Size<5 & x$Genes>6000,]    #两个在直线之外的值
plot(x$Size,x$Genes, pch = 16, cex=0.8, xlab = "Genome Size", ylab = "Genes Numbers", main = "Genomesize with Gene Numbers") + 
  abline(fit, col="blue") +
  text(3.5, 10000, label = "y=843.7x+286.6 \n R2=0.9676") +
  text(10, 3000, label = "Corynebacterium striatum") +
  text(3.5, 5000, label = "Candidatus Burkholderia \n kirkii UZHbot1")

#######购物篮分析 关联规则######
install.packages("arules")
library(arules)
data("Groceries")
class(Groceries)
Groceries@itemInfo
#transaction 数据类型
inspect(Groceries)
###建模
fit <- apriori(Groceries, parameter = list(support=0.01, confidence=0.5))
summary(fit)
inspect(fit)

#######歌单########
class(audioscrobbler)
dim(audioscrobbler)
fit <- apriori(audioscrobbler, parameter = new("APparameter", support=0.0645))
inspect(fit)

########机器学习预测乳腺癌##########
x <- read.csv("Rdata/breast.csv", row.names = 1)
x <- x[,-1]
x$class <- as.factor(x$class)
levels(x$class) <- c("Benign", "Nalignant")

set.seed(1234)
train <- sample(699, 489) 
x.train <- x[train,]
x.validate <- x[-train,]
table(x.validate$class)
table(x.train$class)

#建模 逻辑回归 分类
fit <- glm(class~., data = x.train, family = binomial())
summary(fit)
coef(fit)

#验证模型
pred <- predict(fit, x.validate, type = "response")
pred
result <- factor(pred>0.5, levels = c(F,T), labels = c("Benign","Nalignant"))
table(x.validate$class)
table(result)

#生成混淆矩阵
table(x.validate$class, result)
#阳性 阴性 假阳 假阴




