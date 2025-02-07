# Creating the first plot - Total Emission of PM2.5 in the US
summarySCC_PM25 <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- summarySCC_PM25
SCC <- Source_Classification_Code
AnnualEmission <- tapply(NEI$Emissions, NEI$year, sum)
png('plot1.png')
barplot(AnnualEmission/1000000, col = 'red', main = 'Emission of PM2.5 (million of tons) per year in the US', ylab = 'Emission', xlab = 'Year', ylim = c(0, 8))
dev.off()
