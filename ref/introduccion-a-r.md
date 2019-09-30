
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Introducción a R, *simple features* y análisis exploratorio de datos espaciales (ESDA)

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
        donde aprenderás algunas características de este lenguaje y del
        software libre en general. Verás también ventajas y desventajas
        de R, así como algunas aplicaciones.
      - [Libro R4DS, R for Data Science](https://r4ds.had.co.nz/), una
        fuente muy completa realizada principalmente por Wickham &
        Grolemund (2017), con apoyo de la comunidad R. [Fue traducido
        recientemente a español como “R para Ciencia de
        Datos”](https://es.r4ds.hadley.nz/) por la comunidad R de
        Latinoamérica, con el objetivo de hacer R más accesible en la
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
        enseñando destrezas como lectura y escritura de datos
        espaciales, elaboración de mapas, modelización de fenómenos
        geográficos, entre otras.
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
        muy bien en qué consiste este entorno de desarrollo integrado.
  - [Git](https://git-scm.com/). Bueno, esta es una larga historia, que
    parece estar bien resumida en
    [Wikipedia](https://es.wikipedia.org/wiki/Git). Busca en YouTube, y
    verás otros aportes.
  - [GitHub](https://github.com/). Se erige como un servicio público
    para desarrolladores y desarrolladoras. Luce bien explicado
    [aquí](https://www.deustoformacion.com/blog/programacion-diseno-web/que-es-para-que-sirve-github).
    Recomiendo también el libro web [“*Happy Git and GitHub for the
    useR*”](https://happygitwithr.com/) (Bryan, the STAT 545 TAs, &
    Hester, 2019).
  - [GitHub Classroom](https://github.com/education/classroom%5D). En
    [esta
    web](https://www.genbeta.com/desarrollo/classroom-for-github-ayudando-a-los-profesores-a-gestionar-los-ejercicios-de-sus-clases)
    te explican para qué sirve. Con este servicio estoy asignándote
    trabajo. También te recomiendo que leas [ésta
    afirmación](https://github.com/education/classroom#who-is-github-classroom-for)
    sobre “Who is GitHub Classroom for?”.
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
      - [R
Consortium](https://twitter.com/rconsortium)
      - [UseR\! 2020](https://twitter.com/useR2020stl)
      - [UseR\! 2019](https://twitter.com/UseR2019_Conf)

### Servidor RStudio habilitado por el profesor, o instalación y ejecución de R y RStudio en tu propia PC

  - Puedes usar el servidor RStudio habilitado por el profesor. Revisa
    tu buzón de correo electrónico (también el *spam*), y localiza un
    mensaje donde te explico los detalles de acceso.

  - Si prefieres trabajar en tu propia PC, instala R y RStudio, y los
    paquetes requeridos en las asignaciones. La guía de instalación
    varía mucho según el sistema
        operativo:
    
      - [R](https://cloud.r-project.org/)
      - [RStudio](https://www.rstudio.com/products/rstudio/download/#download)
      - Igualmente, la forma de ejecutar estas aplicaciones dependerá
        del sistema operativo.
          - En GNU/Linux puedes ejecutar aplicaciones tanto desde el
            gestor de ventanas como desde el intérprete de línea de
            órdenes (CLI) o “terminal” (por ejemplo, para ejecutar R,
            presiona `CRTL+ALT+T`, escribe `R` y presiona `<enter>`).
          - En Windows y MacOS la ejecución se realiza desde el GUI.

### CRAN (Comprehensive R Archive Network)

  - [¿Qué es
    CRAN?](https://cran.r-project.org/doc/FAQ/R-FAQ.html#What-is-CRAN_003f)
  - Instalar paquetes: Ejemplo: `install.packages(pkgs = 'sf',
    dependencies = T)`. Si realizas tus asignaciones en el servidor
    RStudio habilitado por el profesor, no necesitarás instalar
    paquetes.

### Ayuda de R

``` r
help(package = 'base') #Ayuda sobre un paquete
library(help = 'base') #Documentación sobre un paquete
help(lm) #Ayuda sobre una función
?lm #Ídem
example(lm) #Ejemplo(s) sobre una función
help.search("matrix") #Busca la palabra clave en las ayudas de los paquetes
??matrix #Ídem
```

¡Usa los foros\! Si introduces un mensaje de error (preferiblemente en
inglés) de R en el buscador de tu preferencia, encontrarás varios
punteros a foros con posibles soluciones.

## *Simple features*

### Paquetes

Carguemos los paquetes que necesitaremos en esta introducción.

``` r
library(sf)
library(raster)
library(rgdal)
library(tidyverse)
library(readxl)
library(tmap)
```

Brevemente, con `sf` crearás y manipularás *simple features*, `raster`
te ayudará a manipular y analizar imágenes de dicho modelo, con `rgdal`
tendrás varias funciones *wrapper* para trabajar con `gdal`desde R,
`tidyverse` carga una colección de paquetes para manipular, limpiar y
organizar datos de `data.frame`, `readxl` te permitirá cargar archivos
Excel, y con `tmap` crearás mapas y los personalizarás. Busca más
información sobre estos paquetes, y comprobarás las múltiples
capacidades de R para manipular información espacial.

### Mi primer mapa con *simple features*

El siguiente bloque de código carga las regiones de República Dominicana
según la división de 2010, a partir de un archivo GeoPackage que
contiene 3 capas (regiones propiamente, provincias y municipios\[1\]),
originalmente *shapefiles* de la Oficina Nacional de Estadística (ONE)
(2015).

``` r
reg.sf <- st_read(dsn = 'data/divisionRD.gpkg', layer = 'REGCenso2010', quiet = T)
plot(reg.sf)
```

![](../img/regiones-1.png)<!-- -->

La función `st_read` lee la capa correspondiente del GPKG y la convierte
a un `simple features` de tipo `MULTIPOLYGON` (este tipo de objetos los
analizaremos más adelante).

Notar que la capa `REGCenso2010`, cuenta con dos campos, por lo que la
función `plot` representa a los municipios aplicándoles distintos
estilos en función del campo representado. Las regiones fueron
coloreadas en función de los campos `REG` y `TOPONIMIA`. Probemos una
visualización cuantitativa. Crearemos un campo de área mediante la
función `st_area` (en m<sup>2</sup>, que son las unidades del CRS, que
es EPSG:32619), representaremos el objeto `reg.sf` usando sólo dicho
campo (`reg.sf['area']`) y le aplicaremos estilos al mapa en función de
éste.

``` r
reg.sf$area <- st_area(reg.sf)
plot(reg.sf['area'])
```

![](../img/regiones2-1.png)<!-- -->

> El mapa anterior es mejorable en muchos aspectos. En este mismo
> tutorial, probarás formas de diseñar mapas estilizados.

El bloque de código a continuación carga la capa de municipios desde el
GPKG y la representa. Al igual que con la capa regional, dado que tiene
múltiples campos (en este caso, 3 adicionales), la función `plot`
representa a los municipios aplicándoles distintos estilos en función
del campo
representado.

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

### ¿Qué son *simple features*?

Veamos lo básico sobre el modelo de datos *simple features*. Se trata de
un estándar abierto y jerárquico del Open Geospatial Consortium
(organización sin ánimo de lucro que agrupa a entidades públicas y
privadas comprometida con este tipo de estándares). Mediante *simple
features* se representan al menos 17 tipos de geometrías (sólo admite
vectoriales), de las que 7 son ampliamente usadas en análisis espacial
(ver figura a continuación).

<figure>

<img src="../img/tipos_geometria_sf.png">

</figure>

Tipos de *simple features* admitidos por el paquete `sf`. Fuente:
Lovelace et al. (2019)

Por ejemplo, exploremos el objeto `mun.sf` en la consola; basta con
escribir su nombre para obtener un resumen que muestra el tipo de
geometría y otras características espaciales, como el sistema de
referencia espacial (CRS). A continuación, mostrará los atributos de los
primeros 10 objetos (explicados más adelante).

``` r
mun.sf
## Simple feature collection with 155 features and 6 fields
## geometry type:  MULTIPOLYGON
## dimension:      XY
## bbox:           xmin: 182215.8 ymin: 1933512 xmax: 571429.3 ymax: 2205216
## epsg (SRID):    32619
## proj4string:    +proj=utm +zone=19 +datum=WGS84 +units=m +no_defs
## First 10 features:
##    PROV MUN REG               TOPONIMIA ENLACE
## 1    01  01  10 SANTO DOMINGO DE GUZMÁN 100101
## 2    02  01  05                    AZUA 050201
## 3    02  02  05             LAS CHARCAS 050202
## 4    02  03  05    LAS YAYAS DE VIAJAMA 050203
## 5    02  04  05         PADRE LAS CASAS 050204
## 6    02  05  05                 PERALTA 050205
## 7    02  06  05            SABANA YEGUA 050206
## 8    02  07  05            PUEBLO VIEJO 050207
## 9    02  08  05           TÁBARA ARRIBA 050208
## 10   02  09  05                GUAYABAL 050209
##                              geom            area
## 1  MULTIPOLYGON (((397122.7 20...  91517576 [m^2]
## 2  MULTIPOLYGON (((318830.5 20... 416324302 [m^2]
## 3  MULTIPOLYGON (((333950.3 20... 246669929 [m^2]
## 4  MULTIPOLYGON (((288107.3 20... 431079179 [m^2]
## 5  MULTIPOLYGON (((303931.9 21... 573880948 [m^2]
## 6  MULTIPOLYGON (((307770.9 20... 129370697 [m^2]
## 7  MULTIPOLYGON (((304091.3 20... 113799233 [m^2]
## 8  MULTIPOLYGON (((314474 2040...  48117190 [m^2]
## 9  MULTIPOLYGON (((302204.4 20... 274667489 [m^2]
## 10 MULTIPOLYGON (((313520.7 20... 235625110 [m^2]
```

Nos informa que se trata de un `Simple feature collection with 155
features and 6 fields` de tipo `MULTIPOLYGON` con dimensiones `XY` y una
extensión mostrada en la línea `bbox`. Igualmente, nos indica que el CRS
es EPSG:32619, o WGS84 UTM zona 19.

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
predecesor, `sp` en eficiencia y facilidad de uso. Asimismo, `sf`
depende de otros paquetes de R muy eficientes, y también de paquetes
externos mantenidos por una comunidad muy amplia (como GDAL, GEOS y
PROJ). A continuación se muestra un gráfico de las dependencias.

<figure>

<img src="../img/sf_y_sus_dependencias.png">

</figure>

El paquete `sf` y sus dependencias. Las flechas sólidas indican
dependencia fuerte; las de trazo discontinuo, dependencia débil. Fuente:
Pebesma & Bivand (2019)

Los *simple features* se almacenan en…tablas. Sí, sí, tablas,
denominadas `data.frames` en R, que en el caso concreto serían “tablas
espaciales” (*spatial data frames*). Exploremos la estructura del objeto
`mun.sf` mediante la función `str`, la cual lo muestra como `Classes
'sf' and data.frame: 10 obs. of 4 variables` (155 observaciones o
geometrías, que en este caso son municipios dominicanos, y 4 variables o
atributos).

``` r
str(mun.sf)
## Classes 'sf' and 'data.frame':   155 obs. of  7 variables:
##  $ PROV     : Factor w/ 32 levels "01","02","03",..: 1 2 2 2 2 2 2 2 2 2 ...
##  $ MUN      : Factor w/ 11 levels "01","02","03",..: 1 1 2 3 4 5 6 7 8 9 ...
##  $ REG      : Factor w/ 10 levels "01","02","03",..: 10 5 5 5 5 5 5 5 5 5 ...
##  $ TOPONIMIA: Factor w/ 155 levels "ALTAMIRA","ARENOSO",..: 133 3 65 71 92 99 118 105 138 43 ...
##  $ ENLACE   : Factor w/ 155 levels "010901","010902",..: 148 68 69 70 71 72 73 74 75 76 ...
##  $ geom     :sfc_MULTIPOLYGON of length 155; first list element: List of 1
##   ..$ :List of 1
##   .. ..$ : num [1:3521, 1:2] 397123 397142 397176 397202 397239 ...
##   ..- attr(*, "class")= chr  "XY" "MULTIPOLYGON" "sfg"
##  $ area     :Object of class units:
##  num  9.15e+07 4.16e+08 2.47e+08 4.31e+08 5.74e+08 ...
##   ..- attr(*, "units")=List of 2
##   .. ..$ numerator  : chr  "m" "m"
##   .. ..$ denominator: chr 
##   .. ..- attr(*, "class")= chr "symbolic_units"
##  - attr(*, "sf_column")= chr "geom"
##  - attr(*, "agr")= Factor w/ 3 levels "constant","aggregate",..: NA NA NA NA NA NA
##   ..- attr(*, "names")= chr  "PROV" "MUN" "REG" "TOPONIMIA" ...
```

Al tratarse de un `data.frame`, los análisis estadísticos se ejecutan de
manera fluida y sin necesidad de extraer los datos a archivos externos.
Así, por ejemplo, la función `summary`, muy empleada en R para obtener
estadísticos descriptivos, devuelve estadísticos de todas las columnas
de atributos (incluida la de geometría, nombrada como `geom` en este
caso):

``` r
summary(mun.sf)
##       PROV          MUN          REG              TOPONIMIA  
##  04     : 11   01     :32   06     :24   ALTAMIRA      :  1  
##  02     : 10   02     :31   05     :23   ARENOSO       :  1  
##  18     :  9   03     :27   01     :22   AZUA          :  1  
##  25     :  9   04     :19   03     :17   BAJOS DE HAINA:  1  
##  21     :  8   05     :15   04     :17   BANÍ          :  1  
##  06     :  7   06     :12   09     :14   BÁNICA        :  1  
##  (Other):101   (Other):19   (Other):38   (Other)       :149  
##      ENLACE               geom          area          
##  010901 :  1   MULTIPOLYGON :155   Min.   :1.794e+07  
##  010902 :  1   epsg:32619   :  0   1st Qu.:1.220e+08  
##  010903 :  1   +proj=utm ...:  0   Median :2.117e+08  
##  010904 :  1                       Mean   :3.101e+08  
##  011801 :  1                       3rd Qu.:4.129e+08  
##  011802 :  1                       Max.   :2.016e+09  
##  (Other):149
```

La función `summary` actúa igualmente sobre una columna filtrada desde
el objeto `reg.sf`, en este caso `area`.

``` r
summary(mun.sf['area'])
##       area                      geom    
##  Min.   :1.794e+07   MULTIPOLYGON :155  
##  1st Qu.:1.220e+08   epsg:32619   :  0  
##  Median :2.117e+08   +proj=utm ...:  0  
##  Mean   :3.101e+08                      
##  3rd Qu.:4.129e+08                      
##  Max.   :2.016e+09
```

> Nota que la columna `geom` se mantiene en el resumen, puesto que
> siempre acompaña al objeto a menos que le indiquemos lo contrario
> (*sticky column*).

### *Simple features*, de abajo a arriba

Normalmente, los datos espaciales se crean en aplicaciones con GUI
(e.g. QGIS), o los obtienes de terceros. Sin embargo, para fines
didácticos, crearemos algunos objetos conteniendo los tipos de
geometrías básicos en la forma de *simple feature geometries* (`sfg`)
en el siguiente bloque de código. Las crearemos utilizando **coordenadas
geográficas**, aunque no podremos definir un CRS, puesto que la clase
`sfg` no admite dicha funcionalidad. Las funciones que utilizaremos para
cada geometría serán punto `st_point`, línea `st_linestring` y polígono
`st_polygon`.

``` r
pto.sfg <- st_point(c(-70.3, 19))
pto.sfg
## POINT (-70.3 19)
plot(pto.sfg, col = 'red'); box()
matrizlin <- rbind(c(-71.5, 18), c(-71.2, 18),
                   c(-71.2, 18.4), c(-71.5, 18.4))
matrizlin
##       [,1] [,2]
## [1,] -71.5 18.0
## [2,] -71.2 18.0
## [3,] -71.2 18.4
## [4,] -71.5 18.4
lin.sfg <- st_linestring(matrizlin)
lin.sfg
## LINESTRING (-71.5 18, -71.2 18, -71.2 18.4, -71.5 18.4)
plot(lin.sfg, col = 'red'); box()
matrizpol <- list(
  rbind(c(-70.7, 18.6), c(-70.4, 18.6),
        c(-70.4, 18.9), c(-70.7, 18.9),
        c(-70.7, 18.6)))
pol.sfg <- st_polygon(matrizpol)
pol.sfg
## POLYGON ((-70.7 18.6, -70.4 18.6, -70.4 18.9, -70.7 18.9, -70.7 18.6))
plot(pol.sfg, col = 'red'); box()
```

<img src="../img/geoms-1.png" width="33%" /><img src="../img/geoms-2.png" width="33%" /><img src="../img/geoms-3.png" width="33%" />

Si combinamos varios puntos generamos un elemento multipunto
(*multipoint*). Lo mismo aplica para las líneas (multilínea,
*multilinestring*) y los polígonos (multipolígono, *multipolygon*). El
siguiente bloque de código muestra cómo
crearlos.

``` r
mpto.sfg <- st_multipoint(rbind(c(-70.3, 19), c(-70.4, 19), c(-70.4, 19.1), c(-70.3, 19.1)))
mpto.sfg
## MULTIPOINT (-70.3 19, -70.4 19, -70.4 19.1, -70.3 19.1)
plot(mpto.sfg, col = 'red'); box()
matrizmlin <- list(rbind(c(-71.5, 18), c(-71.2, 18), c(-71.2, 18.4), c(-71.5, 18.4)),
                  rbind(c(-70.9, 18), c(-70.5, 18), c(-70.7, 18.4)))
matrizmlin
## [[1]]
##       [,1] [,2]
## [1,] -71.5 18.0
## [2,] -71.2 18.0
## [3,] -71.2 18.4
## [4,] -71.5 18.4
## 
## [[2]]
##       [,1] [,2]
## [1,] -70.9 18.0
## [2,] -70.5 18.0
## [3,] -70.7 18.4
mlin.sfg <- st_multilinestring(matrizmlin)
mlin.sfg
## MULTILINESTRING ((-71.5 18, -71.2 18, -71.2 18.4, -71.5 18.4), (-70.9 18, -70.5 18, -70.7 18.4))
plot(mlin.sfg, col = 'red'); box()
matrizmpol <- list(
  list(rbind(c(-70.7, 18.6), c(-70.4, 18.6), c(-70.4, 18.9), c(-70.7, 18.9), c(-70.7, 18.6))),
  list(rbind(c(-70, 18.6), c(-70.3, 18.6), c(-70.2, 18.9), c(-70, 18.6)))
)
mpol.sfg <- st_multipolygon(matrizmpol)
mpol.sfg
## MULTIPOLYGON (((-70.7 18.6, -70.4 18.6, -70.4 18.9, -70.7 18.9, -70.7 18.6)), ((-70 18.6, -70.3 18.6, -70.2 18.9, -70 18.6)))
plot(mpol.sfg, col = 'red'); box()
```

<img src="../img/geomsm-1.png" width="33%" /><img src="../img/geomsm-2.png" width="33%" /><img src="../img/geomsm-3.png" width="33%" />

Finalmente, combinaremos varios elementos en una colección, para lo cual
usaremos los elementos creados anteriormente.

``` r
# colec <- c(pto, lin, pol)
colec1.sfg <- st_geometrycollection(list(pto.sfg, lin.sfg, pol.sfg))
plot(colec1.sfg, col = 'red'); box()
colec2.sfg <- st_geometrycollection(list(mpto.sfg, mlin.sfg, mpol.sfg))
plot(colec2.sfg, col = 'red'); box()
```

<img src="../img/colec-1.png" width="50%" /><img src="../img/colec-2.png" width="50%" />

Recordemos que, hasta este punto, hemos creado elementos basados en
geometrías simples (*simple feature geometries*, `sfg`). Un objeto `sfg`
contiene sólo un elemento, que puede ser sencillo, multi\* o una
colección. Además, aunque las `sfg` se construyen usando coordenadas,
éstas no cuentan con sistema de referencia espacial (CRS). La *simple
feature column* (`sfc`), al ser una lista, permite alojar varios
elementos y también admite la definición de CRS. La `sfc` es importante
porque representa la columna geométrica de un *simple feature* (`sf`),
por lo que debemos reconocerla para comprender el modelo de un `sf`.
Generaremos una `sfc` a partir de algunos de los `sfg` del objeto
`pto.sfg` creado anteriormente (se podrían utilizar los otros
igualmente, o combinarlos), y no asignaremos por el momento CRS alguno.

``` r
pto.sfc <- st_sfc(pto.sfg)
pto.sfc
## Geometry set for 1 feature 
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: -70.3 ymin: 19 xmax: -70.3 ymax: 19
## epsg (SRID):    NA
## proj4string:    NA
## POINT (-70.3 19)
plot(pto.sfc, col = 'red'); box()
```

![](../img/ptosfc-1.png)<!-- -->

Aunque la representación gráfica de `pto.sfc` es idéntica a la de su
homólogo `pto.sfg`, la diferencia radica en la clase del objeto.

``` r
class(pto.sfg)
## [1] "XY"    "POINT" "sfg"
class(pto.sfc)
## [1] "sfc_POINT" "sfc"
```

Ahora creemos `sfc` basadas en las geometrías línea (`lin.sfg`),
polígono (`pol.sfg`), multipolígono (`mpol.sfg`) y colección
(`colec.sfg`).

``` r
lin.sfc <- st_sfc(lin.sfg)
lin.sfc
## Geometry set for 1 feature 
## geometry type:  LINESTRING
## dimension:      XY
## bbox:           xmin: -71.5 ymin: 18 xmax: -71.2 ymax: 18.4
## epsg (SRID):    NA
## proj4string:    NA
## LINESTRING (-71.5 18, -71.2 18, -71.2 18.4, -71...
plot(lin.sfc, col = 'red'); box()
pol.sfc <- st_sfc(pol.sfg)
pol.sfc
## Geometry set for 1 feature 
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: -70.7 ymin: 18.6 xmax: -70.4 ymax: 18.9
## epsg (SRID):    NA
## proj4string:    NA
## POLYGON ((-70.7 18.6, -70.4 18.6, -70.4 18.9, -...
plot(pol.sfc, col = 'red'); box()
mpol.sfc <- st_sfc(mpol.sfg)
mpol.sfc
## Geometry set for 1 feature 
## geometry type:  MULTIPOLYGON
## dimension:      XY
## bbox:           xmin: -70.7 ymin: 18.6 xmax: -70 ymax: 18.9
## epsg (SRID):    NA
## proj4string:    NA
## MULTIPOLYGON (((-70.7 18.6, -70.4 18.6, -70.4 1...
plot(mpol.sfc, col = 'red'); box()
colec1.sfc <- st_sfc(colec1.sfg)
colec1.sfc
## Geometry set for 1 feature 
## geometry type:  GEOMETRYCOLLECTION
## dimension:      XY
## bbox:           xmin: -71.5 ymin: 18 xmax: -70.3 ymax: 19
## epsg (SRID):    NA
## proj4string:    NA
## GEOMETRYCOLLECTION (POINT (-70.3 19), LINESTRIN...
plot(colec1.sfc, col = 'red'); box()
```

<img src="../img/linpolsfc-1.png" width="50%" /><img src="../img/linpolsfc-2.png" width="50%" /><img src="../img/linpolsfc-3.png" width="50%" /><img src="../img/linpolsfc-4.png" width="50%" />

Los dos gráficos de arriba representan `sfc` de líneas y polígonos,
respectivamente. En la franja inferior: izquierda multipolígono, derecha
colección.

En el resumen de cada objeto podemos notar que no se ha definido ningún
CRS (`epsg (SRID): NA` y `proj4string: NA`. En cualquier caso, para
consultar el CRS de cualquier `sfc` utilizamos la función `st_crs`.

``` r
st_crs(pto.sfc)
## Coordinate Reference System: NA
```

Todas las geometrías dentro de una `sfc` deben tener el mismo CRS.
Podemos definir el CRS de un objeto al crear la `sfc`, o
alternativamente lo definimos luego de creado el objeto.

``` r
#Al crear el objeto, argumento crs de la función st_sfc
pto.sfc <- st_sfc(pto.sfg, crs = 4326)
pto.sfc
## Geometry set for 1 feature 
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: -70.3 ymin: 19 xmax: -70.3 ymax: 19
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## POINT (-70.3 19)
#Alternativamente, usando la función st_crs()
st_crs(lin.sfc) <- 4326
lin.sfc
## Geometry set for 1 feature 
## geometry type:  LINESTRING
## dimension:      XY
## bbox:           xmin: -71.5 ymin: 18 xmax: -71.2 ymax: 18.4
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## LINESTRING (-71.5 18, -71.2 18, -71.2 18.4, -71...
#También admite cadenas de texto proj4string:
st_crs(pol.sfc) <- '+proj=longlat +datum=WGS84 +no_defs'
pol.sfc
## Geometry set for 1 feature 
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: -70.7 ymin: 18.6 xmax: -70.4 ymax: 18.9
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## POLYGON ((-70.7 18.6, -70.4 18.6, -70.4 18.9, -...
```

Finalmente, construyamos un *simple feature* `sf`. Disponemos de una
columna geométrica pero necesitamos atributos. Por lo tanto, primero que
crearemos atributos y luego `sf`.

``` r
#Primero el atributo
pto.atr <- data.frame(nombre='pto')
#Luego creamos el sf
pto.sf <- st_sf(pto.atr, geometry = pto.sfc)
```

¿Cuál sería el proceso si lo desarrolláramos desde cero? Primero creemos
la geometría para el punto, luego la columna geométrica, luego los
atributos y finalmente el *simple feature*.

``` r
#Geometría simple
pto.sfg <- st_point(c(-70.3, 19))
#Columna de geometría simple
pto.sfc <- st_sfc(pto.sfg, crs = 4326)
#Atributo
pto.atr <- data.frame(nombre='Mi punto')
pto.atr##Sólo un objeto, por lo tanto, sólo un atributo
##     nombre
## 1 Mi punto
#Simple feature
pto.sf <- st_sf(pto.atr, geometry = pto.sfc)
pto.sf
## Simple feature collection with 1 feature and 1 field
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: -70.3 ymin: 19 xmax: -70.3 ymax: 19
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
##     nombre         geometry
## 1 Mi punto POINT (-70.3 19)
#La clase es la misma que para mun.sf
class(pto.sf)
## [1] "sf"         "data.frame"
class(mun.sf)
## [1] "sf"         "data.frame"
```

Creemos `sf` a partir de la colección `pto.sfc`, `lin.sfc` y `pol.sfc`.
Necesitaremos crearles atributos y generar el `sf`.

``` r
lin.sfc
## Geometry set for 1 feature 
## geometry type:  LINESTRING
## dimension:      XY
## bbox:           xmin: -71.5 ymin: 18 xmax: -71.2 ymax: 18.4
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## LINESTRING (-71.5 18, -71.2 18, -71.2 18.4, -71...
lin.atr <- data.frame(nombre = 'Mi línea')
lin.sf <- st_sf(lin.atr, lin.sfc)
lin.sf
## Simple feature collection with 1 feature and 1 field
## geometry type:  LINESTRING
## dimension:      XY
## bbox:           xmin: -71.5 ymin: 18 xmax: -71.2 ymax: 18.4
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
##     nombre                        lin.sfc
## 1 Mi línea LINESTRING (-71.5 18, -71.2...
pol.sfc
## Geometry set for 1 feature 
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: -70.7 ymin: 18.6 xmax: -70.4 ymax: 18.9
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
## POLYGON ((-70.7 18.6, -70.4 18.6, -70.4 18.9, -...
pol.atr <- data.frame(nombre = 'Mi polígono')
pol.sf <- st_sf(pol.atr, pol.sfc)
pol.sf
## Simple feature collection with 1 feature and 1 field
## geometry type:  POLYGON
## dimension:      XY
## bbox:           xmin: -70.7 ymin: 18.6 xmax: -70.4 ymax: 18.9
## epsg (SRID):    4326
## proj4string:    +proj=longlat +datum=WGS84 +no_defs
##        nombre                        pol.sfc
## 1 Mi polígono POLYGON ((-70.7 18.6, -70.4...
```

Finalmente, representemos `pto.sfc`, `lin.sfc` y `pol.sfc` sobre el mapa
de municipios de RD. Para fines de consistencia, transformaremos
`mun.sf` al CRS EPSG:4326, generando el objeto `mun.sf.ll`, el cual será
el mapa de fondo (se podría realizar la operación contraria, es decir,
convertir `pto.sfc`, `lin.sfc` y `pol.sfc` a EPSG:32619, pero sería más
trabajoso). Para la representación utilizaremos el paquete `tmap`, el
cual requiere, como mínimo, un objeto fuente y, posteriormente, uno o
varios elementos o capas de símbolos. Así, mediante la función
`tm_shape`, se especifica el objeto que contiene la geometría, y las
funciones `tm_dots`, `tm_lines`, `tm_borders` y `tm_fill` (entre otras)
definen cómo se representan las
geometrías.

``` r
mun.sf.ll <- st_transform(mun.sf, crs = 4326) #Transformación a EPSG:4326
tmap_options(max.categories = 155) #Aumentando el máx. número de categorías para tmap
tm_shape(mun.sf.ll) + tm_fill('TOPONIMIA', legend.show = F) +  tm_borders('grey') +
  tm_shape(shp = pto.sf) + tm_dots('black', size = 0.5) +
  tm_shape(shp = lin.sf) + tm_lines(col='black') +
  tm_shape(shp = pol.sf) + tm_fill(col='black')
```

![](../img/tmmunptlinpol-1.png)<!-- -->

## Análisis exploratorio de datos espaciales (ESDA)

Cerremos esta introducción a R con un ligero análisis exploratorio de
datos espaciales (ESDA). Aunque en lecciones posteriores abordaremos el
ESDA en profundidad, en este cierre veremos los pasos básicos para hacer
que las geometrías “brillen” con atributos reales. Tendremos que unir
los datos espaciales con atributos externos (la unión tradicional, o
*join*)

No hace falta abordar el problema de la unidad de área modificable en
este punto. Baste decir por el momento que cualquier división que
utilicemos es y será arbitraria. Si bien la mayoría de las agencias
nacionales de estadística sirven sus datos a nivel de términos
municipales, regiones o provincias (u otras unidades), no olvidemos que
existe un sesgo inherente por no garantizarse la independencia de
observaciones. Dado que trabajaremos con mapas, valga esta advertencia
tomada de Bivand, Pebesma, & Gomez-Rubio (2013):

> Trying to detect pattern in maps of residuals visually is not an
> acceptable choice, although one sometimes hears comments explaining
> the lack of formal analysis such as ‘they looked random’, or
> alternatively ‘I can see the clusters’.

> Tratar de detectar un patrón visualmente en mapas de residuos no es
> una opción aceptable, aunque algunas veces se escuchan comentarios que
> explican la falta de análisis formal, tales como ‘la variable se veía
> aleatoria’, o, alternativamente, ‘veo grupos/conglomerados’.

Tómese también en cuenta el mito de John Snow (Brody, Rip,
Vinten-Johansen, Paneth, & Rachman, 2000). Demos a los mapas su justa
valoración, no los mitifiquemos ni los ignoremos. Hoy en día “cualquiera
puede hacer mapas”, pero no cualquiera puede interpretarlos.
Exploraremos los datos de población a nivel municipal del IX Censo
Nacional de Población y Vivienda 2010, algo que probablemente has
realizado previamente en paquete SIG. La fuente es la [Oficina Nacional
de Estadística](https://www.one.gob.do/), a través de la [plataforma
REDATAM](https://www.one.gob.do/recursos-automatizados/consulta-en-linea-redatam).
Descargué una consulta con algunas variables, incluyendo agregados de
población totales y por sexo. La plataforma ofrece formatos Excel y PDF.
Descargué un archivo Excel y lo convertí a formato “valores separados
por coma”, que no es propietario. El archivo resultante está alojado en
el repo, concretamente en
`data/pop_adm3.csv`.

``` r
pop.mun <- read_csv('data/pop_adm3.csv') #read_csv pertenece al paquete readr, de la colección tidyverse
## Parsed with column specification:
## cols(
##   .default = col_double(),
##   `Municipio de residencia` = col_character()
## )
## See spec(...) for full column specifications.
pop.mun
## # A tibble: 155 x 256
##     Code `Municipio de r… `Jefa o jefe` `Esposo (a) o c… `Hijo (a)`
##    <dbl> <chr>                    <dbl>            <dbl>      <dbl>
##  1 10901 Municipio Moca           48032            28717      67964
##  2 10902 Municipio Cayet…          2095             1118       2461
##  3 10903 Municipio Gaspa…         11270             6144      13433
##  4 10904 Municipio Jamao…          2330             1248       2646
##  5 11801 Municipio Puert…         48041            25936      56957
##  6 11802 Municipio Altam…          5875             3130       6073
##  7 11803 Municipio Guana…          2010             1097       1900
##  8 11804 Municipio Imbert          6937             3524       7487
##  9 11805 Municipio Los H…          3653             2033       3997
## 10 11806 Municipio Luper…          5170             2841       5177
## # … with 145 more rows, and 251 more variables: `Hijo (a) de
## #   crianza` <dbl>, `Padre o madre` <dbl>, `Nieto (a)` <dbl>, `Suegro
## #   (a)` <dbl>, `Abuelo (a)` <dbl>, `Hermano (a)` <dbl>, `Empleado (a)
## #   doméstico (a)` <dbl>, `Otro pariente` <dbl>, `Yerno o nuera` <dbl>,
## #   `No pariente` <dbl>, `Miembro de un hogar colectivo` <dbl>,
## #   Hombres <dbl>, Mujeres <dbl>, `0` <dbl>, `1` <dbl>, `2` <dbl>,
## #   `3` <dbl>, `4` <dbl>, `5` <dbl>, `6` <dbl>, `7` <dbl>, `8` <dbl>,
## #   `9` <dbl>, `10` <dbl>, `11` <dbl>, `12` <dbl>, `13` <dbl>, `14` <dbl>,
## #   `15` <dbl>, `16` <dbl>, `17` <dbl>, `18` <dbl>, `19` <dbl>,
## #   `20` <dbl>, `21` <dbl>, `22` <dbl>, `23` <dbl>, `24` <dbl>,
## #   `25` <dbl>, `26` <dbl>, `27` <dbl>, `28` <dbl>, `29` <dbl>,
## #   `30` <dbl>, `31` <dbl>, `32` <dbl>, `33` <dbl>, `34` <dbl>,
## #   `35` <dbl>, `36` <dbl>, `37` <dbl>, `38` <dbl>, `39` <dbl>,
## #   `40` <dbl>, `41` <dbl>, `42` <dbl>, `43` <dbl>, `44` <dbl>,
## #   `45` <dbl>, `46` <dbl>, `47` <dbl>, `48` <dbl>, `49` <dbl>,
## #   `50` <dbl>, `51` <dbl>, `52` <dbl>, `53` <dbl>, `54` <dbl>,
## #   `55` <dbl>, `56` <dbl>, `57` <dbl>, `58` <dbl>, `59` <dbl>,
## #   `60` <dbl>, `61` <dbl>, `62` <dbl>, `63` <dbl>, `64` <dbl>,
## #   `65` <dbl>, `66` <dbl>, `67` <dbl>, `68` <dbl>, `69` <dbl>,
## #   `70` <dbl>, `71` <dbl>, `72` <dbl>, `73` <dbl>, `74` <dbl>,
## #   `75` <dbl>, `76` <dbl>, `77` <dbl>, `78` <dbl>, `79` <dbl>,
## #   `80` <dbl>, `81` <dbl>, `82` <dbl>, `83` <dbl>, `84` <dbl>,
## #   `85` <dbl>, `86` <dbl>, …
nrow(pop.mun)
## [1] 155
```

Lamentablmente, el código de enlace en el archivo fuente suprime el ‘0’
a la izquierda en el código de municipio, contenido en el campo
`ENLACE`. Exploremos di

Aprovechemos esta inconsistencia para introducir las tuberías de
`tidyverse`, concretamente en `dplyr`.

``` r
pop.mun <- pop.mun %>%
  mutate(ENLACE = ifelse(
    nchar(Code)==5,
    paste0('0', Code),
    Code)
  )
match(mun.sf$ENLACE, pop.mun$ENLACE)
##   [1] 148  68  69  70  71  72  73  74  75  76  77  91  92  93  94  95  96
##  [18]  97  98  99 100 101 102 103 104 105 106  51  52  53  54  55  34  35
##  [35]  36  37  38  39  40 115 116 117 118 119 120 127 128   1   2   3   4
##  [52] 107 108 109 110 111 112 129 130 131 132 133  23  24  25  26  41  42
##  [69]  43  44  56  57  58  59  60  61 113 114  78  79   5   6   7   8   9
##  [86]  10  11  12  13  45  46  47  48  49  50  80  81  82  83  84  85  86
## [103]  87 121 122 123 124 125 126 134 135 136 137 138 139  27  28  29  30
## [120]  14  15  16  17  18  19  20  21  22  62  63  64  65  66  67  31  32
## [137]  33 140 141 142 143 144 145 146 147  88  89  90 149 150 151 152 153
## [154] 154 155
```

## Conclusión

Conociste las herramientas básicas sobre creación y gestión de *simple
features*. También te introduciste en la realización de ESDA, incluyendo
soporte gráfico. **El ESDA es un paso imprescindible en cualquier
investigación**, así que, ya que no te lo podrás saltar, es necesario
que practiques con los datos de ejemplo mostrados aquí, o con los tuyos
propiamente.

El paquete `sf` tiene la ventaja de que está “saborizado” al estilo
`tidyverse`, y esto te ayudará a realizar tu ESDA mediante las tuberías
de esta potente colección de paquetes.

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

<div id="ref-bivand2013applied">

Bivand, R. S., Pebesma, E. J., & Gomez-Rubio, V. (2013). *Applied
spatial data analysis with R*. Springer.

</div>

<div id="ref-brody2000map">

Brody, H., Rip, M. R., Vinten-Johansen, P., Paneth, N., & Rachman, S.
(2000). Map-making and myth-making in broad street: The london cholera
epidemic, 1854. *The Lancet*, *356*(9223), 64–68.

</div>

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

1.  De la capa municipios, la geometría correspondiente al municipio
    “Guayubín” resultó ser no válida y fue arreglada
