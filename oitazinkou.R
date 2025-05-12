# 必要なライブラリ
library(leaflet)

# 大分県の主要都市とその緯度、経度、人口
cities <- data.frame(
  name = c("大分市", "別府市", "日田市", "由布市", "杵築市"),
  lat = c(33.2382, 33.3823, 33.3193, 33.2905, 33.3977),
  lng = c(131.6126, 131.4900, 130.9515, 131.3111, 131.4670),
  population = c(475000, 120000, 65000, 55000, 25000)  
)


cities$color <- colorRampPalette(c("green", "yellow", "red"))(length(cities))[rank(cities$population)]

# 人口をプロット
leaflet(data = cities) %>%
  addTiles() %>%
  addCircles(
    lng = ~lng, lat = ~lat,
    weight = 1,
    radius = ~population * 0.05,  
    color = ~color, fillOpacity = 0.6, 
    popup = ~paste0(name, "<br>人口: ", population, "人")
  ) %>%
  setView(lng = 131.6, lat = 33.3, zoom = 9) 

