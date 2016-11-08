# Set directory

# Load data. Replace missing values coded as ? with NA.
hpc <- read.csv("data/household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

# Convert values
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time <- strptime(hpc$Time, "%H:%M:%S")

# Subset data for plot 1 using only dates 2007-02-01 and 2007-02-02. 
hpc_subset_plot1 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# Plot histogram
hist(hpc_subset_plot1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

# Write plot into .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width=480, height=480, units = "px")
dev.off()


