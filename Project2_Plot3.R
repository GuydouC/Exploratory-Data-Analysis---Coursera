# Creating the Plot3
NEI <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

# Working with the data of Baltimore City
balt <- subset(NEI, fips == '24510')

# Plotting the plot of the Emission in Baltimore City per Source
png("plot3.png",width=480,height=480,units="px",bg="transparent")
ggplot(balt, aes(factor(year), Emissions, fill = type)) + geom_bar(stat = 'identity') + facet_grid(.~type) + labs(title = 'Emission of PM2.5 in Baltimore City by type (Million of tons)') + labs(x = 'Year', y = 'Emissions of PM2.5')
dev.off()
