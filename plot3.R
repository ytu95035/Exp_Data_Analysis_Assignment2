# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 3
# Of the four types (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 

#load ggplot2 library
library(ggplot2)
# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
str(pm25)

# subset the data to Baltimore City, Maryland (fips == "24510") only
bal <- subset(pm25, pm25$fips=="24510")

# save total emissions to yearsum variable
yeartype <- aggregate(Emissions ~ year + type, bal, sum)

png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot3.png', width=600, height=500) 
# plot the chart to assignment2 folder 
g <- ggplot(yeartype, aes(year, Emissions, color = type)) 
g + geom_line(size=2) + xlab("Year") + ylab("Total PM2.5") +ggtitle("Baltimore City PM2.5 Sum by Year by Type") 

dev.off() 