rm(list=ls())
library(ggplot2)

## Read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")


## Get Baltimore emissions from motor vehicle sources
baltimore_emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
baltimore_emissions_aggr <- aggregate(Emissions ~ year, data=baltimore_emissions, FUN=sum)

## Generate the graph
png("C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot5.png")
ggplot(baltimore_emissions_aggr , aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()