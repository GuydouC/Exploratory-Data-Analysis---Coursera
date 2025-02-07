# Creating the Plot2
summarySCC_PM25 <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- summarySCC_PM25
SCC <- Source_Classification_Code

# Working with the Data of Baltimore City
balt <- subset(NEI, fips == "24510")
balt <- tapply(balt$Emissions, balt$year, sum)

# Plotting the graph of Baltimore City - Emission
png('plot2.png')
barplot(balt, col = 'red',  main = 'Emission of PM2.5 (million of tons) in Baltimore City', xlab = 'Year', ylab = 'Emission', ylim = c(0, 3500))
dev.off()
