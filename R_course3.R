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




