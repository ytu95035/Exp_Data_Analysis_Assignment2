# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

#load ggplot2 library
library(ggplot2)
# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
# str(pm25)
# subset the data for bot Baltimore City, Maryland (fips == "24510") 
# and Los Angeles, California (fips == "06037") 
both <- subset(pm25, pm25$fips %in% c("24510","06037"))

# read classification code 
scc <- readRDS("~/R/coursera/data/Source_Classification_Code.rds")
# str(scc)

# merge bal and ssc by ssc column
mrg <- merge(both, scc, by="SCC") 

# fetch records with SCC.Level.One=="Mobile Sources"
motorboth <- subset(mrg, mrg$SCC.Level.One=="Mobile Sources")

yearcity <- aggregate(Emissions ~ year + fips, motorboth, sum)

# add a new column to for ease read city name
yearcity$city <- ifelse(grepl("06037", yearcity$fips), "Los Angeles", 
                  ifelse(grepl("24510", yearcity$fips), "Baltimore City", "Other"))

# plot the chart to assignment2 folder 
png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot6.png', width=500, height=500) 

g <- ggplot(yearcity, aes(year, Emissions, color = city)) 
g + geom_line(size=3) + xlab("Year") + ylab("Total PM2.5") +ggtitle("PM2.5 Compare by Year by City")

dev.off() 