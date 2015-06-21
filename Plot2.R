rm(list=ls())

## read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")
NEI_Baltimore<-subset(NEI,NEI$fips=="24510")

# Aggregate by year
Agg_Baltimore<- aggregate(NEI_Baltimore[,4], by=list(NEI_Baltimore$year), FUN=sum)


# Generate the graph in the same directory as the source code
png(filename='C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot2.png')
barplot(Agg_Baltimore$x/10^6, names.arg=Agg_Baltimore$Group.1,
main=expression(paste('Total Emissions of PM', ''[2.5],' from Baltimore')),
xlab='Year', ylab=expression(paste('Emissions of PM', ''[2.5], '  (10^6 Tons)')))
dev.off()