NEI <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

# Question 4
## Extracting data relate to coal
coal <- grepl('coal', SCC$EI.Sector, ignore.case = T)
SCC_coal <- SCC[coal,]
NEI_coal <- merge(NEI, SCC_coal, by = 'SCC')
coalSum <- tapply(NEI_coal$Emissions, NEI_coal$year, sum)
coalSum <- as.data.frame(coalSum)
names(coalSum)[1] <- 'Emissions'
rownames(coalSum) <- c(1:4)
coalSum$year <- c(1999, 2002, 2005, 2008)

## Plotting the total Emissions from coal in the USA
png('plot4.png', width = 480, height = 480, bg = 'transparent')
ggplot(coalSum, aes(x = year, y = Emissions/10000)) + geom_bar(stat = 'identity') + labs(title = 'Total Emission from Coal in the USA', x = 'Year', y = 'Emissions')
dev.off()
