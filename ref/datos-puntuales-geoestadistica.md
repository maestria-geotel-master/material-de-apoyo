
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Datos puntuales, geoestadística.

## Geoestadística

### Definición

La geoestadística se ocupa en modelar, predecir y simular fenómenos
espacialmente continuos. En realidad, lo que aborda es la obtención de
valores en lugares no muestreados. Dado que es imposible tomar muestras
en todas partes, la geoestadística asiste en la predicción espacialmente
continua del valor de una variable.

### Kriging

Considera un fenómeno *Z(s)*, muestreado en *s<sub>i</sub>*, con
*i=1,2,3,…,n*, pero nos interesa su valor en todas las localidades,
*s<sub>0</sub>*; debemos predecir *s<sub>0</sub>*, lo cual realizaremos
de manera habitual con el método del krigeaje (krigeado o **kriging**),
que consiste en una predicción Gaussiana.

Existen varias modalidades de krigeaje según los distintos supuestos
(todas asumen que la variación espacial es modelizable mediante el
variograma), siendo las más comunes las siguientes:

  - **Kriging ordinario**. Asume **media constante y desconocida** en el
    entorno próximo de la observación *s<sub>i</sub>*. **No se asume que
    la media local tenga el mismo valor que la media poblacional**, es
    decir, no hay requisito de estacionariedad de primer momento. Dada
    las pocas asunciones que requiere en su implementación, y por su
    aproximación más conservadora, es muy empleado en varias
    disciplinas.

  - **Kriging simple**. **Asume estacionariedad de primer momento**
    (media constante) en el dominio analizado, pero la media poblacional
    es conocida.

  - **Kriging universal**. Asume una **tendencia general modelizada por
    polinomio**, como por ejemplo, un modelo lineal.

### Semivarianza y variograma

El kriging utiliza un modelo para ponderar las observaciones cercanas a
*s<sub>0</sub>* denominado variograma o semivariograma. El variograma es
el gráfico de representación de estimaciones de la semivarianza γ; esta
última mide el grado de dependencia espacial entre muestras. En la
medida en que aumenta la distancia entre pares de observaciones, se
asume que la semivarianza aumenta igualmente. Observaciones cercanas
obtendrán semivarianzas pequeñas, puesto que si existe autocorrelación
espacial, observaciones cercanas serán muy parecidas.

Las estimaciones de la semivarianza se obtienen a partir de la fórmula:

<figure>

<img src="../img/variograma-formula.png" width="600">

</figure>

*Tomado de Pebesma & Bivand (2019)*

Donde *h<sub>i</sub>=\[h<sub>i,0</sub>,h<sub>i,1</sub>\]* es el
intervalo de distancia para *i* y *N(h<sub>i</sub>)* es el número de
pares de muestras disponibles para *i* en el intervalo *h<sub>i</sub>*,
*z(s<sub>i</sub>)* es el valor de la variable en *i*, y
*z(s<sub>i</sub>)+h’* el valor de la variable a la distancia *h’* desde
*i*.

En realidad, los programas de computo de la semivarianza utilizan un
diseño geométrico de búsqueda basado en *lags* que se fijan de
incrementalmente de acuerdo al tamaño de intervalo. Aunque la anchura de
búsqueda es fija, los *lags* pueden ser múltiples, lo que complica
significativamente los cálculos.

![](../img/esbozo-de-parametros-variograma.png)

*Tomado de
<http://geostatisticslessons.com/pdfs/variogramparameters.pdf>*

Como podrás sospechar, en la medida en la que aumenta el número de
observaciones, el número de posibles pares se incrementa
exponencialmente, más aun si se aumenta la distancia máxima de búsqueda
y la anchura de intervalo. Calcular la semivarianza es muy tedioso si se
realiza para muestras grandes. Dado que la capacidad de cómputo no es
una limitante hoy en día, se puede calcular la semivarianza para muchos
pares de muestras, y representar cómo ésta cambia con la distancia, lo
cual se denomina semivariagrama muestral. Para realizar una predicción
razonable, necesitamos un modelo para ponderar las observaciones.
Utilizando el variograma muestral, ajustamos un variograma modelo que
utilizaremos como función para establecer los pesos.

![](../img/variograma-muestral-modelo.png) *Tomado de Hengl (2009)*

Se utilizan distintos variogramas modelo, siendo los más comunes el
exponencial y el esférico.

<figure>

<img src="../img/variogramas-exponencial-esferico.png" width="600">

</figure>

  
*Tomado de Alperín, Borges, & Sarandón (2002)*

Además de los anteriores, R dispone de los modelos comunes de
variograma:

``` r
library(gstat)
show.vgms()
```

<img src="../img/variogramas-modelo-1.png" width="100%" />

``` r
vgm()
##    short                                      long
## 1    Nug                              Nug (nugget)
## 2    Exp                         Exp (exponential)
## 3    Sph                           Sph (spherical)
## 4    Gau                            Gau (gaussian)
## 5    Exc        Exclass (Exponential class/stable)
## 6    Mat                              Mat (Matern)
## 7    Ste Mat (Matern, M. Stein's parameterization)
## 8    Cir                            Cir (circular)
## 9    Lin                              Lin (linear)
## 10   Bes                              Bes (bessel)
## 11   Pen                      Pen (pentaspherical)
## 12   Per                            Per (periodic)
## 13   Wav                                Wav (wave)
## 14   Hol                                Hol (hole)
## 15   Log                         Log (logarithmic)
## 16   Pow                               Pow (power)
## 17   Spl                              Spl (spline)
## 18   Leg                            Leg (Legendre)
## 19   Err                   Err (Measurement error)
## 20   Int                           Int (Intercept)
```

Los elementos de un variograma son los siguientes (según Alperín et al.
(2002)):

  - Efecto “pepita” (*nugget*): corresponde a la variabilidad aleatoria
    inherente \[variabilidad inframuestra, imposible de detectarse con
    la espaciación elegida en el diseño muestral\].

  - Rango (*range*), rango de influencia, alcance: corresponde a la
    distancia a la cual las muestras se tornan independientes, es la
    distancia donde se alcanza la meseta.

  - Meseta (*psill*): correspondiente a la varianza estructural.

### ¿Cómo interpretar un variograma?

La principal tarea al generar un variograma consiste en detectar
autocorrelación espacial, es decir, relación entre observaciones debido
a la estructrura espacial. Si existe autocorrelación, ésta podrá
modelizarse adecuadamente mediante un variograma modelo.

El variograma de una variable autocorrelacionada espacialmente muestra
un incremento gradual de la semivarianza hasta que se alcanza la meseta
en el rango (concretamente, al alcanzar el 95% de la semivarianza
total). Esto implica que la semivarianza inicia en cero o cercana a éste
para el intervalo de distancia cero.

En el caso de una variable no autocorrelacionada, ya sea porque tiene un
comportamiento aleatorio o porque la distribución espacial de las
observaciones es demasiado gruesa como para detectar la autocorrelación
de escalas más detalladas (variabilidad inframuestra), en la distancia
cero el variograma intercepta el eje de la semivarianza en valores
significativamente elevados.

<figure>

<img src="../img/variograma-autocorrelacion.png" width="600">

</figure>

  
*Tomado de <http://www.statios.com/Resources/04-variogram.pdf>*

A continuación, ejemplos de variogramas modelo aplicados a datos de
abundancia de especie de plantas leñosas en la cuenca del río Ocoa.

<figure>

<img src="../img/variograma-modelo-ejemplos.png" width="600">

</figure>

  

Nótese por ejemplo el caso del variograma LMVE\_02, donde la
semivarianza aumenta gradualmente hasta alcanzar el rango, que ocurre
entre 5 y 10 m. Por el contrario, EPCA\_02 y LIv\_1 no presentan un
patrón autocorrelacionado, puesto que la semivarianza no aumenta
gradualmente.

## Estudio de caso: precipitación de República Dominicana

En esta introducción realizaremos un **kriging ordinario** y un
**kriging universal** utilizando los observatorios de precipitación de
República Dominicana colectados por ONAMET.

### Datos fuente

Tomaremos como ejemplo la precipitación del año 1979. Primero carguemos
los observatorios y las provincias:

``` r
library(sf)
rutaobs <- 'data/onamet_prec_anual_sf.gpkg'
rutadiv <- 'data/divisionRD.gpkg'
st_layers(rutaobs)
## Driver: GPKG 
## Available layers:
##             layer_name geometry_type features fields
## 1 onamet_prec_anual_sf         Point       25     37
obs <- st_read(rutaobs)
## Reading layer `onamet_prec_anual_sf' from data source `/home/jr/Documentos/clases_UASD/201902/maestria-geotel-analisis-espacial/material-de-apoyo/data/onamet_prec_anual_sf.gpkg' using driver `GPKG'
## Simple feature collection with 25 features and 37 fields
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: -71.7 ymin: 18.067 xmax: -68.367 ymax: 19.85
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
st_layers(rutadiv)
## Driver: GPKG 
## Available layers:
##      layer_name geometry_type features fields
## 1 PROVCenso2010       Polygon       32      4
## 2  MUNCenso2010       Polygon      155      5
## 3  REGCenso2010       Polygon       10      2
prov <- st_read(rutadiv, layer = 'PROVCenso2010')
## Reading layer `PROVCenso2010' from data source `/home/jr/Documentos/clases_UASD/201902/maestria-geotel-analisis-espacial/material-de-apoyo/data/divisionRD.gpkg' using driver `GPKG'
## Simple feature collection with 32 features and 4 fields
## geometry type:  MULTIPOLYGON
## dimension:      XY
## bbox:           xmin: 182215.8 ymin: 1933532 xmax: 571365.3 ymax: 2205216
## epsg (SRID):    32619
## proj4string:    +proj=utm +zone=19 +datum=WGS84 +units=m +no_defs
```

Exploremos el CRS del objeto `obs`.

``` r
st_crs(obs)
## Coordinate Reference System:
##   EPSG: 4326 
##   proj4string: "+proj=longlat +datum=WGS84 +no_defs"
```

Transformemos a 32619:

``` r
crsdestino <- 32619
obsutm <- obs %>% st_transform(crs = crsdestino)
```

### EDA básico

Obtengamos los estadísticos básicos para el año 1979:

``` r
nrow(obsutm)
## [1] 25
summary(obsutm$a1979)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##     835    1551    1824    2067    2794    3621       4
hist(obsutm$a1979)
```

<img src="../img/esda-1979-1.png" width="600" />

``` r
hist(log(obsutm$a1979))
```

<img src="../img/esda-1979-2.png" width="600" />

``` r
shapiro.test(obsutm$a1979)
## 
##  Shapiro-Wilk normality test
## 
## data:  obsutm$a1979
## W = 0.91614, p-value = 0.07268
shapiro.test(log(obs$a1979))
## 
##  Shapiro-Wilk normality test
## 
## data:  log(obs$a1979)
## W = 0.96103, p-value = 0.537
```

Como vemos, los datos siguen distribución normal, pero hay algo de sesgo
hacia la derecha en la distribución. Igualmente, de los 25 observatorios
que hay en todo el país, para 1979 en al menos 4 hay datos perdidos
(`NA`). Eliminemos dichos observatorios, generemos un objeto que incluya
solamente a 1979 y que contenga igualmente una columna con datos
transformados:

``` r
pre1979 <- na.omit(obsutm[,'a1979'])
pre1979$a1979log <- log(pre1979$a1979)
```

Representemos los observatorios, estilizando por tono según la
precipitación del año 1979:

``` r
library(ggplot2)
ggplot() +
  geom_sf(data = prov, fill = 'white') +
  geom_sf(data = pre1979, aes(col = a1979log), size = 6) +
  scale_colour_gradient(low="#deebf7", high="#3182bd") +
  geom_sf_text(data = prov, aes(label=TOPONIMIA), check_overlap = T, size = 2) +
  theme_bw()
```

<img src="../img/mapa-pre-1979-1.png" width="100%" />

### Variograma muestral

Generemos el variograma muestral para el logaritmo de la precipitación.
Para ello empleamos la función `variogram`.

``` r
library(gstat)
v79 <- variogram(a1979log~1, pre1979)
plot(v79, plot.numbers = T)
```

<img src="../img/vgm-pre1979-1.png" width="800" />

Nótese la fórmula `a1979log~1`, la cual indica que la precipitación de
1979 es la variable sobre la cual se generará el variograma contra un
modelo de media, que en este caso es simplemente un intercepto (media
desconocida y constante). Típicamente, este variograma servirá para
realizar un kriging ordinario.

La función `variogram` fija una distancia máxima de búsqueda (`cutoff`),
que equivale a un tercio de la diagonal del recuadro delimitador
(*bounding box*), y fija intervalos de anchura constante (`width`, que
es la distancia de los intervalos *h<sub>i</sub>*, referida
anteriormente) equivalentes a `cutoff/15`. Dichos parámetros, `cutoff` y
`width` pueden modificarse por argumentos dentro de la función
`variogram`.

``` r
v79_m <- fit.variogram(v79, vgm(model = "Sph", range = 50000))
plot(v79, v79_m, plot.numbers = T)
```

<img src="../img/vgm-pre1979-ajus-exp-1.png" width="100%" />

``` r
v79_m2 <- fit.variogram(v79, vgm(model = "Exp", range = 50000))
plot(v79, v79_m2, plot.numbers = T)
```

<img src="../img/vgm-pre1979-ajus-exp-2.png" width="100%" />

``` r
v79_m3 <- fit.variogram(v79, vgm(model = "Gau", range = 50000))
plot(v79, v79_m3, plot.numbers = T)
```

<img src="../img/vgm-pre1979-ajus-exp-3.png" width="100%" />

``` r
attr(v79_m, 'SSErr')
## [1] 2.848504e-11
attr(v79_m2, 'SSErr') #Elegimos este
## [1] 2.763794e-11
attr(v79_m3, 'SSErr')
## [1] 3.618551e-11
```

### Interpolación por kriging

Primero creemos una cuadrícula para RD:

``` r
library(stars)
## Loading required package: abind
grd <- st_bbox(prov) %>%
  st_as_stars(dx = 10000) %>%
  st_set_crs(crsdestino) %>%
  st_crop(prov)
grd
## stars object with 2 dimensions and 1 attribute
## attribute(s):
##     values    
##  Min.   :0    
##  1st Qu.:0    
##  Median :0    
##  Mean   :0    
##  3rd Qu.:0    
##  Max.   :0    
##  NA's   :605  
## dimension(s):
##   from to  offset  delta                       refsys point values    
## x    1 39  182216  10000 +proj=utm +zone=19 +datum...    NA   NULL [x]
## y    1 28 2205216 -10000 +proj=utm +zone=19 +datum...    NA   NULL [y]
```

Sobre ella haremos la interpolación kriging:

``` r
k <- krige(a1979log~1, pre1979, grd, v79_m2)
## [using ordinary kriging]
ggplot() +
  geom_stars(data = k, aes(fill = var1.pred, x = x, y = y)) + 
  scale_fill_gradient(low="#deebf7", high="#3182bd") +
  geom_sf(data = st_cast(prov, "MULTILINESTRING")) +
  geom_sf(data = pre1979) +
  geom_sf_text(data = prov, aes(label=TOPONIMIA), check_overlap = T, size = 2) +
  theme_bw()
```

<img src="../img/krige-1.png" width="100%" />

## Referencias

<div id="refs" class="references">

<div id="ref-alperin2002caracterizacion">

Alperín, M. I., Borges, V., & Sarandón, R. (2002). Caracterización
espacial de los tipos de cobertura de suelo usando técnicas
geoestadı'sticas a partir de información satelital. *Revista de La
Facultad de Agronomía*, *105*.

</div>

<div id="ref-hengl2009practical">

Hengl, T. (2009). *A practical guide to geostatistical mapping*.

</div>

<div id="ref-pebesma2019spatial">

Pebesma, E., & Bivand, R. (2019). *Spatial Data Science*. Retrieved from
<https://keen-swartz-3146c4.netlify.com/>

</div>

</div>
