
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Modelización de datos espaciales basados en geometrías poligonales

## Introducción

La mayor parte de los servicios de estadística nacionales ofrecen sus
datos basados en geometrías poligonales. Esto implica que la mayor parte
de los datos están afectados por el **problema de la unidad de área
modificable** (PUAM, MAUP por sus siglas en inglés). Este problema se
define como una fuente de sesgo estadístico que ocurre a partir de
asignar a un área determinada (probablemente heterogénea) datos
puntuales colectados dentro de ella. La delimitación de la misma, por lo
tanto, puede cambiar completamente el resultado obtenido. Si a esto se
le añade que la delimitación de las áreas cambia en el tiempo, el
problema no es sólo espacial, sino también temporal, produciendo
inconsistencias en la base de datos que es necesario corregir.

Una solución apropiada para estos casos consiste en producir regresores
que consideren los efectos locales (e.g. modelizaciones
autorregresivas), de manera que los efectos de sesgo producidos por el
PUAM se atenúen. Las modelizaciones autorregresivas requieren considerar
la autocorrelación espacial, puesto que, normalmente, las geometrías
poligonales contienen observaciones que no son independientes entre sí,
con lo cual se viola uno de los supuestos más importantes de la
regresión tradicional.

La modelización espacial autorregresiva tiene varias aplicaciones:

  - Predecir el valor de una variable en un lugar no muestreado.
    Normalmente, los datos poligonales cubren un territorio de manera
    exhaustiva, por lo que esta aplicación no es común en modelizaciones
    espaciales.

  - Explorar el grado de asociación entre una o varias variables
    independientes con una dependiente. Esta es una de las aplicaciones
    más empleadas, puesto que normalmente nos interesa conocer si existe
    asociación estadística una vez se han considerado el PUAM y la
    autocorrelación espacial.

  - Predecir el valor de una variable dependiente, a partir de valores
    asignados deliberadamente a las independientes en simulaciones que
    exploran escenarios distintos al que sirvió para construir el modelo
    original.

La clave en toda modelización consiste en seleccionar adecuadamente las
variables independientes, de manera que se produzcan resultados con
sentido. La significancia estadística no es el objetivo central, sino
alcanzarla para un modelo que haga sentido.

## Modelización espacial

### Cargar paquetes

``` r
library(tidyverse)
library(sf)
library(spdep)
library(lmtest)
```

### Cargar datos

Visto lo anterior, y para mantenerlo lo menos complejo posible,
exploremos la asociación de una variable de la Encuesta Nacional de
Hogares de Propósitos Múltiples de 2017 (ENHOGAR-2017, descripción
[aquí](https://www.one.gob.do/encuestas/enhogar), datos fuente
[aquí](http://redatam.one.gob.do/cgibin/RpWebEngine.exe/PortalAction?&MODE=MAIN&BASE=ENH2017&MAIN=WebServerMain.inl)),
con otras variables de la propia encuesta.

Utilicemos objetos generados a partir de ENHOGAR 2017, basados en los
principios explicados en la sección de [vecindad](ref/vecindad.md) y
[autocorrelación](ref/autocorrelacion.md). Carguemos el archivo
`objetos_para_modelizacion.RData` localizado en la carpeta `data`, el
cual subirá a memoria los siguientes objetos:

  - `proven17`, `sf` con los datos fuente.

  - `proven17.w.W`, pesos estandarizados por filas (estilo “W”).

  - `proven17.w.B`, pesos binarios (estilo “B”).

<!-- end list -->

``` r
download.file(
  paste0('https://github.com/maestria-geotel-master/',
         'unidad-3-asignacion-1-vecindad-autocorrelacion-espacial/',
         'blob/master/objetos-para-modelizacion.RData?raw=true'),
  'data/objetos-para-modelizacion.RData')
load('data/objetos-para-modelizacion.RData')
```

### Selección de variables

En este ejemplo exploraremos el grado de asociación entre la variable
dependiente `Grupo Socio-Económico: Muy bajo` y las siguientes variables
seleccionadas como independientes:

  - `Sexo del jefe(a) del hogar: Hombre`
  - `Sexo del jefe(a) del hogar: Mujer`
  - `Principales problemas de su barrio o comunidad: ¿La falta de
    energía eléctrica?: Si`
  - `Principales problemas de su barrio o comunidad: ¿La delincuencia?:
    Si`
  - `Principales problemas de su barrio o comunidad: ¿El desempleo?: Si`
  - `Principales problemas de su barrio o comunidad: ¿El consumo de
    drogas?: Si`
  - `Principales problemas de su barrio o comunidad: ¿La corrupción?:
    Si`
  - `Tipo de hogar: Unipersonal`
  - `Tipo de hogar: Nuclear`
  - `Tipo de hogar: Extendido`
  - `Tipo de hogar: Compuesto`

Primero las seleccionamos, atribuyéndoles nombres cortos (debemos
conservar el campo `muestra` para relativizar a continuación):

``` r
varsel <- proven17 %>% dplyr::select(
  ENLACE = ENLACE,
  TOPONIMIA = TOPONIMIA,
  GRUPOMUYBAJO = `Grupo Socio-Económico: Muy bajo`,
  HOMBRE = `Sexo del jefe(a) del hogar: Hombre`,
  MUJER = `Sexo del jefe(a) del hogar: Mujer`,
  ELECTRICA = `Principales problemas de su barrio o comunidad: ¿La falta de energía eléctrica?: Si`,
  DELINCUENCIA = `Principales problemas de su barrio o comunidad: ¿La delincuencia?: Si`,
  DESEMPLEO = `Principales problemas de su barrio o comunidad: ¿El desempleo?: Si`,
  DROGAS = `Principales problemas de su barrio o comunidad: ¿El consumo de drogas?: Si`,
  CORRUPCION = `Principales problemas de su barrio o comunidad: ¿La corrupción?: Si`,
  HOGARUNI = `Tipo de hogar: Unipersonal`,
  HOGARNUC = `Tipo de hogar: Nuclear`,
  HOGAREXT = `Tipo de hogar: Extendido`,
  HOGARCOMP = `Tipo de hogar: Compuesto`,
  MUESTRA = muestra)
```

Posteriormente relativizamos todas las columnas numéricas con el campo
`MUESTRA` (nuevo nombre del anterior `muestra`), generando así nuevas
columnas de porcentaje (nombre de columnas con sufijo `_PCT`). Al mismo
tiempo, obtendremos los logaritmos en base `e` de los porcentajes
(nombre de columnas con sufijo `_PCTLOG`)

``` r
varselpctlog <- varsel %>% mutate_each(
  funs(PCT=round(./MUESTRA,4)*100,
       PCTLOG=log(round(./MUESTRA,4)*100)),
  -1, -2, -geom, -MUESTRA)
```

    ## Warning: funs() is soft deprecated as of dplyr 0.8.0
    ## Please use a list of either functions or lambdas: 
    ## 
    ##   # Simple named list: 
    ##   list(mean = mean, median = median)
    ## 
    ##   # Auto named with `tibble::lst()`: 
    ##   tibble::lst(mean, median)
    ## 
    ##   # Using lambdas
    ##   list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
    ## This warning is displayed once per session.

### Evaluación de autocorrelación, normalidad y homocedasticidad

En el siguiente panel de mapas, nótese que la variable `Grupo
Socio-Económico: Muy bajo` está autocorrelacionada localmente
(arriba-izquierda):

![](../img/lisamaps-1-12.png)

Comprobemos igualmente su autocorrelación mediante la prueba
global:

``` r
(gmoranw <- moran.test(x = varselpctlog$GRUPOMUYBAJO_PCT, listw = proven17.w.W))
```

    ## 
    ##  Moran I test under randomisation
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCT  
    ## weights: proven17.w.W    
    ## 
    ## Moran I statistic standard deviate = 4.3549, p-value = 6.655e-06
    ## alternative hypothesis: greater
    ## sample estimates:
    ## Moran I statistic       Expectation          Variance 
    ##        0.43809978       -0.03225806        0.01166526

``` r
(gmoranb <- moran.test(x = varselpctlog$GRUPOMUYBAJO_PCT, listw = proven17.w.B))
```

    ## 
    ##  Moran I test under randomisation
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCT  
    ## weights: proven17.w.B    
    ## 
    ## Moran I statistic standard deviate = 4.3041, p-value = 8.385e-06
    ## alternative hypothesis: greater
    ## sample estimates:
    ## Moran I statistic       Expectation          Variance 
    ##       0.397555409      -0.032258065       0.009972502

``` r
(gmoranwl <- moran.test(x = varselpctlog$GRUPOMUYBAJO_PCTLOG, listw = proven17.w.W))
```

    ## 
    ##  Moran I test under randomisation
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCTLOG  
    ## weights: proven17.w.W    
    ## 
    ## Moran I statistic standard deviate = 4.5622, p-value = 2.531e-06
    ## alternative hypothesis: greater
    ## sample estimates:
    ## Moran I statistic       Expectation          Variance 
    ##        0.49973891       -0.03225806        0.01359788

``` r
(gmoranbl <- moran.test(x = varselpctlog$GRUPOMUYBAJO_PCTLOG, listw = proven17.w.B))
```

    ## 
    ##  Moran I test under randomisation
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCTLOG  
    ## weights: proven17.w.B    
    ## 
    ## Moran I statistic standard deviate = 4.0865, p-value = 2.19e-05
    ## alternative hypothesis: greater
    ## sample estimates:
    ## Moran I statistic       Expectation          Variance 
    ##        0.40683290       -0.03225806        0.01154548

Si el valor de p es inferior al nivel de significancia (comúnmente
fijado en 0.05 o 0.01), se rechaza la hipótesis nula “No hay
autocorrelación espacial”. Por lo tanto, concluimos que hay, a priori,
autocorrelación espacial, tanto para la variable original (sufijo
`_PCT`) como la versión transformada (sufijo `_PCTLOG`).

Evaluemos si el supuesto de normalidad se cumple:

``` r
shapiro.test(varselpctlog$GRUPOMUYBAJO_PCT)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCT
    ## W = 0.84296, p-value = 0.0002932

``` r
shapiro.test(varselpctlog$GRUPOMUYBAJO_PCTLOG)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  varselpctlog$GRUPOMUYBAJO_PCTLOG
    ## W = 0.97892, p-value = 0.7677

Al menos sí se cumple para la versión transformada sí cumple el supuesto
de normalidad.

Construyamos ahora un modelo lineal común, utilizando las versiones
transformadas de las variables, veamos su resumen y evaluemos
homocedasticidad:

``` r
modlin <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>% lm(GRUPOMUYBAJO_PCTLOG ~ ., .)
modlin %>% summary
```

    ## 
    ## Call:
    ## lm(formula = GRUPOMUYBAJO_PCTLOG ~ ., data = .)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -0.49217 -0.16685  0.01284  0.14142  0.66978 
    ## 
    ## Coefficients:
    ##                      Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept)         -21.29195   35.64569  -0.597  0.55700   
    ## HOMBRE_PCTLOG        -0.02306    1.51066  -0.015  0.98797   
    ## MUJER_PCTLOG         -1.73077    1.92682  -0.898  0.37974   
    ## ELECTRICA_PCTLOG      0.07684    0.12228   0.628  0.53685   
    ## DELINCUENCIA_PCTLOG  -1.56293    0.43121  -3.625  0.00169 **
    ## DESEMPLEO_PCTLOG     -0.02908    0.25802  -0.113  0.91139   
    ## DROGAS_PCTLOG         0.38298    0.29156   1.314  0.20386   
    ## CORRUPCION_PCTLOG     0.09101    0.15388   0.591  0.56085   
    ## HOGARUNI_PCTLOG       3.31622    2.14731   1.544  0.13818   
    ## HOGARNUC_PCTLOG       3.11507    5.37077   0.580  0.56839   
    ## HOGAREXT_PCTLOG       3.72141    2.88994   1.288  0.21255   
    ## HOGARCOMP_PCTLOG      0.59687    0.65840   0.907  0.37544   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3417 on 20 degrees of freedom
    ## Multiple R-squared:  0.859,  Adjusted R-squared:  0.7814 
    ## F-statistic: 11.07 on 11 and 20 DF,  p-value: 2.964e-06

``` r
modlin %>% bptest
```

    ## 
    ##  studentized Breusch-Pagan test
    ## 
    ## data:  .
    ## BP = 11.422, df = 11, p-value = 0.4087

Aunque la selección tiene muchas variables, de éstas sólo resulta
significativa `DELINCUENCIA_PCTLOG`.

Finalmente, ejecutemos el modelo espacial autorregresivo, en este caso,
la variate *Simultaneous Autorregresive Model*.

``` r
sar <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>%
  spautolm(
    formula = GRUPOMUYBAJO_PCTLOG ~ .,
    data = .,
    listw = proven17.w.W)
summary(sar)
```

    ## 
    ## Call: 
    ## spautolm(formula = GRUPOMUYBAJO_PCTLOG ~ ., data = ., listw = proven17.w.W)
    ## 
    ## Residuals:
    ##       Min        1Q    Median        3Q       Max 
    ## -0.438110 -0.190565 -0.017405  0.146964  0.473962 
    ## 
    ## Coefficients: 
    ##                       Estimate Std. Error z value  Pr(>|z|)
    ## (Intercept)         -26.938386  27.020068 -0.9970   0.31878
    ## HOMBRE_PCTLOG         2.499280   1.218992  2.0503   0.04034
    ## MUJER_PCTLOG          1.435312   1.508363  0.9516   0.34132
    ## ELECTRICA_PCTLOG      0.028502   0.096690  0.2948   0.76816
    ## DELINCUENCIA_PCTLOG  -2.072107   0.292874 -7.0751 1.494e-12
    ## DESEMPLEO_PCTLOG     -0.032477   0.182830 -0.1776   0.85901
    ## DROGAS_PCTLOG         0.759808   0.240476  3.1596   0.00158
    ## CORRUPCION_PCTLOG     0.179572   0.102914  1.7449   0.08101
    ## HOGARUNI_PCTLOG       2.552201   1.627949  1.5677   0.11694
    ## HOGARNUC_PCTLOG       0.858078   4.258964  0.2015   0.84033
    ## HOGAREXT_PCTLOG       2.495062   2.259506  1.1043   0.26948
    ## HOGARCOMP_PCTLOG      0.508801   0.479667  1.0607   0.28881
    ## 
    ## Lambda: -1.0782 LR test value: 3.5316 p-value: 0.060211 
    ## Numerical Hessian standard error of lambda: 0.37874 
    ## 
    ## Log likelihood: -1.760494 
    ## ML residual variance (sigma squared): 0.050063, (sigma: 0.22375)
    ## Number of observations: 32 
    ## Number of parameters estimated: 14 
    ## AIC: 31.521

``` r
sar2 <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>%
  spautolm(
    formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + DROGAS_PCTLOG + CORRUPCION_PCTLOG + HOGARUNI_PCTLOG,
    data = .,
    listw = proven17.w.W)
summary(sar2)
```

    ## 
    ## Call: 
    ## spautolm(formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + 
    ##     DROGAS_PCTLOG + CORRUPCION_PCTLOG + HOGARUNI_PCTLOG, data = ., 
    ##     listw = proven17.w.W)
    ## 
    ## Residuals:
    ##       Min        1Q    Median        3Q       Max 
    ## -0.698164 -0.264656 -0.046709  0.236488  0.813544 
    ## 
    ## Coefficients: 
    ##                      Estimate Std. Error z value  Pr(>|z|)
    ## (Intercept)         -1.049617   2.896252 -0.3624   0.71705
    ## HOMBRE_PCTLOG        1.781792   0.750746  2.3734   0.01763
    ## DELINCUENCIA_PCTLOG -1.821760   0.267154 -6.8191 9.158e-12
    ## DROGAS_PCTLOG        0.593818   0.242171  2.4521   0.01420
    ## CORRUPCION_PCTLOG    0.032144   0.158543  0.2027   0.83933
    ## HOGARUNI_PCTLOG      0.605869   0.479953  1.2624   0.20682
    ## 
    ## Lambda: 0.23215 LR test value: 0.5493 p-value: 0.45861 
    ## Numerical Hessian standard error of lambda: 0.28962 
    ## 
    ## Log likelihood: -13.92707 
    ## ML residual variance (sigma squared): 0.13802, (sigma: 0.3715)
    ## Number of observations: 32 
    ## Number of parameters estimated: 8 
    ## AIC: 43.854

``` r
sar3 <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>%
  spautolm(
    formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + DROGAS_PCTLOG + HOGARUNI_PCTLOG,
    data = .,
    listw = proven17.w.W)
summary(sar3)
```

    ## 
    ## Call: 
    ## spautolm(formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + 
    ##     DROGAS_PCTLOG + HOGARUNI_PCTLOG, data = ., listw = proven17.w.W)
    ## 
    ## Residuals:
    ##       Min        1Q    Median        3Q       Max 
    ## -0.694426 -0.262951 -0.042204  0.234548  0.834801 
    ## 
    ## Coefficients: 
    ##                     Estimate Std. Error z value  Pr(>|z|)
    ## (Intercept)         -1.15210    2.84607 -0.4048  0.685623
    ## HOMBRE_PCTLOG        1.77591    0.75200  2.3616  0.018197
    ## DELINCUENCIA_PCTLOG -1.80272    0.26315 -6.8505 7.358e-12
    ## DROGAS_PCTLOG        0.61342    0.20702  2.9632  0.003045
    ## HOGARUNI_PCTLOG      0.62918    0.45853  1.3722  0.170011
    ## 
    ## Lambda: 0.24715 LR test value: 0.72156 p-value: 0.39563 
    ## Numerical Hessian standard error of lambda: 0.27227 
    ## 
    ## Log likelihood: -13.94611 
    ## ML residual variance (sigma squared): 0.13793, (sigma: 0.37139)
    ## Number of observations: 32 
    ## Number of parameters estimated: 7 
    ## AIC: 41.892

``` r
sar4 <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>%
  spautolm(
    formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + DROGAS_PCTLOG,
    data = .,
    listw = proven17.w.W)
summary(sar4)
```

    ## 
    ## Call: 
    ## spautolm(formula = GRUPOMUYBAJO_PCTLOG ~ HOMBRE_PCTLOG + DELINCUENCIA_PCTLOG + 
    ##     DROGAS_PCTLOG, data = ., listw = proven17.w.W)
    ## 
    ## Residuals:
    ##       Min        1Q    Median        3Q       Max 
    ## -0.739399 -0.300631  0.014066  0.254944  0.752487 
    ## 
    ## Coefficients: 
    ##                     Estimate Std. Error z value  Pr(>|z|)
    ## (Intercept)         -0.41338    2.85211 -0.1449  0.884760
    ## HOMBRE_PCTLOG        2.06443    0.73921  2.7928  0.005226
    ## DELINCUENCIA_PCTLOG -1.76530    0.27281 -6.4709 9.743e-11
    ## DROGAS_PCTLOG        0.56704    0.20807  2.7252  0.006427
    ## 
    ## Lambda: 0.32006 LR test value: 1.6315 p-value: 0.20149 
    ## Numerical Hessian standard error of lambda: 0.23302 
    ## 
    ## Log likelihood: -14.81359 
    ## ML residual variance (sigma squared): 0.14407, (sigma: 0.37957)
    ## Number of observations: 32 
    ## Number of parameters estimated: 6 
    ## AIC: 41.627

``` r
sar5 <- varselpctlog %>% select(contains('_PCTLOG')) %>%
  st_drop_geometry() %>%
  spautolm(
    formula = GRUPOMUYBAJO_PCTLOG ~ DELINCUENCIA_PCTLOG + DROGAS_PCTLOG +  + HOGARUNI_PCTLOG,
    data = .,
    listw = proven17.w.W)
summary(sar5)
```

    ## 
    ## Call: spautolm(formula = GRUPOMUYBAJO_PCTLOG ~ DELINCUENCIA_PCTLOG + 
    ##     DROGAS_PCTLOG + +HOGARUNI_PCTLOG, data = ., listw = proven17.w.W)
    ## 
    ## Residuals:
    ##       Min        1Q    Median        3Q       Max 
    ## -0.875923 -0.274885  0.010623  0.251982  0.897522 
    ## 
    ## Coefficients: 
    ##                     Estimate Std. Error z value Pr(>|z|)
    ## (Intercept)          4.37640    1.68246  2.6012 0.009290
    ## DELINCUENCIA_PCTLOG -1.77806    0.28742 -6.1863 6.16e-10
    ## DROGAS_PCTLOG        0.62435    0.21891  2.8521 0.004343
    ## HOGARUNI_PCTLOG      0.93006    0.47432  1.9608 0.049901
    ## 
    ## Lambda: 0.32399 LR test value: 1.0095 p-value: 0.31503 
    ## Numerical Hessian standard error of lambda: 0.28879 
    ## 
    ## Log likelihood: -16.48338 
    ## ML residual variance (sigma squared): 0.15981, (sigma: 0.39977)
    ## Number of observations: 32 
    ## Number of parameters estimated: 6 
    ## AIC: 44.967

## Referencias
