
<!-- Este .md fue generado a partir del .Rmd homónimo. Edítese el .Rmd -->
Programa de "Análisis Espacial" <br/> Maestría en Geografía, Teledetección y Ciencias de la Información Geográfica <br/> Universidad Autónoma de Santo Domingo (UASD)
=====================================================================================================================================================================

Octubre 2019 <br/> *José Ramón Martínez Batlle*

Básicos:
--------

-   Correo: <jmartinez19@uasd.edu.do>
-   Lugar y horario: Aula ¿?, Lunes y Martes de 6 a 10 pm

URLs del contenido del curso:
-----------------------------

-   [Programa (hipervínculo recursivo)](programa-biogeografia-geo1310.md)
-   Asignaciones. Se enviarán por correo electrónico.
-   [¿Cómo realizar una asignación?](ref/como-hacer-una-asignacion.md)
-   [Introducción a R y análisis exploratorio de datos (EDA)](ref/introduccion-a-r.md)
-   [Guía mínima de RMarkdown](ref/guia-minima-de-rmarkdown.md)

Descripción
-----------

Como escribí ya en el programa de otra asignatura que imparto, la ciencia atraviesa por una crisis de reproducibilidad. Difícilmente un equipo científico reproduce el resultado que obtuvo otro. Se atribuye este déficit a que, al publicar los resultados, no se aportan ni las fuentes, ni los métodos empleados. El panorama está cambiando, pero la única forma de aumentar la reproducibilidad consiste en abrir las fuentes y el código. En análisis espacial es aún más crítica la necesidad de disponer de un documento reproducible para seguir los pasos de otros/as investigadores/as.

Puedes sospechar desde ya que R estará de fondo (a fin de cuentas, este tali usa mucho R), sobre todo por tratarse de una asignatura meramente espacial. Dispondrás de un servidor de RStudio habilitado por mí con los paquetes requeridos en el curso ya pre-instalados. Así podrás realizar tus asignaciones sin preocuparte de instalaciones y dependencias.

Parecería "natural" utilizar interfaz gráfico de usuario para realizar análisis espacial, pero verás a lo largo de esta asignatura que es precisamente todo lo contrario. Realizar de manera eficiente análisis reproducibles, sólo se puede lograr escribiendo código. Igualmente, para visualizar patrones espaciales se requiere de herramientas versátiles, que tanto R como otros lenguajes también proveen.

Como ves, en esta materia usaremos R, pero son bienvenidos otros lenguajes de programación que quieras utilizar. Si sabes Python, C++, Java o cualquier otro lenguaje que pueda ayudarte a responder preguntas sobre análisis espacial, puedes usarlos sin inconveniente alguno. La única condición es que tienes que publicar tu código y abrir tus fuentes.

Iniciar con un lenguaje de programación implica un desafío inherente. Hay una comunidad allá fuera que explica cómo atender los típicos desafíos y los mensajes de error, y yo también podré ayudar. Además, esa misma comunidad también podría interesarse por o necesitar tus aportes, así que no dudes en hacer un "hola mundo" bien documentado cuando necesites ayuda.

Evaluación
----------

| Ítem                                                                |  % de la  nota final|
|---------------------------------------------------------------------|--------------------:|
| [Documento de proyecto](#documento-de-proyecto)                     |                  30%|
| [Presentación oral](#presentación-oral)                             |                  10%|
| [Código informático reproducible](#código-informático-reproducible) |                  40%|
| [Examen basado en código](#examen-basado-en-código)                 |                  20%|

Brevemente, cada ítem a evaluar consistirá en lo siguiente (más detalles por medio de asignaciones a lo largo del curso):

### Documento de proyecto

Consistirá en un fragmento de manuscrito científico, donde sólo se abordarán los apartados **Metodología** y **Resultados**, y que publicarás en el GitHub. Debido a la corta duración de la asignatura, no preveo que produzcas aportación científica; queda a opción tuya profundizar en tu proyecto a futuro. El proyecto lo elaborarás siguiendo las siguientes fases:

1.  Formular un problema cuya resolución requiera usar técnicas de análisis espacial.

2.  Revisión bibliográfica. Aunque no se requiere una revisión escrita (la típica introducción de los artículos científicos), si usas una fuente, refiérela apropiadamente. Ahora bien, cuando revises bibliografía, evita abrumarte con el enorme número de publicaciones científicas sobre análisis espacial. Consulta y refiere preferiblemente publicaciones de acceso libre.

3.  Selección de fuentes y metodología. Las fuentes de datos que usarás en tu proyecto deben ser abiertas. Dado que tus repos terminarán en modo público, no admitiré fuentes de datos privados (imágenes, bases de datos). Al seleccionar tu metodología, identifica las herramientas disponibles y verifica (consúltame) que verdaderamente te ayudarán a resolver el problema planteado. Recuerda: si conoces otros lenguajes de programación que no sean R, y que sean útiles para resolver tu problema, úsalos.

4.  Análisis de datos mediante código reproducible. Podrás ejecutar tus análisis en un servidor RStudio habilitado por mí, o alternativamente instalar R, RStudio y los paquetes requeridos por tu cuenta en una PC de tu elección. Ofreceré soporte para R, como motor de análisis, y también guiaré en la utilización de RStudio como **notebook**. Tendrás asignaciones para crear archivos RMarkdown, pero puedes utilizar otras alternativas, como Jupyter.

5.  Redacción de **Materiales y Métodos** y **Resultados**.

Los criterios de evaluación que usaré para el proyecto son:

1.  Cumplimiento de los requisitos exigidos por el [Anuario de Investigaciones Científicas de la UASD](docs/instrucciones-para-autores-anuario-investigaciones-cientificas-UASD.pdf) para las secciones **Metodología** y **Resultados**, sobre todo los de fondo.

2.  Redacción coherente y concisa.

3.  Resultados, con el debido apoyo estadístico y gráfico, que aborden e intenten resolver el problema planteado.

4.  Opcionalmente puedes elaborar conclusiones de tu proyecto.

Tu proyecto sólo tendrá los siguientes ítems:

-   Título.
-   Nombre de autor/a.
-   Metodología.
-   Resultados.
-   Código informático reproducible. Puedes incluirlo en el despliegue de resultados. Es decir, doy flexibilidad para que hagas algo tal que ésto o algo tal que ésto otro.
-   Referencias citadas (si aplica).

> El plagio y la falsificación de datos supondrán la reprobación inmediata de la asignatura.

### Presentación oral

Dispondrás de 15 minutos para presentar oralmente tu trabajo al final de la asignatura. Valoraré el dominio que muestres sobre tu trabajo.

### Código informático reproducible

Este es el fuerte de la asignatura, y es imprescindible para realizar el proyecto. Por correo electrónico, te enviaré asignaciones que te ayudarán a construir tu código reproducible. Las podrás realizar utilizando el servidor RStudio habilitado por el profesor (sólo necesitarás una PC con conexión a Internet y un navegador), o utilizando tu propia PC, pero en este último caso tendrás que instalar R, RStudio y los paquetes requeridos.

Orientaré con ejemplos y soluciones de forma pública a través de *issues* que abrirás tú o yo en el GitHub. De esta forma las discusiones quedarán disponibles para otras personas. Evita preguntar por correo electrónico, porque cualquier consulta que realices, y las posibles soluciones, quedarán en privado y la comunidad no podrá aprovecharlas.

Al abrir un *issue* de GitHub debes plantear el problema al que te enfrentas, cómo has intentado resolverlo o qué soluciones has probado. Si se trata de cuestiones relacionadas con programación o análisis de datos, deberás facilitar **código reproducible y mensaje de error (si lo hubiere)**. Evita el típico comentario "da error", puesto que no conduce a nada.

### Examen basado en código

Bueno, sobre ésto tengo poco que decir, sólo que preferiría no evaluar por medio de exámenes.

Contenido
---------

1.  Datos espaciales, y datos espaciales en R (tipos, importar, exportar). Capítulo 1 de Ardilly et al. (2018), capítulos 1 a 3 de Lovelace, Nowosad, & Muenchow (2019), capítulos 1 y 2 de Bivand, Pebesma, Gomez-Rubio, & Pebesma (2008), capítulo 3 y 4 de Mas (2013)

2.  Manipulación de datos espaciales (operaciones con atributos y geométricas). Capítulos 2, 4 y 5 de Bivand et al. (2008), capítulos 3 a 5 de Lovelace et al. (2019), capítulo 5 de Mas (2013).

3.  Mapas.

4.  Geoestadística. Capítulos 5 y 6 de Hengl (2009)

Referencias
-----------

Ardilly, P., Audric, S., Bellefon, M.-P. de, Buron, M.-L., Durieux, E., Eusebio, P., … others. (2018). *Handbook of spatial analysis*.

Bivand, R. S., Pebesma, E. J., Gomez-Rubio, V., & Pebesma, E. J. (2008). *Applied spatial data analysis with R* (Vol. 747248717). Springer.

Hengl, T. (2009). *A practical guide to geostatistical mapping*.

Lovelace, R., Nowosad, J., & Muenchow, J. (2019). *Geocomputation with R*. CRC Press.

Mas, J.-F. (2013). *Análisis espacial con R. Usa R como un sistema de información geográfica*. European Scientific Institue (ESI).
