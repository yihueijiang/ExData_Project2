rm(list=ls())
library(ggplot2)

##read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/Source_Classification_Code.rds")


## Extract coal combustion-related sources
combustion_coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion_coal_sources <- SCC[combustion_coal,]

## Extract emissions from coal combustion-related sources
emissions <- NEI[(NEI$SCC %in% combustion_coal_sources$SCC), ]

## Aggregate by year
emissions_year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

## Generate the graph
png("C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot4.png")
ggplot(emissions_year, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    ggtitle("Emissions from coal combustion-related sources")
dev.off()