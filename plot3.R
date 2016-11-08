# Draw plot 3 using with 3 lines each one for a sub metering value. Set weekday labels at the right positions.
plot(hpc_subset_plot2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n", col = "black")
lines(hpc_subset_plot2$Sub_metering_2, type = "l", col = "red")
lines(hpc_subset_plot2$Sub_metering_3, type = "l", col = "blue")
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

# Draw legend
legend("topright", lty = 1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"))

# Write plot into .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width=480, height=480, units = "px")
dev.off()


