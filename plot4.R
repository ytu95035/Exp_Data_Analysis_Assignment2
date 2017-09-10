# Yuling Tu Exploratory Data Analysis - Assignment 2 
# Plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008

#load ggplot2 library
library(ggplot2)
# Download the file into data folder
pm25 <- readRDS("~/R/coursera/data/summarySCC_PM25.rds") 
# look at the data sturcutre and sample
str(pm25)
# read classification code 
scc <- readRDS("~/R/coursera/data/Source_Classification_Code.rds")
str(scc)

# merge pm25 and ssc by ssc column
mrg <- merge(pm25, scc, by="SCC") 
# fetch all NEIxSCC records with Short.Name (SCC) Coal 
18 coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE) 
19 subsetNEISCC <- NEISCC[coalMatches, ] 

# save total emissions to yearsum variable
yeartype <- aggregate(Emissions ~ year + type, bal, sum)

png(filename='~/R/coursera/Exp_Data_analysis/Assignment2/plot3.png', width=600, height=500) 
# plot the chart to assignment2 folder 
g <- ggplot(yeartype, aes(year, Emissions, color = type)) 
g + geom_line(size=2) + xlab("Year") + ylab("Total PM2.5") +ggtitle("Baltimore City PM2.5 Sum by Year by Type") 

dev.off() 