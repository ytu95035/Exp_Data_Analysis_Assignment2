# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
str(pm25)

#PM25 file is suffient for 1. question
# save total emissions to yearsum variable
yearsum <- tapply(pm25$Emissions, pm25$year, sum)

# plot the chart to assignment2 folder 
png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot1.png', width=500, height=500) 

barplot(yearsum, col="blue", main="PM2.5 Sum by Year", xlab="Year", ylab="Total PM25") 

dev.off() 
