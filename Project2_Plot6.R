NEI <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

vehicles <- grepl('vehicle', SCC$SCC.Level.Two, ignore.case = T)
SCC_Vehicles <- SCC[vehicles,]$SCC
NEI_Vehicles <- NEI[NEI$SCC %in% SCC_Vehicles,]
NEI_VehiclesBalt <- NEI_Vehicles[NEI_Vehicles$fips == '24510',]
NEI_VehiclesBalt$city <- 'Baltimore City'

NEI_VehiclesLA <- NEI_Vehicles[NEI_Vehicles$fips == '06037',]
NEI_VehiclesLA$city <- 'Los Angeles'

LABalt <- rbind(NEI_VehiclesLA, NEI_VehiclesBalt)

png('plot6.png', width = 480, height = 480, units = 'px', bg = 'transparent')
ggplot(LABalt, aes(x = factor(year), y = Emissions, fill = city)) + geom_bar(aes(fill = year), stat = 'identity') + facet_grid(scales = 'free', space = 'free', .~city) + labs(title = 'Comparison of Emissions in Baltimore City and Los Angeles ') + labs(x = 'Year', y = 'Emissions')
dev.off()
