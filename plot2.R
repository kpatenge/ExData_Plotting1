# Add new column with weekdays to subset for plot 1
hpc_subset_plot1$Weekday <- weekdays(hpc_subset_plot1$Date, abbreviate = TRUE)

# Subset data for plot 2 using only data from weekdays Thu and Fri
hpc_subset_plot2 <- subset(hpc_subset_plot1, Weekday == "Thu" | Weekday == "Fri")

# Count number of values for Thursday and Friday
test <- hpc_subset_plot2$Weekday
length (which(test == "Thu"))
length (which(test == "Fri"))

# Draw plot using lines. Set weekday labels at the right positions.
plot(hpc_subset_plot2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

# Write plot into .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width=480, height=480, units = "px")
dev.off()


