# Clear plot
try(dev.off(),silent=TRUE)
plot.new()

# Draw plot 4 using with 3 lines each one for a sub metering value. Set weekday labels at the right positions.
par(mfrow = c(2,2))

# Use data set and plot 4 diagrams
with(hpc_subset_plot2, {
    plot(Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
    axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
    plot(Voltage, type="l", ylab="Voltage", xlab = "datetime", xaxt = "n")
    axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
    plot(Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "black")
    lines(Sub_metering_2, type = "l", col = "red")
    lines(Sub_metering_3, type = "l", col = "blue")
    axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
    legend("topright", lty = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")
    plot(Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime", xaxt = "n")
    axis(1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
})

# Write plot into .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot4.png", width=480, height=480, units = "px")
dev.off()


