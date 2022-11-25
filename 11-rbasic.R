#====================================
#        ��ʮ������ʼʹ��R         #
#====================================
1+1
1+2
1+3
# ���ù���Ŀ¼
#windows "C:/Users/xxx/Desktop"
getwd()    
setwd("~/")
dir()

x <- plot(x = women$height,y = women$weight,col="red",pch=c(16,17,18),ann = F)

a <- 1
b <- 2
c <- a+b
c
print(c)
1.02 ** 365
0.98 ** 365
ls()
rm(a)
x <- runif(10000000,min = 1,max = 100)
length(x)
sum(x)
mean(x)
var(x)
sd(x)
median(x)
range(x)
abs(x)
sqrt(x)

#====================================
#       ��ʮ�ġ�R������             #
#====================================

# R ���԰�����
.libPaths()  
#��4.0 ��Ŀ¼���Ƶ�.libPaths()�õ��Ľ����  
# R ���԰�����
#ѡ����ھ���վ��
chooseCRANmirror()
chooseBioCmirror()
setRepositories()

#�鿴R����װĿ¼
.libPaths()  

#��װvcd��
install.packages("vcd")
install.packages("plotrix")
install.packages("vioplot")
install.packages("venn")
install.packages("RColorBrewer")
install.packages("ggplot2")
install.packages("ggExtra")
install.packages("gcookbook")
install.packages(c("carData","gridExtra"))
install.packages("ggsci")
install.packages("ggpubr")
install.packages("ggthemes")
install.packages(c("Rwordseg","wordcloud2"))
install.packages("pheatmap")
install.packages("qqman") 
install.packages("maps")
install.packages("factoextra")
install.packages("circlize")
install.packages(c("FactoMineR", "ggfortify"))


#�鿴�Ѱ�װ�İ�
installed.packages()

#����R��
library(vcd)
require(vcd)

#����������
update.packages()

#ɾ����չ��
remove.packages("vcd")

#�鿴��ǰ������Щ������
find.package()
path.package()

#ȡ�����ذ�
detach("package:vcd")

#����R����������
.Library
.Library.site
search()
(.packages())#�г���ǰ��
path.package() #�г����ذ���·��
(.packages(all.available=TRUE))#�г���Ч��

#�鿴�����ĵ�
  help()  
?ggplot2  
??heatmap  
help( package="ggplot2" )  
example("heatmap")  
browseVignettes()  
ls(package:base)


# bioconductor����װ

chooseBioCmirror()  
if (!requireNamespace("BiocManager"))
  install.packages("BiocManager")
BiocManager::install()
library()

#R��Ǩ��
#����A�豸�ϵ�R�������б���
oldip <- installed.packages()[,1]
save(oldip,file = "installedPacckages.Rdata")
#��B�豸�Ͻ��а�װ��
load("installedPacckages.Rdata")
newip <- installed.packages()[,1]
for (i in setdiff(oldip,newip)) {
  install.packages(i)
}


#====================================
#        ��ʮ�塢�ļ�����           #
#====================================

#3 ��д�ļ�
dir()  
#���ù���Ŀ¼
dta <- read.table("Rdata/CountMatrix.csv")  

dta <- read.table(file = "Rdata/CountMatrix.csv",header = T,sep = ",")  
dta <- read.csv(file = "Rdata/CountMatrix.csv",header = T,row.names = 1)  
dta <- read.csv(file = "Rdata/CountMatrix.csv",header = T,sep = ",",row.names = 1,na.strings = "NA",stringsAsFactors = F)  
class(dta)  
head(dta)  
tail(dta)  
rownames(dta)  
colnames(dta) 
View(dta)

#4 д���ļ�
write.csv(x = dta,file = "matrix.csv",sep = ",",append = F) 

#5 ��дexcel�ļ�
#��װopenxlsx��
#install.packages("openxlsx")
library(openxlsx)
x <- read.xlsx("Rdata/vlookup.xlsx",sheet = 1)
write.xlsx(x = dta,sheetName = "dta",file = "dta.xlsx",append = F)


#6 ��дR�ļ�
?iris
head(iris)
getwd()
saveRDS(iris,file="iris.RDS")
rdsdata <- readRDS("iris.RDS")
#Write RData file
save(iris,iris3,file = "iris.Rdata")
save.image()
load(file = "iris.Rdata")


#====================================
#       ��ʮ�������ݽṹ              #
#====================================
# R�������ݼ�
# ��ʾ�����������ݼ�
data()
#������չ�����ݼ�
data(package = "MASS") 
data(package = "ggplot2")

#R��������
rivers
euro
plot(rivers)  
hist(rivers)  
names(euro)  
length(euro)  
a <- c(1,2,3)  
#�ַ�������
b <- c("red","green","blue")  
#��������������
c <- seq(1,100,2)  
d <- rep(c(1,2),5)  
class(a)  
typeof(a)  


# ����������  
a  
a*2  
paste(b,a,sep = "-")  

# ����������
a
a*2
paste(b,a,sep = "-")

#��������
x <- runif(10000000,min = 1,max = 100)  
length(x)  
sum(x)  
mean(x)  
var(x)  
sd(x)  
median(x)  
range(x)  
abs(x)  
sqrt(x)  
a <- 1:5
b <- 10:1
a+1
a*2
a+b

# ʵ����������Ⱦɫ�峤�ȷֲ�ͼ
hg19_len <- read.csv(file = "Rdata/homo_length.csv",header = T,row.names = 1)
hg19_24 <- hg19_len[1:24,]   
barplot(height = hg19_24)  
barplot(height = hg19_24,names.arg = names(hg19_24))  
library(RColorBrewer)  
cols <- brewer.pal(n = 6,name = "Set1")  
barplot(height = hg19_24,names.arg = names(hg19_24),col = cols) 

#5����Matrix����һ�����ճ����������еĸ�����ʵ�����ϡ�������һά�ģ��������Ƕ�ά�ģ���Ҫ���к��С�
state.x77
m <- matrix(1:20,nrow = 4,ncol = 5)
rowSums(state.x77)
colMeans(state.x77)
cor(state.x77)

#====================================
#        2����ͼ                    #
#====================================
#1 heatmap()
#2 gplots �� heatmap.2()
#3 pheatmap�� pheatmap
#4 ComplexHeatmap��

example("heatmap")
m <- read.csv("Rdata/heatmap.csv",header = T,row.names = 1)
class(m)
x <- as.matrix(m)
heatmap(x)
heatmap(t(x))
heatmap(x,col=c("green","red"))
yanse <- colorRampPalette(c("red","black","green"))(nrow(x))
heatmap(x,col=yanse)
heatmap(x,col=yanse,RowSideColors = yanse)
heatmap(x,col=yanse,ColSideColors = colorRampPalette(c("red","black","green"))(ncol(x)))
heatmap(x,col=yanse,Rowv = NA)
heatmap(x,col=yanse,Rowv = NA,Colv = NA)
heatmap(state.x77)
heatmap(state.x77,scale = "col")

#����pheatmap������ͼ
#install.packages("pheatmap")
library(pheatmap)
x <- read.csv("Rdata/heatmap.csv",header = T,row.names = 1)
class(x)
pheatmap(x)
annotation_col <- data.frame(CellType=factor(rep(c("N1","T1","N2","T2"),each=5)))
rownames(annotation_col) <- colnames(x)
pheatmap(x,annotation_col = annotation_col)
pheatmap(x,annotation_col = annotation_col,display_numbers = T)
pheatmap(x,annotation_col = annotation_col,display_numbers = T,number_format = "%.2f")
pheatmap(x,annotation_col = annotation_col,display_numbers = T,number_format = "%.1f",number_color = "black")
#6 ���ݿ�
mtcars
iris
adata <- data.frame(state.name,state.division,state.area)
str(adata)

#6.2 ���ݿ�����
euro[1:3]  
euro[-(1:3)]  
euro["ATS"]  
mtcars[1:4,1:5]  
mtcars[c(2,3,4,5)]  
mtcars$mpg  
mtcars["Mazda RX4",]  
alist <- list(euro,iris,mtcars)  
alist[1]  
alist[[1]]  
x <- runif(100,min = 1,max = 100)  
x[x>50]  
x [x>20 & x <40] 

#6.3 ����Rʵ��vlookup����
#=VLOOKUP($A2,Sheet1!$A$1:$I$201,COLUMN(Sheet1!A2),FALSE)

#����200��������б� bigtable  
genes200 <- read.csv("Rdata/200genes.csv",header = T,stringsAsFactors = F)  

#����121�������list small list  
genes121 <-  read.csv("Rdata/121genes.csv",header = T,stringsAsFactors = F)  
head(genes200)  
head(genes121)  
genes200["CLU",]  

#�޸�gene table����  
rownames(genes200) <- genes200$gene  
genes200["CLU",]  
genes200[c("CLU","DCN"),]  
#ȥ���ظ�gene ID  
gene93 <- unique(genes121$gene)  
#�������ݿ�ķ��ʹ��ܣ�һ��ʵ��Excel Vlookup����  
dta <- genes200[gene93,]  
dta  
#�����а���û�м�������gene ID������ֵΪNA������na.omitɾ������NA����  
dta <- na.omit(dta)  
rownames(dta) <- 1:nrow(dta)  
write.csv(dta,file = "Rdata/gene93.csv",row.names = F) 


#7 ����
state.division  
state.region  
table(state.division)  
afactor <- factor(c("blue","red","red","green","red","blue"),levels = c("red","green","blue","yellow"))  
bfactor <- factor(letters[1:5], labels = c("one","two","three","four","five"))

#8 �б�
state.center
alist <- list(euro,state.x77,iris)

#9 ʱ������
co2  
presidents 

#10 ȱʧ����
x <- c(1:10,NA)
sum(x)
sum(x,na.rm = T)
is.na(x)
#install.packages("VIM")  
library(VIM)  
data(sleep,package = "VIM")  
na.omit(sleep) 

#====================================
#        ��ʮ�ߡ����ݴ���           #
#====================================
#1 �ж���������
x <- c(1:100)  
#�ж���������  
is.vector(x)  
is.character(x)  

#ת����������  
as.character(x)  
is.numeric(mtcars$cyl)  
as.factor(mtcars$cyl)  

#��ͬ�������ͻ�ͼ�����ͬ  
plot(as.numeric(mtcars$cyl))  
plot(as.factor(mtcars$cyl)) 

#2 �޸���������
#rbind,cbind  
state <- cbind(as.data.frame(state.x77),state.region)  
tapply(state$Population, state$state.region, mean)  
a <- head(mtcars,20)  
b <- tail(mtcars,20)  
c <- rbind(a,b)  
length(rownames(c))  
duplicated(c)  
c[duplicated(c),]  
c[!duplicated(c),]  
unique (c)  

#ȡ�Ӽ�subset
dta <- read.csv("Rdata/gene93.csv",header = T)  
dta  
#���˵�û�б����ת¼��  
dta1 <- subset(dta,rowSums(dta[2:9])>1)


#3 ��ͬ������ת��
#�����;���֮���໥ת��������������ά�ȡ�
x <- c(1:10)
dim(x) <- c(2,5)
#���������ݿ�֮���໥ת����data.frame��cbind��rbind������ת��Ϊ���ݿ�ȡ�����ݿ��ÿһ��Ϊһ��������
state <- data.frame(state.name,state.abb,state.division,state.area)
#���ݿ�;���֮���໥ת����
#as.matrix()�����ݿ�ת��Ϊ����
iris.mat <- as.matrix(iris[1:4])
#as.data.frame()����ת��Ϊ���ݿ�
state <- as.data.frame(state.x77)
#����������֮���໥ת����as.factor()������
mtcars$cyl <- as.factor(mtcars$cyl)
#�޸����ӵ�ˮƽ�ͱ�ǩ��
mtcars$cyl <- factor(mtcars$cyl,levels = c(4,6,8),labels = c("four","six","eight"))

#4 �������
x <- runif(n=100,min = 1,max = 100)
round(x,digits = 0)
sample(x,10,replace = F)
sample(x,10,replace = T)
set.seed(1234)
sample(x,10,replace = F)

#5 ����R���Զ�����
type <- c("red","spades","cube","plum")
amount <- c("A",2:10,"J","Q","K")
group <- expand.grid(type,amount)
poker <- paste(group$Var2,group$Var1,sep = "-")
poker
poker[c(53,54)] <- c("black Joker)","red Joker")
shuffle <- sample(poker,54,replace = F)
one <- shuffle[c(T,F,F)]
two <- shuffle[c(F,T,F)]
three <- shuffle[c(F,F,T)]

#6 ����
#һά��������
sort(rivers)  
order(rivers)  
rivers[order(rivers)]  
sort(rivers,decreasing = T)
rev(sort(rivers))  

#�Զ�ά���ݽ�������  
#sort(mtcars)  
#order(mtcars)  
order(mtcars$mpg)  
mtcars[order(mtcars$mpg),]  

#ͬʱ������������  
mtcars[order(mtcars$mpg,mtcars$cyl),]  
#��������  
mtcars[order(mtcars$mpg,-mtcars$gear),]  

#7 ɸѡ
rivers > 100
rivers[rivers>100]
rivers[rivers >100 & rivers < 500]
rivers[rivers==900]
which.max(rivers)
which.min(rivers)
which(rivers==320)
who <- read.csv("Rdata/WHO.csv",header = T)
who1 <- who[c(1:50),c(1:10)]
who2 <- who[c(1,3,5,8),c(2,14,16,18)]
who3 <- who[which(who$Continent==7),]
who4 <- who[which(who$CountryID>50 & who$CountryID<=100),]
#subset
?subset
who3=subset(who,who$CountryID>50 & who$CountryID<=100)

#8 ����͸�ӱ�
data("mtcars")
apply(mtcars,2,sum)  
apply(iris[1:4], 2, sd)  
lapply(state.center,mean)  
state.name  
state.division  
tapply(state.name,state.division,length)
