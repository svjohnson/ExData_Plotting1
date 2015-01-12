## explore_data_analysis
## course project 1
## plot 2

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

# plot 2
        y = dt_feb$Global_active_power
        plot(y, type = "l", ylab = "Global Active Power (kilowatts)", 
                xaxt="n", ylim = c(0,8), xlim = c(0,2881)
                ) 
        # setting axis parameters
        xaxis = c(1, 1440, 2880)
        xaxis_labels = c("Thu", "Fri", "Sat")
        axis(1, at = xaxis, labels = xaxis_labels)