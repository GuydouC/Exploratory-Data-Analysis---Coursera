NEI <- readRDS("~/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

Vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = T)
SCC_Vehicles <- SCC[Vehicles,]$SCC
NEI_Vehicles <- NEI[NEI$SCC %in% SCC_Vehicles,]
NEIBaltVehicles <- NEI_Vehicles[NEI_Vehicles$fips == "24510",]

# Plotting the Project2_Plot5
png("plot5.png",width=480,height=480,units="px",bg="transparent")
ggplot(NEIBaltVehicles, aes(factor(year), Emissions, fill = year)) + geom_bar(stat = 'identity') + labs(title = 'Emission from Motor Vehicles in Baltimore City') + labs(x = 'Year', y = 'Emission')
dev.off()
