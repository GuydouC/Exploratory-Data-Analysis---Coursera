# Creating the Plot2
balt <- subset(NEI, fips == "24510")
balt <- tapply(balt$Emissions, balt$year, sum)
png('plot2.png')
barplot(balt, col = 'red',  main = 'Emission of PM2.5 (million of tons) in Baltimore City', xlab = 'Year', ylab = 'Emission', ylim = c(0, 3500))
dev.off()
