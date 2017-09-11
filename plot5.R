# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#load ggplot2 library
library(ggplot2)
# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
str(pm25)
# subset the data to Baltimore City, Maryland (fips == "24510") only
bal <- subset(pm25, pm25$fips=="24510")
# read classification code 
scc <- readRDS("~/R/coursera/data/Source_Classification_Code.rds")
str(scc)

# merge bal and ssc by ssc column
mrg <- merge(bal, scc, by="SCC") 
# fetch records with SCC.Level.One=="Mobile Sources"
motoronly <- subset(mrg, mrg$SCC.Level.One=="Mobile Sources")

yearmotor <- tapply(motoronly$Emissions, motoronly$year, sum)

# plot the chart to assignment2 folder 
png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot5.png', width=500, height=500) 

barplot(yearmotor, col="blue", main="Mobile Sources PM2.5 by Year", xlab="Year", ylab="Total PM25") 

dev.off() 