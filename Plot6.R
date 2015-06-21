rm(list=ls())
library(ggplot2)
## Read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/Source_Classification_Code.rds")



## Get Baltimore emissions from motor vehicle sources and aggregate by year
baltimore_emissions<- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
baltimore_emissions_aggr<- aggregate(Emissions ~ year, data=baltimore_emissions, FUN=sum)

# Get Los Angeles County emissions from motor vehicle sources and aggregate by year
LA_emissions<- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
LA_emissions_aggr<- aggregate(Emissions ~ year, data=LA_emissions, FUN=sum)


baltimore_emissions_aggr$County <- "Baltimore City, MD"
LA_emissions_aggr$County <- "Los Angeles County, CA"
both_emissions <- rbind(baltimore_emissions_aggr, LA_emissions_aggr)

# Generate the graph
png("C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot6.png")
ggplot(both_emissions, aes(x=factor(year), y=Emissions, fill=County)) +
    geom_bar(stat="identity") + 
    facet_grid(.~ County) +
    ylab("total emissions (tons)") + 
    xlab("year") +
    ggtitle(expression("Motor vehicle emission variation\nin Baltimore and Los Angeles"))
dev.off()