########数据处理#######
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


