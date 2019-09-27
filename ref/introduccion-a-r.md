
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Introducción a R y análisis exploratorio de datos espaciales (ESDA)

## ¿Por qué R?

**En corto**: R cuenta con múltiples herramientas de análisis espacial y
geoestadística para crear flujos de trabajo reproducibles.

**En detalle**: Además de sus capacidades para análisis estadísticos
avanzados, R cuenta con un “ecosistema” de paquetes para análisis de
datos espaciales [muy
nutrido](https://cran.r-project.org/web/views/Spatial.html). Igualmente,
cuenta con [potentes y versátiles herramientas de representación
gráfica](https://www.r-graph-gallery.com/), dispone de un entorno de
desarrollo integrado (IDE) orientado a la reproducibilidad y al control
de versiones (e.g. [RStudio](https://rstudio.com/)) y, no menos
importante, ¡ES LIBRE\! Los programas basados en interfaz gráfico
difícilmente garantizan reproducibilidad, y no disponen de todas las
herramientas de análisis espacial con las que cuenta R.

<figure>

<img src="../img/diferencias_en_enfasis_software.png">

</figure>

Diferencias en énfasis entre software SIG con interfaz gráfico y R.
Fuente: Lovelace, Nowosad, & Muenchow (2019)

## Introducción a R

### Recursos

Verás a continuación algunas fuentes de referencia sobre los programas y
servicios que manejarás.

  - Sobre [R](https://www.r-project.org/)
      - [Vídeo corto sobre la historia de
        R](https://es.coursera.org/lecture/intro-data-science-programacion-estadistica-r/historia-e-introduccion-a-r-alNk0),
        donde aprenderás algunas características de R y el software
        libre en general, ventajas y desventajas de R, así como algunas
        aplicaciones.
      - [Libro R4DS, R for Data Science](https://r4ds.had.co.nz/), una
        fuente muy completa realizada principalmente por Wickham &
        Grolemund (2017), con apoyo de la comunidad R. [Fue traducido
        recientemente a español como “R para Ciencia de
        Datos”](https://es.r4ds.hadley.nz/) por la comunidad R de
        Latinoamérica, con el objetivo hacer R más accesible en la
        región. Es un buen punto de partida. La organización del libro,
        que prioriza el aparato gráfico sobre la parte programática,
        ayuda a mantener la motivación en el aprendizaje de R.
      - [Este es un manual de
        R](https://cran.r-project.org/doc/contrib/rdebuts_es.pdf) con
        enfoque orientado a la programación, y es todo un clásico
        (Paradis, 2003).
      - [Esta web](https://oscarperpinan.github.io/R/) es bastante
        completa para un nivel introductorio a R, y es a la vez un buen
        lugar de referencia (Lamigueiro, 2015).
      - [Geocomputation with R](https://geocompr.robinlovelace.net/)
        (Lovelace et al., 2019), el cual, como aseguran sus autores,
        trata sobre **hacer cosas con datos espaciales usando R**,
        enseñando destrezas como lectura y escrituras de datos
        espaciales, hacer mapas, modelizar fenómenos geográficos, entre
        otras.
      - [R-spatial](https://www.r-spatial.org/). Es un sitio web y blog
        dirigido a personas interesadas en usar R para anlizar datos
        espaciales y espacio-temporales. Además de publicar entradas
        periódicas sobre herramientas de análisis espacial con R, el
        sitio aloja el libro [Spatial Data
        Science](https://keen-swartz-3146c4.netlify.com/) (Pebesma &
        Bivand, 2019), que explica los conceptos que subyacen a los
        datos espaciales: puntos, líneas, polígonos, rásters, cubos de
        datos, entre otros. Aborda también conceptos de mayor nivel, por
        ejemplo, cómo afectan los atributos y las geometrías en el
        análisis espacial.
      - La existencia de una diversa y activa comunidad R incentiva a
        muchos/as usuarios/as a usar este entorno de programación. [A
        continuación](#twitter) verás algunas cuentas de Twitter, donde
        podrás observar en vivo una mínima parte de la actividad de la
        comunidad R. Hay muchas otras cuentas, foros, sitios web e
        incluso reuniones periódicas donde podrás interactuar con la
        comunidad. Te animo a descubrirlas.
      - [RStudio](https://www.rstudio.com/). Tanto la página de
        Wikipedia como [este
        vídeo](https://www.youtube.com/watch?v=5XeFFoTf2IY) explican
        muy bien en qué consiste este entorno de desarrollo integrado,
        además de que hace una breve introducción a qué es R.
  - [Git](https://git-scm.com/). Bueno, esta es una larga historia, que
    parece estar bien resumida en
    [Wikipedia](https://es.wikipedia.org/wiki/Git). Busca en YouTube, y
    verás otros aportes.
  - [GitHub](https://github.com/). Se erige como un servicio público
    para desarrolladores y desarrolladoras. Luce bien explicado
    [aquí](https://www.deustoformacion.com/blog/programacion-diseno-web/que-es-para-que-sirve-github).
    Recomiendo también el libro web [“*Happy Git and GitHub for the
    useR*”](https://happygitwithr.com/), de Jenny Bryan (Bryan, the STAT
    545 TAs, & Hester, 2019).
  - [GitHub Classroom](https://github.com/education/classroom%5D). En
    [esta
    web](https://www.genbeta.com/desarrollo/classroom-for-github-ayudando-a-los-profesores-a-gestionar-los-ejercicios-de-sus-clases)
    te explican para qué sirve. Con este servicio estoy asignándote
    trabajo. También te recomiendo que leas [ésta
    afirmación](https://github.com/education/classroom#who-is-classroom-for).
  - Foros de ayuda y listas de distribución, entre los que destacan
    [R-help](https://stat.ethz.ch/mailman/listinfo/r-help),
    [R-devel](https://stat.ethz.ch/mailman/listinfo/r-devel),
    [Stackoverflow](https://stackoverflow.com/). Las preguntas deben
    plantearse con un ejemplo reproducible. Si vas a plantear una, lee
    antes las guías de publicación. Existe una [lista de distribución de
    R-help en español](https://stat.ethz.ch/mailman/listinfo/r-help-es),
    así como de [Stackoverflow en
    español](https://es.stackoverflow.com/).
  - <a name="twitter"></a>Twitter:
      - [The R Foundation](https://twitter.com/_r_foundation)
      - [RStudio](https://twitter.com/rstudio)
      - [RLadies](https://twitter.com/RLadiesGlobal)
      - [We Are R-Ladies](https://twitter.com/WeAreRLadies)
      - [Comunidad R Hispano](https://twitter.com/r_hisp?lang=es)
      - [Hadley Wickham](https://twitter.com/hadleywickham)
      - [Gabriela de Queiroz](https://twitter.com/gdequeiroz)
      - [Jenny Bryan](https://twitter.com/JennyBryan)
      - [R Consortium](https://twitter.com/rconsortium)
      - [UseR\! 2020](https://twitter.com/useR2020stl)
      - [UseR\! 2019](https://twitter.com/UseR2019_Conf)

### Instalación y ejecución de R y RStudio

  - Puedes usar el servidor RStudio habilitado por el profesor. Habrás
    recibido un correo electrónico con los detalles de acceso.

  - Si prefieres trabajar en tu propia PC, instala R y RStudio. La guía
    de instalación varía mucho según el sistema
        operativo:
    
      - [R](https://cloud.r-project.org/)
      - [RStudio](https://www.rstudio.com/products/rstudio/download/#download)

  - Igualmente, la forma de ejecutar estas aplicaciones dependerá del
    sistema operativo.
    
      - En GNU/Linux es posible ejecutar aplicaciones tanto desde el
        gestor de ventanas como desde el intérprete de línea de órdenes
        (CLI) o “terminal” (por ejemplo, para ejecutar R, presiona
        `CRTL+ALT+T`, escribe `R` y presiona `<enter>`).
      - En Windows y MacOS la ejecución se realiza desde el GUI.

### CRAN (Comprehensive R Archive Network)

  - [¿Qué es
    CRAN?](https://cran.r-project.org/doc/FAQ/R-FAQ.html#What-is-CRAN_003f)
  - Instalar paquetes: Ejemplo: `install.packages('vegan', dependencies
    = T)`. Si realizas tus asignaciones en el servidor RStudio
    habilitado por el profesor, no necesitarás instalar paquetes.

### Ayuda de R

``` r
help(package = 'base') #Ayuda sobre un paquete
library(help = 'base') #Documentación sobre un paquete
help(lm) #Ayuda sobre una función
?lm #Ídem
example(lm) #Ejemplo(s) sobre una función
## 
## lm> require(graphics)
## 
## lm> ## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## lm> ## Page 9: Plant Weight Data.
## lm> ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
## 
## lm> trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
## 
## lm> group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
## 
## lm> weight <- c(ctl, trt)
## 
## lm> lm.D9 <- lm(weight ~ group)
## 
## lm> lm.D90 <- lm(weight ~ group - 1) # omitting intercept
## 
## lm> ## No test: 
## lm> ##D anova(lm.D9)
## lm> ##D summary(lm.D90)
## lm> ## End(No test)
## lm> opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
## 
## lm> plot(lm.D9, las = 1)      # Residuals, Fitted, ...
```

![](../img/help-in-r-1.png)<!-- -->

    ## 
    ## lm> par(opar)
    ## 
    ## lm> ## Don't show: 
    ## lm> ## model frame :
    ## lm> stopifnot(identical(lm(weight ~ group, method = "model.frame"),
    ## lm+                     model.frame(lm.D9)))
    ## 
    ## lm> ## End(Don't show)
    ## lm> ### less simple examples in "See Also" above
    ## lm> 
    ## lm> 
    ## lm>
    help.search("matrix") #Busca la palabra clave en las ayudas de los paquetes
    ??matrix #Ídem

¡Usa los foros\! Si introduces un mensaje de error de R en el buscador
de tu preferencia (en inglés obtienes más resultados), encontrarás
varios punteros a foros con posibles soluciones.

## Análisis exploratorio de datos espaciales (ESDA)

Carguemos los paquetes que necesitaremos para esta breve introducción.

``` r
library(sf)
library(raster)
library(rgdal)
library(tidyverse)
library(readxl)
library(tmap)
```

Brevemente, con `sf` crearás y manipularás *simple features* (más
detalles a continuación), `raster` te ayudará a manipular y analizar
imágenes de dicho modelo, con `rgdal` tendrás varias funciones
*wrapper* para trabajar con `gdal`desde R, `tidyverse` carga una
colección de paquetes para manipular, limpiar y organizar datos de
`data.frame`, `readxl` te permitirá cargar archivos Excel, y con `tmap`
crearás mapas y los personalizarás. Busca más información sobre estos
paquetes, y comprobarás las múltiples capacidades de R para manipular
información espacial.

El siguiente bloque de código carga las regiones del país según la
división de 2010, a partir de un archivo GeoPackage, originalmente
*shapefiles* de la Oficina Nacional de Estadística (ONE) (2015). Además
de las regiones, este GPKG contiene dos capas adicionales, provincias y
municipios, que cargaremos más
adelante.

``` r
reg.sf <- st_read(dsn = 'data/divisionRD.gpkg', layer = 'REGCenso2010', quiet = T)
plot(reg.sf)
```

![](../img/regiones-1.png)<!-- -->

La función `st_read` lee la capa correspondiente del GPKG y la convierte
a un `simple features` de tipo `MULTIPOLYGON`. Este tipo de objetos los
analizaremos más adelante; por lo pronto, probemos algunas
visualizaciones más. Las regiones fueron coloreadas en función de los
campos `REG` y `TOPONIMIA`, pero se puede crear un campo de área
(simple, en m<sup>2</sup>) y aplicar estilos al mapa en función de éste.

``` r
reg.sf$area <- st_area(reg.sf)
plot(reg.sf['area'])
```

![](../img/regiones2-1.png)<!-- -->

> Este mapa es mejorable en muchos aspectos. En este mismo tutorial,
> probarás formas de diseñar mapas estilizados.

El bloque de código a continuación carga la capa de municipios desde el
GPKG.

``` r
mun.sf <- st_read(dsn = 'data/divisionRD.gpkg', layer = 'MUNCenso2010', quiet = T)
plot(mun.sf)
```

![](../img/municipios-1.png)<!-- -->

``` r
mun.sf$area <- st_area(mun.sf)
plot(mun.sf['area'])
```

![](../img/municipios-2.png)<!-- -->

``` r
nrow(mun.sf)
## [1] 155
```

Veamos aspectos básicos de los objetos *simple features*. Se trata de un
estándar abierto y jerárquico del Open Geospatial Consortium
(organización sin ánimo de lucro que agrupa a entidades públicas y
privadas comprometida con este tipo de estándares). *Simple features*
representa al menos 17 tipos de geometría (sólo admite vectoriales, para
los rásters se usan otros modelos), de las que 7 son ampliamente usadas
en análisis espacial (ver figura a continuación).

<figure>

<img src="../img/tipos_geometria_sf.png">

</figure>

Tipos de *simple features* admitidos por el paquete `sf`. Fuente:
Lovelace et al. (2019)

El modelo de datos de los *simple features* se basa en estructuras
similares a las que usan bases de datos espaciales, como PostGIS,
favoreciendo así la interoperabilidad. Otras ventajas que se señalan en
su favor son: mejor rendimiento para lectura, escritura y representación
(“ploteado”) de datos espaciales, maneja objetos tipo `data.frame` (ver
más abajo) y, no menos importante, las operaciones geométricas y de
atributos se pueden realizar mediante tuberías (*pipelines*) de la
colección `tidyverse`.

Los *simple features* se integran en R mediante el paquete `sf`
(Pebesma, 2018). El paquete `sf` supera significativamente a su
predecesor, `sp`, sobre todo porque depende de potentes paquetes, tanto
de R como externos mantenidos por una comunidad muy amplia (como GDAL,
GEOS y PROJ). A continuación se muestra un gráfico de las dependencias.

<figure>

<img src="../img/sf_y_sus_dependencias.png">

</figure>

El paquete `sf` y sus dependencias. Las flechas sólidas indican
dependencia fuerte; las de trazo discontinuo, dependencia débil. Fuente:
Pebesma & Bivand (2019)

Los *simple features* se almacenan en…tablas. Sí, sí, tablas,
denominadas `data.frames` en R, que en el caso concreto serían “tablas
especiales” (*spatial data frames*). Por ejemplo, exploremos el objeto
`reg.sf` mediante la función `str`, que muestra su estructura como
`Classes 'sf' and data.frame: 10 obs. of 4 variables` (10 observaciones
o geometrías, que en este caso son regiones dominicanas, y 4 variables o
atributos).

``` r
str(reg.sf)
## Classes 'sf' and 'data.frame':   10 obs. of  4 variables:
##  $ REG      : Factor w/ 10 levels "01","02","03",..: 1 2 3 4 5 6 7 8 9 10
##  $ TOPONIMIA: Factor w/ 10 levels "REGIÓN CIBAO NORDESTE",..: 3 4 1 2 9 6 5 10 7 8
##  $ geom     :sfc_MULTIPOLYGON of length 10; first list element: List of 2
##   ..$ :List of 1
##   .. ..$ : num [1:11, 1:2] 317783 317729 317664 317643 317687 ...
##   ..$ :List of 2
##   .. ..$ : num [1:14787, 1:2] 291169 291270 291348 291408 291486 ...
##   .. ..$ : num [1:42, 1:2] 277547 277496 277444 277385 277323 ...
##   ..- attr(*, "class")= chr  "XY" "MULTIPOLYGON" "sfg"
##  $ area     :Object of class units:
##  num  5.45e+09 4.47e+09 4.15e+09 4.88e+09 5.56e+09 ...
##   ..- attr(*, "units")=List of 2
##   .. ..$ numerator  : chr  "m" "m"
##   .. ..$ denominator: chr 
##   .. ..- attr(*, "class")= chr "symbolic_units"
##  - attr(*, "sf_column")= chr "geom"
##  - attr(*, "agr")= Factor w/ 3 levels "constant","aggregate",..: NA NA NA
##   ..- attr(*, "names")= chr  "REG" "TOPONIMIA" "area"
```

Al tratarse de un `data.frame`, los análisis estadísticos se ejecutan de
manera fluida y sin necesidad de extraer los datos a archivos externos.
Así, por ejemplo, la función `summary`, muy empleada en R para obtener
estadísticos descriptivos de variables en columnas, devuelve en el acto
estadísticos de las columnas de atributos (incluida la de geometría o
`geom`):

``` r
summary(reg.sf)
##       REG                    TOPONIMIA            geom   
##  01     :1   REGIÓN CIBAO NORDESTE:1   MULTIPOLYGON :10  
##  02     :1   REGIÓN CIBAO NOROESTE:1   epsg:32619   : 0  
##  03     :1   REGIÓN CIBAO NORTE   :1   +proj=utm ...: 0  
##  04     :1   REGIÓN CIBAO SUR     :1                     
##  05     :1   REGIÓN EL VALLE      :1                     
##  06     :1   REGIÓN ENRIQUILLO    :1                     
##  (Other):4   (Other)              :4                     
##       area          
##  Min.   :1.393e+09  
##  1st Qu.:4.543e+09  
##  Median :5.026e+09  
##  Mean   :4.807e+09  
##  3rd Qu.:5.450e+09  
##  Max.   :6.796e+09  
## 
```

Igual se puede obtener un resumen sólo de una columna filtrando el
objeto `sf`.

``` r
summary(reg.sf['area'])
##       area                      geom   
##  Min.   :1.393e+09   MULTIPOLYGON :10  
##  1st Qu.:4.543e+09   epsg:32619   : 0  
##  Median :5.026e+09   +proj=utm ...: 0  
##  Mean   :4.807e+09                     
##  3rd Qu.:5.450e+09                     
##  Max.   :6.796e+09
```

> Nota que la columna `geom` se mantiene en el resumen, puesto que
> siempre acompaña al objeto a menos que le indiquemos lo contrario.

``` r
pop.mun <- read_xls('pop_adm3.xls')
pop.mun
nrow(pop.mun)
pop.mun <- pop.mun %>%
  mutate(ENLACE = ifelse(
    nchar(Code)==5,
    paste0('0', Code),
    Code)
  )
match(mun.sf$ENLACE, pop.mun$ENLACE)

mun.sf.sex <- mun.sf %>% 
  inner_join(pop.mun) %>% 
  select(Hombres, Mujeres, TOPONIMIA) %>% 
  mutate(Total=Hombres+Mujeres)
plot(mun.sf.sex, breaks = 'jenks')
pop.mun.hom <- plot(mun.sf.sex['Hombres'], breaks = 'jenks')

dev.new()
mun.sf.sex %>%
  select(-TOPONIMIA) %>% 
  gather(variable, value, -geometry) %>%
  ggplot(aes(fill=value)) +
  geom_sf() +
  facet_wrap(~variable)

p1 <- tm_shape(mun.sf.sex) +
  tm_fill(col = "Hombres", style = 'jenks') +
  tm_borders()
p2 <- tm_shape(mun.sf.sex) +
  tm_fill(col = "Mujeres", style = 'jenks') +
  tm_borders()
p3 <- tm_shape(mun.sf.sex) +
  tm_fill(col = "Total", style = 'jenks') +
  tm_borders()
tmap_arrange(p1, p2, p3)

p1text <- tm_shape(mun.sf.sex) +
  tm_fill(col = "Hombres", style = 'jenks') +
  tm_borders() +
  tm_text('TOPONIMIA', size = 0.4)
tmap_arrange(p1text)
```

## Conclusión

Conociste las herramientas básicas para realizar un EDA ágilmente y
generando gráficos informativos. **El EDA es un paso imprescindible en
cualquier investigación**, así que, ya que no te lo podrás saltar, es
necesario que practiques con los datos de ejemplo mostrados aquí, o con
los tuyos propiamente.

Aunque los paquetes de análisis de datos ecológicos no están
“saborizados” al estilo `tidyverse`, al menos el EDA lo podrás
realizar utilizando tuberías de esta potente colección de paquetes.
Conocerás más herramientas de `tidyverse` en el siguiente capítulo de
esta novela.

## Situaciones comunes

  - R es sensible a las mayúsculas. No es lo mismo `Mi_objeto` que
    `mi_objeto`.
  - *“En RStudio, ¿Qué atajo de teclado es que usan para poner el
    operador de asignación `<-`?”* Debería funcionarte `ALT+-`, pero
    recuerda, sólo lo podrás usar en RStudio.
  - *“¿Y el pipe `%>%`?”* `CTRL+SHIFT+M`.
  - Más atajos de teclado de RStudio: `ALT+SHIFT+K`.
  - *“Me quedé trancá’ en la consola de R con un signo de `+`. ¿Qué hago
    pa’ salir de eso?”* Suele resolverse presionando la tecla `Escape`
    (`Esc`). Lee [este
    texto](https://support.rstudio.com/hc/en-us/community/posts/200792676-stuck-on-).

## Referencias

<div id="refs" class="references">

<div id="ref-bryan2019happy">

Bryan, J., the STAT 545 TAs, & Hester, J. (2019). *Happy Git and GitHub
for the useR*. Retrieved from <https://happygitwithr.com/>

</div>

<div id="ref-perpinan2019intro">

Lamigueiro, O. P. (2015). *Introducción a r*.
<https://oscarperpinan.github.io/R/>.

</div>

<div id="ref-lovelace2019geocomputation">

Lovelace, R., Nowosad, J., & Muenchow, J. (2019). *Geocomputation with
R*. Retrieved from <https://geocompr.robinlovelace.net/>

</div>

<div id="ref-one2015datos">

Oficina Nacional de Estadística (ONE). (2015). *Datos
georreferenciados*.
<https://www.one.gob.do/informaciones-cartograficas/shapefiles>.

</div>

<div id="ref-paradis2003r">

Paradis, E. (2003). *R para principiantes*. Institut des Sciences de l̕
Évolution. Universit Montpellier.

</div>

<div id="ref-pebesma2018simple">

Pebesma, E. (2018). Simple Features for R: Standardized Support for
Spatial Vector Data. *The R Journal*, *10*(1), 439–446.
<https://doi.org/10.32614/RJ-2018-009>

</div>

<div id="ref-pebesma2019spatial">

Pebesma, E., & Bivand, R. (2019). *Spatial Data Science*. Retrieved from
<https://keen-swartz-3146c4.netlify.com/>

</div>

<div id="ref-Wickham2017R">

Wickham, H., & Grolemund, G. (2017). *R for data science: Import, tidy,
transform, visualize, and model data* (1st ed.). Retrieved from
<http://r4ds.had.co.nz/>

</div>

</div>
