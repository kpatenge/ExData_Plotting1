# Load data
hpc <- read.csv("~/data/household_power_consumption.txt", sep=";")

# Subset data using only dates 2007-02-01 and 2007-02-02. Date conversion done using as.Date()
hpc_subset <- subset(hpc, as.Date(Date,format = "%d/%m/%Y") == "2007-02-01" | as.Date(Date,format = "%d/%m/%Y") == "2007-02-02")

# Replace missing values coded as ? with NA
hpc_subset$Global_active_power[hpc_subset$Global_active_power == "?"] <- NA

# Convert values in Global_active_power into numeric
hpc_subset$Global_active_power <- as.numeric(as.character(hpc_subset$Global_active_power))

# Convert values in Date
hpc_subset$Date <- as.Date(hpc_subset$Date, format = "%d/%m/%Y")

# Plot histogram
hist(hpc_subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

# Write plot into .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width=480, height=480, units = "px")
dev.off()


