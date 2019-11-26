tempcsv <- read_csv('data/onamet_temp_anual.csv')
st_as_sf(tempcsv %>% select(-longitud, -latitud, -altura) %>% rename(X=xutmwgs84, Y=yutmwgs84, tanual=anio), coords = c('X','Y')) %>% st_set_crs(crsdestino) %>%  st_write('data/onamet_temp_anual.gpkg', driver='GPKG')
