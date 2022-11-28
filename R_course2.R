########数据处理 tidyr dpylr#######
#数据转换
#is 判断 as 转换
as.factor(mtcars$cyl)
mtcars[mtcars$mpg>=20,]
mtcars[mtcars$mpg>=20 & mtcars$cyl==4,]

########排序######
sort(rivers)
sort(rivers, decreasing = T)
order(rivers)
rivers[order(rivers)]
#order比sort更有用，可以得到排名数字,也就是位置信息
mtcars[order(mtcars$mpg, decreasing = T),]
mtcars[order(mtcars$cyl, mtcars$mpg,decreasing = T),]
mtcars[order(mtcars$cyl, mtcars$mpg,decreasing = c(T,F)),]    #也可以分别升降序

#############数据筛选质控#######
x <- read.csv("Rdata/CountMatrix.csv", header = T, row.names = 1)
x <- x[,c(1,3,5,7,2,4,6,8)]
y <- apply(x, 2, sum)
x["ctotal",] <- y
z <- rowSums(x)
x <- cbind(x,rtotal=z)
x <- x[apply(x,1,sum)>0,]
dim(x)

#一个矩阵拿出一行还是一个矩阵，拿出一列就是一个向量

######随机抽样以及数据探索########
x <- 1:10
sample(x, size = 5, replace = F)   #x必须是向量，size抽多少，replace表示是否放回后抽样
#随机数种子可以保证抽样一样
#斗地主
type <- c("red","spades","cube","plum")
x <- c(2:10, "A","J","Q","K")
poker <- paste(rep(type, 13), rep(x,4))
poker <- c(poker, "JOKER", "Joker")

expand.grid(type,x)#这个函数也可以

shuffle <- sample(poker, 54, replace = F)
dipai <- shuffle[52:54]
shuffle <- shuffle[-(52:54)]
one <- shuffle[c(T,F,F)]
two <- shuffle[c(F,T,F)]
three <- shuffle[c(F,F,T)]

########探索数据#######
WHO <- read.csv("Rdata/WHO.csv", row.names = 1)
class(WHO)
dim(WHO)
colnames(WHO)
rownames(WHO)

colnames(WHO)[grep(pattern = "^Pop", colnames(WHO))]
sort(WHO$Population_total, decreasing = T)

x <- head(WHO[order(WHO$Population_total, decreasing = T),])

sum(WHO$Population_total, na.rm = T)

y <- head(WHO[order(WHO$Sugar_per_person, decreasing = T),])

######数据透视表#####
library(openxlsx)
city <- read.xlsx("Rdata/2015.xlsx", rowNames = T)
x <- factor(city$Province)
table(x)
city$Province <- x
tapply(city$Income, city$Province, mean)   #tapply是分组计算

#######tidyverse######
install.packages("tidyverse")
library(tidyverse)
#整洁数据 tidy data,也就是行是观测，列是变量
#稀疏矩阵（0占了绝大部分）， 稠密矩阵
#tidyr::  这样可以指定某个包的某个函数

tdata <- mtcars[1:10,1:3]
gather(tdata)

table4a
x <- pivot_longer(table4a,cols = 2:3,names_to = "year", values_to = "cases")
pivot_wider(x, names_from = "year", values_from = "cases")

table2
pivot_wider(table2,names_from = "type", values_from = "count")

billboard
pivot_longer(billboard, cols = starts_with("wk"), names_to = "week", values_to = "sales", values_drop_na = T)

#######dpylr######
#筛选、排序、去重复、抽样、分组计算、集合计算
library(dplyr)

dplyr::filter(mtcars, mpg>21)
dplyr::filter(mtcars, mpg>21, cyl==6)
dplyr::arrange(mtcars, mpg)  #加负号

#管道 %>% ctrl+shift+m
mtcars %>% dplyr::filter(mpg>20) %>% dplyr::arrange(-mpg,-cyl)

dplyr::select(iris, starts_with("Sep"))  #正则表达式筛选 end_with

mtcars %>% dplyr::sample_n(10)    #抽样

mtcars %>% dplyr::mutate(mpg10=mpg*10)  #只能加列

x <- read.xlsx("Rdata/2015.xlsx", rowNames = T)
x %>% group_by(Province) %>% summarise(Income_all = sum(Income)) %>% dplyr::arrange(-Income_all)   #分组计算

a <- data_frame(x1=c("A","B","C"), x2=1:3)
b <- data.frame(x1=c("A","B","D"), x3=c(T,F,T))
full_join(a,b)
anti_join(a,b)
anti_join(b,a)
inner_join(a,b)
left_join(a,b)   #指定按照哪一列合并，哪一列就不变
left_join(b,a)
right_join(a,b)

first <- slice(mtcars, 1:20)
second <- slice(mtcars, 10:30)
intersect(first,second)
setdiff(first,second)
setdiff(second,first)
union_all(first,second) %>% dim()
union(first, second) %>% dim()






