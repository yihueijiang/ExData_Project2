rm(list=ls())

## read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")


# Aggregate by year
Agg_Emissions<- aggregate(NEI[,4], by=list(NEI$year), FUN=sum)


# Generate the graph in the same directory as the source code
png(filename='C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot1.png')
barplot(Agg_Emissions$x/10^6, names.arg=Agg_Emissions$Group.1,
main=expression(paste('Total Emissions of PM', ''[2.5],' from all sources')),
xlab='Year', ylab=expression(paste('Emissions of PM', ''[2.5], '  (10^6 Tons)')))
dev.off()