# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 2
# strHave total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008

# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
str(pm25)

# subset the data to Baltimore City, Maryland (fips == "24510") only
bal <- subset(pm25, pm25$fips=="24510")

# save total emissions to yearsum variable
yearsum <- tapply(bal$Emissions, bal$year, sum)

# plot the chart to assignment2 folder 
png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot2.png', width=500, height=500) 

barplot(yearsum, col="blue", main="Baltimore City PM2.5 Sum by Year", xlab="Year", ylab="Total PM25") 

dev.off() 
