
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->

# Programa de “Análisis Espacial” <br/> Maestría en Geografía, Teledetección y Ciencias de la Información Geográfica <br/> Universidad Autónoma de Santo Domingo (UASD)

Octubre 2019 <br/> *José Ramón Martínez Batlle*

## Básicos:

  - Correo: <jmartinez19@uasd.edu.do>
  - Lugar y horario: Salón de Posgrado de Matemática, Lunes de 5 a 9 pm,
    Martes de 6 a 10 pm

## URLs del contenido del curso:

  - [Programa (hipervínculo recursivo)](programa-analisis-espacial.md)
  - [¿Cómo realizar una asignación?](ref/como-hacer-una-asignacion.md)
  - [Guía mínima de RMarkdown](ref/guia-minima-de-rmarkdown.md)
  - [Introducción a R](ref/introduccion-a-r.md)

## Descripción

Waldo Tobler se auto-atribuyó la denominada “primera ley de la
geografía”:

> “…I invoke the first law of geography: everything is related to
> everything else, but near things are more related than distant
> things.” (Tobler, 1970). En español sería: “Invoco la primera ley de
> la geografía: todo está relacionado con todo, pero las cosas próximas
> entre sí están más relacionadas que las distantes”.

El propio Tobler añadía en su artículo que “El hecho de que un proceso
parezca complicado, no es motivo para suponer que es el resultado de
reglas complicadas…”. A partir de este punto, el autor dedica su trabajo
a explicar un modelo de crecimiento urbano en Detroit basado en la
densidad de población de las localidades que según él, podía aplicarse a
otras ciudades. Basó sus aportes precisamente en que lo próximo es más
parecido que lo distante, algo que conocemos hoy como autocorrelación
espacial. Con independencia de la eficiencia de su modelo, Tobler
continuó el camino de descomplicar las reglas, dando cuerpo matemático a
este hecho.

Varios autores han aportado herramientas para medir la autocorrelación
espacial, o para considerarla en predicciones probabilísticas mediante
geoestadística, siendo relevantes las contribuciones de Moran (1948),
Geary (1954), Matheron (1963), Anselin & Griffith (1988), Cliff & Ord
(1972), Cressie (1989), Isaaks & Srivastava (1989), Goovaerts & others
(1997), Getis & Ord (2010), entre otros.

Los datos espaciales tienen estructura, es decir, no son independientes
entre sí, por lo que cualquier modelización que se intente realizar
violará el supuesto de independencia de las observaciones, convirtiendo
en absolutamente inútil la regresión lineal estándar. La estructura de
los datos espaciales normalmente explica una parte importante del
fenómeno, y ésta se encuentra en la forma de autocorrelación espacial
y/o de heterogeneidad. Usando análisis exploratorio de datos espaciales,
es posible medir tales características, si bien en términos prácticos no
es fácil separar autocorrelación y heterogeneidad. Se trata una tarea
imprescindible pero a la vez desafiante, porque los datos reales son,
por defecto, muy diferentes a “los de libro”.

> “…It is not always easy to distinguish between the two components, and
> poorly specifying one could cause the other to also be
> erroneous…Depending on the question, the methodology will first deal
> with the spatial autocorrelation of the observations (i.e. the links
> between nearby units) or the heterogeneity of behaviours (i.e. their
> variability depending on location).” (Loonis & Bellefon, 2018)

Son muchas las herramientas disponibles, la mayoría de las cuales cuenta
con interfaz de usuario (no necesariamente gráfico). Para el análisis
exploratorio de datos espaciales, hay disponibles múltiples herramientas
gráficas e índices, y para la predicción existen varios algoritmos de
modelización y pruebas estadísticas que asisten en la difícil labor de
elegir variables/modelos. Tratándose de un contexto tan complejo, con un
“menú” diverso de herramientas y configuraciones posibles, la
reproducibilidad de cualquier análisis resulta imprescindible.

Como escribí ya en el programa de otra asignatura que imparto, la
ciencia atraviesa por una crisis de reproducibilidad. Difícilmente un
equipo científico reproduce el resultado que obtuvo otro. Se atribuye
este déficit a que, al publicar los resultados, no se aportan ni las
fuentes, ni los métodos empleados. El panorama está cambiando, pero la
única forma de aumentar la reproducibilidad consiste en abrir las
fuentes y el método de análisis, lo cual en última instancia implica
abrir el código. En análisis espacial es aún más crítica la necesidad de
disponer de un documento reproducible para seguir los pasos de otros/as
investigadores/as.

Puedes sospechar desde ya que [R](https://www.r-project.org/) estará de
fondo (a fin de cuentas, este tali usa mucho R), sobre todo por tratarse
de una asignatura meramente espacial. Dispondrás de un servidor de
RStudio de modestas prestaciones habilitado por mí, con los paquetes
requeridos en el curso ya pre-instalados. Así podrás realizar tus
asignaciones sin preocuparte de instalaciones ni dependencias.

Parecería “natural” utilizar interfaz gráfico de usuario para realizar
análisis espacial, pero verás a lo largo de esta asignatura que lo
razonable es utilizar código. Realizar de manera eficiente análisis
reproducibles sólo se logra escribiendo y ejecutando código. Igualmente,
para visualizar patrones espaciales se requiere de herramientas
versátiles, que tanto R como otros lenguajes proveen normalmente a
través de paquetes.

Aunque en la materia usaremos R, son bienvenidos otros lenguajes de
programación que quieras utilizar. Si sabes Python, C++, Java o
cualquier otro lenguaje que pueda ayudarte a responder preguntas sobre
análisis espacial, puedes usarlos sin inconveniente alguno. La única
condición es que tienes que publicar código que todos los mortales
podamos ejecutar, pero igualmente tendrás que abrir tus fuentes de
datos.

Aunque iniciarse en un lenguaje de programación implica un desafío
inherente, hay formas de hacer que el encontronazo sea leve. Por
ejemplo, se puede recurrir a foros, listas de correo o a la propia
comunidad de desarrolladores para solicitar ayuda ante los típicos
desafíos y los mensajes de error; yo también podré ayudar. La clave
para recibir ayuda eficientemente (y para ayudar a otros) consiste en
trabajarse bien la pregunta: presentar ejemplos, código reproducible y
mensajes de error. No olvides que la comunidad podría interesarse por o
necesitar tus aportes, así que no dudes en hacer un “hola mundo” bien
documentado cuando necesites
ayuda.

## Evaluación

| Ítem                                                                                                                                                                                                                         | % de la <br/> nota final |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -----------------------: |
| [**Proyecto**](#proyecto) <br/> ([Documento de proyecto](#documento-de-proyecto), 30%) <br/> ([Código informático reproducible](#código-informático-reproducible), 40%) <br/> ([Presentación oral](#presentación-oral), 10%) |                  **80%** |
| [Examen basado en código](#examen-basado-en-código)                                                                                                                                                                          |                      20% |

En los párrafos siguientes detallo en qué consiste cada ítem a evaluar.

## Proyecto

El proyecto consta de tres partes: documento, código y presentación.

### Documento de proyecto

Consistirá en un fragmento de manuscrito científico, donde abordarás,
principalmente, los apartados **Metodología** y **Resultados**, y que
publicarás en el GitHub. Debido a la corta duración de la asignatura, no
preveo que produzcas aportación científica; queda a opción tuya
profundizar en tu proyecto a futuro. Elabora tu proyecto según las
siguientes fases:

1.  Formulación de un problema cuya resolución requiera usar técnicas de
    análisis espacial.

2.  Revisión bibliográfica. Aunque no se requerirá una revisión escrita
    (la típica introducción de los artículos científicos), las fuentes
    que uses deberás referirlas apropiadamente. Durante la revisión
    bibliográfica, evita abrumarte con el gran número de publicaciones
    científicas sobre análisis espacial (hay pila, ojo). En la medida de
    lo posible, evita las publicaciones tras muros de pago; consulta y
    refiere preferiblemente publicaciones de acceso libre.

3.  Selección de fuentes y metodología. Las fuentes de datos que usarás
    en tu proyecto deben ser abiertas. Dado que tus repos terminarán en
    modo público, no admitiré fuentes de datos privados (imágenes, bases
    de datos). Al seleccionar tu metodología, identifica las
    herramientas disponibles y verifica (consúltame) que verdaderamente
    te ayudarán a resolver el problema planteado. Recuerda: si conoces
    otros lenguajes de programación diferentes a R, y que sean útiles
    para resolver tu problema, úsalos.

4.  Análisis de datos mediante código reproducible. Podrás ejecutar tus
    análisis en un servidor RStudio de modestas prestaciones habilitado
    por mí. Alternativamente, podrás instalar R, RStudio y los paquetes
    requeridos por tu cuenta en una PC de tu elección. Ofreceré soporte
    para R, como motor de análisis, y también guiaré en la utilización
    de RStudio como **notebook**, y tendrás asignaciones para crear
    archivos RMarkdown. Para crear tus cuadernos puedes utilizar otras
    alternativas, como Jupyter.

5.  Redacción de **Metodología** y **Resultados**.

Los criterios que usaré para evaluar el documento son los siguientes:

1.  Cumplimiento de los requisitos exigidos por el [Anuario de
    Investigaciones Científicas de la
    UASD](docs/instrucciones-para-autores-anuario-investigaciones-cientificas-UASD.pdf)
    para las secciones **Metodología** y **Resultados**, sobre todo los
    de fondo.

2.  Redacción coherente y concisa.

3.  Resultados, con el debido apoyo estadístico y gráfico, que aborden e
    “intenten” resolver el problema planteado.

4.  Opcionalmente puedes escribir conclusiones en tu documento.

Tu documento sólo tendrá los siguientes ítems:

  - Título.
  - Nombre de autor/a.
  - Metodología.
  - Resultados.
  - Código informático reproducible. Puedes incluirlo en el despliegue
    de resultados.
  - Referencias citadas (si aplica).

> El plagio y la falsificación de datos supondrán la reprobación
> inmediata de la asignatura.

### Presentación oral

Dispondrás de 15 minutos para presentar oralmente tu trabajo al final de
la asignatura. Valoraré el dominio que muestres sobre tu trabajo.

### Código informático reproducible

Este es el fuerte de la asignatura, y es imprescindible para culminar
con éxito tu proyecto. Por correo electrónico, te enviaré asignaciones
que te ayudarán a construir tu código reproducible. Las podrás realizar
utilizando el servidor RStudio habilitado por el profesor (sólo
necesitarás una PC con conexión a Internet y un navegador), o utilizando
tu propia PC, pero en este último caso tendrás que instalar R, RStudio y
los paquetes requeridos.

Orientaré con ejemplos y soluciones a través de *issues* que abrirás tú
o yo en el GitHub. De esta forma las discusiones quedarán disponibles
para otras personas. Evita preguntar por correo electrónico, porque
cualquier consulta que realices, así como las posibles soluciones que
surjan, quedarán en privado y sólo serán aprovechables por ti.

Al abrir un *issue* de GitHub debes plantear el problema al que te
enfrentas, cómo has intentado resolverlo o qué soluciones has probado.
Si se trata de cuestiones relacionadas con programación o análisis de
datos, deberás aportar **código reproducible y mensaje de error (si lo
hubiere)**. Evita el típico comentario “da error”, puesto que no conduce
a nada.

## Examen basado en código

Bueno, sobre ésto tengo poco que decir, sólo que preferiría no evaluar
por medio de exámenes.

## Contenido

El típico “temario” de la asignatura, AKA “teoría”, el cual impartiré
con breves introducciones, pero principalmente por medio de
asignaciones. En la medida de lo posible, haré que este contenido sea de
utilidad para los proyectos.

1.  Datos espaciales, y datos espaciales en R (tipos, importar,
    exportar). Capítulo 1 de Loonis & Bellefon (2018), capítulos 1 a 3
    de Lovelace, Nowosad, & Muenchow (2019), capítulos 1 y 2 de Bivand,
    Pebesma, & Gomez-Rubio (2008), capítulo 3 y 4 de Mas (2013).

2.  Manipulación de datos espaciales (operaciones con atributos y
    geométricas). Capítulos 2, 4 y 5 de Bivand et al. (2008), capítulos
    3 a 5 de Lovelace et al. (2019), capítulo 5 de Mas (2013), capítulo
    10 de Olaya (2014).

3.  Vecindad y autocorrelación espacial (análisis exploratorio,
    funciones de homogeneidad espacial, tipos de vecindad, ponderadores,
    índices). Sección 9.2 de Bivand et al. (2008), Capítulos 2 y 3 de
    Loonis & Bellefon (2018), capítulo 12 de Olaya (2014), capítulos B.2
    y B.3 de Fischer & Getis (2009).

4.  Datos puntuales, geoestadística (funciones aleatorias, variograma,
    kriging). Capítulo B.6 de Fischer & Getis (2009), Capítulos 1, 2, 5
    y 6 de Hengl (2009), capítulos 4 y 5 de Loonis & Bellefon (2018),
    capítulos 7 y 8 de Bivand et al. (2008), capítulo 7 de Mas (2013),
    capítulo 13 de Olaya (2014),

5.  Modelización de entidades poligonales. Capítulo 9 de Bivand et al.
    (2008), capítulos 6 a 9 de Loonis & Bellefon (2018), capítulos C.1 a
    C.7 de Fischer & Getis (2009).

## Referencias

<div id="refs" class="references">

<div id="ref-anselin1988spatial">

Anselin, L., & Griffith, D. A. (1988). Do spatial effecfs really matter
in regression analysis? *Papers in Regional Science*, *65*(1), 11–34.

</div>

<div id="ref-bivand2008applied">

Bivand, R. S., Pebesma, E. J., & Gomez-Rubio, V. (2008). *Applied
spatial data analysis with R* (Vol. 747248717). Springer.

</div>

<div id="ref-cliff1972testing">

Cliff, A., & Ord, K. (1972). Testing for spatial autocorrelation among
regression residuals. *Geographical Analysis*, *4*(3), 267–284.

</div>

<div id="ref-cressie1989geostatistics">

Cressie, N. (1989). Geostatistics. *The American Statistician*, *43*(4),
197–202.

</div>

<div id="ref-fischer2009handbook">

Fischer, M. M., & Getis, A. (2009). *Handbook of applied spatial
analysis: Software tools, methods and applications*. Springer Science &
Business Media.

</div>

<div id="ref-geary1954contiguity">

Geary, R. C. (1954). The contiguity ratio and statistical mapping. *The
Incorporated Statistician*, *5*(3), 115–146.

</div>

<div id="ref-getis2010analysis">

Getis, A., & Ord, J. K. (2010). The analysis of spatial association by
use of distance statistics. In *Perspectives on spatial data analysis*
(pp. 127–145). Springer.

</div>

<div id="ref-goovaerts1997geostatistics">

Goovaerts, P., & others. (1997). *Geostatistics for natural resources
evaluation*. Oxford University Press on Demand.

</div>

<div id="ref-hengl2009practical">

Hengl, T. (2009). *A practical guide to geostatistical mapping*.

</div>

<div id="ref-isaaks1989applied">

Isaaks, E. H., & Srivastava, R. M. (1989). Applied geostatistics: Oxford
university press. *New York*, *561*.

</div>

<div id="ref-loonis2018handbook">

Loonis, V., & Bellefon, M.-P. de. (2018). *Handbook of spatial
analysis*.

</div>

<div id="ref-lovelace2019geocomputation">

Lovelace, R., Nowosad, J., & Muenchow, J. (2019). *Geocomputation with
R*. Retrieved from <https://geocompr.robinlovelace.net/>

</div>

<div id="ref-mas2013analisis">

Mas, J.-F. (2013). *Análisis espacial con R. Usa R como un sistema de
información geográfica*. European Scientific Institue (ESI).

</div>

<div id="ref-matheron1963principles">

Matheron, G. (1963). Principles of geostatistics. *Economic Geology*,
*58*(8), 1246–1266.

</div>

<div id="ref-moran1948interpretation">

Moran, P. A. (1948). The interpretation of statistical maps. *Journal of
the Royal Statistical Society. Series B (Methodological)*, *10*(2),
243–251.

</div>

<div id="ref-olaya2014sistemas">

Olaya, V. (2014). *Sistemas de informacion geográfica*. Retrieved from
<https://volaya.github.io/libro-sig/>

</div>

<div id="ref-tobler1970computer">

Tobler, W. R. (1970). A computer movie simulating urban growth in the
detroit region. *Economic Geography*, *46*(sup1), 234–240.

</div>

</div>
