library(readxl)
data <- read_excel("R/Joliet/Joliet 4-4-2017.xlsx", 
                              skip = 2)
sum(data$`City of Aurora`)
sum(data$`Vote By Mail`)


WillCounty <- st_read("~/R/Joliet/WillCountyGIS/WillCounty_Municipalities_042019.shp")


WillCounty <- st_read("~/R/Joliet/WillCountyGIS/WillCounty_PLSS.shp")

plot(WillCounty)
