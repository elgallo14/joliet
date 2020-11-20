library(readr)
library(ggmap)
library(osmdata)

data <- read_excel("FOIA_-_R012118-052420.xlsx")

#register_google(key = "AIzaSyDyef2UHbEIzkU3E_2O5WsEuMxnUuhz70Y", write = TRUE)

data$address <- paste(data$`LOC NO`, data$`LOC STREET`, data$`LOC CITY`, data$`LOC STATE`, data$`LOC ZIP`)

data <- mutate_geocode(data, location = address, output = "latlona")

write.csv(data, file = "Joliet Business Data GPS 05242020.csv")

##

map <- getbb("joliet Illinois")

jolietmap <- get_map(map)

ggmap(jolietmap) + 
  stat_density2d(data =data, aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
                 geom = "polygon", size = 1, bins = 10) +
  scale_fill_gradient(low = "red", high = "green") +
  scale_alpha(range = c(0, 3), guide = FALSE)
