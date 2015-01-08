library("graphics")
library("grDevices")
library("data.table")

#假设所需要的数据文件在当前工作目录下，并且命名为data.txt
data=fread("data.txt",sep=";",header=T)

data1=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-01 CST"),]
data2=data[which(strptime(data$Date, "%d/%m/%Y")=="2007-02-02 CST"),]

data3=rbind(data1,data2)

hist(as.numeric(as.character(data3$Global_active_power)),xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red",xlim=c(0,6),ylim=c(0,1200))
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()