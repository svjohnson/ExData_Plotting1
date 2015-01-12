## explore_data_analysis
## course project 1
## plot 3

        filename = "./data/household_power_consumption.txt" 
        file <- read.table(filename, 
                na.strings = "?",
                header=TRUE,
                sep=";")
        dt = data.frame(file)
        dt_1 = data.frame(dt)
        dt_1 = na.omit(dt_1)
        dt_1[, 1] = as.Date(dt_1[, 1], format = "%d/%m/%Y" )
        feb = c("01/02/2007", "02/02/2007")
        feb = as.Date(feb, format = "%d/%m/%Y" )
        
        # subsetting the relevant dates
        dt_feb1 = dt_1[which(dt_1$Date == feb[1]), ]
        dt_feb2 = dt_1[which(dt_1$Date == feb[2]), ]
        
        #  creating a new data.frame based on the dates
        dt_feb = data.frame(rbind(dt_feb1, dt_feb2))
        rm(feb, dt_feb1, dt_feb2)
        strptime(dt_feb[, 2], "%H:%M:%S")


# plot 3
        lin1 = dt_feb$Sub_metering_1
        lin2 = dt_feb$Sub_metering_2
        lin3 = dt_feb$Sub_metering_3
        legnd = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        
        plot(lin1, type = "l", ylab = "Energy sub metering", 
                xaxt="n", yaxt="n", 
                col = "gray18",
                ylim = c(0,40),  xlim = c(0,2881))
                
                lines(lin2, type = "l", col = "red")
                lines(lin3, type = "l", col = "blue")
        yaxis = c(0, 10, 20, 30)
        xaxis = c(1, 1440, 2880)
        xaxis_labels = c("Thu", "Fri", "Sat")
        axis(1, at = xaxis, labels = xaxis_labels)
        axis(2, at = yaxis, labels = yaxis)
        
        legend("topright", c(legnd[1], legnd[2], legnd[3]), 
                lty= c(1,1), lwd = c(2.5, 2.5),
                col = c("gray18", "red", "blue"),
                horiz=FALSE
                )