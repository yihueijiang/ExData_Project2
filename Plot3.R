rm(list=ls())
library(ggplot2)

## read data
NEI <- readRDS("C:/Users/Yi-Huei/Desktop/Project2/Data/summarySCC_PM25.rds")
NEI_Baltimore<-subset(NEI,NEI$fips=="24510")

# Aggregate by year and type
baltimore <- NEI[NEI$fips=="24510",]
baltimore_emissions_aggr <- aggregate(Emissions ~ year + type,
                                  data=baltimore,
                                  FUN=sum)


# Generate the graph in the same directory as the source code
png(filename='C:/Users/Yi-Huei/Desktop/Project2/ExData_Project2/Plot3.png')
ggplot(baltimore_emissions_aggr, aes(x=factor(year), y=Emissions, fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(. ~ type) +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emission")) +
    ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                       "City by various source types", sep="")))
dev.off()
