library(tidyverse)
library(lubridate)

data <- read_delim("household_power_consumption.txt",
                   delim = ";",
                   na    = c("?"),
                   col_types = list(col_date(format = "%d/%m/%Y"),
                                    col_time(format = ""),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number(),
                                    col_number())) %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     col  = "red",
     main = "Global Active Power")

# Save Plot ---------------------------------------------------------------

dev.copy(png, "plot1.png",
         width  = 480,
         height = 480)

dev.off()

rm(list = ls())
