# ¿Cómo realizar una asignación?

En este documento te explico cómo crear un repositorio con tu asignación, cómo realizarla, cómo notificarme al terminarla y cómo crear un *issue* o incidencia para pedir ayuda. Recuerda que en el fondo subyace la necesidad de que hagas tus cambios con control de versiones para evitar [esto](http://phdcomics.com/comics/archive.php?comicid=1531). No olvides leer también la sección [Aclaración sobre flujos de trabajo "no lineales"](#Aclaración-sobre-flujos-de-trabajo-no-lineales)

Al finalizar esta lectura (o mientras vas leyendo), practica varias veces con tu primera asignación. El objetivo es que utilices con destreza Git y GitHub para realizar las asignaciones de la materia, aun si no tienes experiencia con ninguna de estas herramientas. Si sabes usarlas, podrás saltarte algunas explicaciones y concentrarte en los detalles propios de la asignatura.

## Crea un repositorio con tu asignación

1. Desde el navegador, entra en [Github](https://github.com/) e [inicia sesión](https://github.com/login) con tu cuenta. Si usas una PC pública o compartida, es preferible que inicies el navegador en modo incógnito. Si no tienes cuenta de Github, [crea una](https://github.com/join). Ésta será la cuenta que usarás durante el curso.

2. En la misma ventana del navegador, crea una nueva pestaña, y abre tu buzón de correo. En el mensaje enviado por el profesor (podría caer en spam), haz clic en el vínculo (será algo tal que https<i></i>://classroom.github.com/...).

3. Al hacer clic, el navegador te dirigirá a aceptar la asignación. Te pedirá que inicies tu cuenta de Github si aún no lo has hecho. Usa siempre una ventana de incógnito o privada, asegurándote de que es tu cuenta la que figura como cuenta iniciada en GitHub (compruébalo en el botón derecho superior, donde verás tu avatar o imagen de perfil). Presiona `Accept this assignment`. Cuando quieras volver a tu asignación, puedes usar el vínculo del mensaje de invitación (...siempre que el tali no la borre, ejem).

4. Automáticamente se creará, en una "organización" de GitHub que se corresponde con la asignatura y el semestre actual ([maestria-geotel-201902](https://github.com/maestria-geotel-201902), administrada por el profesor y de la cual formas o formarás parte), un repo conteniendo tu asignación. Listo, tienes ya un repo con tu asignación, donde realizarás tus actualizaciones. Normalmente, tú y el profesor serán los únicos contribuidores de dicho repo.

* Nota: estos 4 pasos se ejecutan una sola vez

## Realiza tu asignación

Elige una de dos alternativas en función del tipo de asignación:

### Usando la interfaz web de GitHub

Usa la interfaz web de GitHub si no necesitas ejecutar código. Por ejemplo, usa esta alternativa si vas a hacer un documento de texto en Markdown que contenga tus preguntas de investigación ([tutorial sobre Markdown](https://www.youtube.com/watch?v=y6XdzBNC0_0), [buen blog en inglés sobre Markdown](https://girlknowstech.com/how-to-write-in-markdown/), [este otro con vídeos cortos y concisos](https://instructor-support.datacamp.com/en/articles/2336337-markdown-tutorial) y [buen tutorial en inglés sobre redacción académica](https://www.youtube.com/watch?v=hpAJMSS8pvs)). El interfaz web de GitHub es bastante sencillo. Sigue estos pasos:

1. Inicia sesión en GitHub con tu usuario/contraseña. Reitero: **no olvides asegurarte de que inicias con tu cuenta**.

2. Localiza el repo que contiene la asignación, donde podrás hacer cambios a un archivo existente o crear uno nuevo (dependerá de lo asignado):

    1. Para actualizar un archivo existente, haz clic sobre su nombre y luego en el lápiz del encabezado. Haz los cambios que correspondan según lo asignado.
    
    2. Para crear un nuevo documento, presiona el botón `Create new file`, se creará un documento en blanco, ponle un nombre en la caja `Name your file` y, en el documento, añade el texto que corresponda según lo asignado.
    
3. Al terminar de añadir texto/hacer cambios, ve al final de la página y presiona `Commit changes`.

Hasta aquí cómo usar la interfaz web de GitHub para realizar tus asignaciones. Recuerda, esta modalidad es útil si no necesitas ejecutar código, para redactar documentos de Markdown o para pequeñas ediciones de código. Es posible usar este interfaz para traer resultados generados en R, pero es probable que obtengas texto mal formateado. R está preparado para insertar los resultados de la consola dentro de un documento formateado en Markdown. Más detalles, en el aula.

### Usando RStudio

Utiliza RStudio como editor o cuaderno (*notebook*) si necesitas ejecutar código de R e incluir los resultados de la consola en el documento de Markdown. Por ejemplo, las asignaciones consistirán en crear objetos e importar tablas a R, realizar análisis exploratorio de datos espaciales, crear variogramas, y otras tareas relacionadas con análisis espacial. Todas esas tareas producen resultados, tanto gráficos como texto. Si haces todo el flujo de trabajo en RStudio, tendrás la ventaja de que, tanto gráficos como resultados textuales, se insertarán automáticamente en el documento Markdown (en concreto, se usa un formato denominado RMarkdown como puente, más detalles en el aula). Sigue estos pasos:

1. Abre RStudio. Dispones de dos alternativas para ejecutar RStudio:

    1. Si tienes una conexión a Internet y una computadora con navegador, te recomiendo utilizar el servidor de RStudio habilitado por el profesor. Esta modalidad tiene como ventaja que el servidor ya cuenta con los programas y paquetes necesarios para el curso.
    
    2. Alternativamente, puedes instalar y ejecutar RStudio Desktop en una computadora de tu preferencia (hay muchos tutoriales disponibles en línea). Esta modalidad tiene como ventaja que no necesitas una conexión a Internet permanentemente, sólo cuando actualices tus cambios en el GitHub, aunque es altamente recomendable que actualices con frecuencia (actualiza mientras avances, no esperes hasta el final). La desventaja principal es que tendrás que instalar los paquetes de R por tu cuenta. Más adelante leerás cómo actualizar tu repo de GitHub con los cambios que hayas hecho localmente.
    
2. En el menú `File` de RStudio, presiona `New Project` para crear un proyecto. Esto llamará la ventana `Create Project`.

3. Elige la opción `Version Control`, lo cual te hará avanzar automáticamente hacia la Ventana `Create Project from Version Control` automáticamente.

4. En la ventana `Create Project from Version Control`, elige `Git`. Esto te llevará automáticamente hacia la ventana `Clone Git Repository`. Para rellenar la caja `Repository URL` necesitas ir a tu repo de asignación.

5. Ve al navegador y, en tu repo de asignación, copia la URL del repo presionando el botón verde `Clone or download` ![](../img/bt_clone_or_download.png) y luego el botón `Copiar URL del repo` ![](../img/bt_copy_repo_url.png). La URL se encuentra ahora en el clipboard.

6. Regresa a RStudio. En la caja `Repository URL`, pega la URL que tienes en el portapapeles (en Linux y Windows, `Ctrl+V`). Dicho texto será algo tal que `https://github.com/maestria-geotel-201902/<nombredelrepo>.git`. El nombre del repo normalmente terminará con tu nombre de usuario, por ejemplo, para "estudianteficticio" `https://github.com/maestria-geotel-201902/<unidad-0-asignacion-0-hola-mundo-estudianteficticio>.git`

7. En la caja `Project directory name`, puedes dejar el valor por defecto, que será el mismo nombre del repo (por ejemplo, `unidad-0-asignacion-0-hola-mundo`). Este será el nombre del directorio donde se clonará el repo.

8. En la caja `Create project as subdirectory of`, debes elegir el lugar donde se colocará el directorio que contendrá el repo. Si lo haces en el servidor RStudio habilitado por el profesor, puedes dejar en este cuadro la opción que te aparece por defecto, que es la virguilla (`~`), y significa `Carpeta personal`, cuya ruta global en el servidor (Linux) es `/home/<nombredeusuarioenelservidor>/`. Por ejemplo, el repo quedará en la siguiente ruta: `/home/<estudianteficticio>/<unidad-0-asignacion-0-hola-mundo>`.

9. Presiona el botón `Create Project`. Automáticamente, RStudio clonará el repositorio de tu asignación localmente. Esta copia local puede modificarse mediante el editor de RStudio y sincronizada posteriormente con el repo remoto.

10. **Identifícate**. En la pestaña `Git` ve a la rueda dentada `More` ![](../img/bt_more.png) y presiona el comando `Shell...`. Se abrirá una ventana del intérprete de línea de órdenes (CLI). Debes ejecutar las dos sentencias siguientes, una a una.

    1. `git config user.email "tuemailengithub"`. Presiona `<enter>`. Cambia `"tuemailengithub"` por tu email registado en GitHub. Conserva las comillas.
    2. `git config user.name "tuusuariodegithub"`. Presiona `<enter>`. Cambia `"tuusuariodegithub"` por tu usuario registrado en GitHub. Conserva las comillas.
    
    * Si no realizas este paso, al intentar hacer `Commit`, te aparecerá el mensaje `***Please tell me who you are`, y no podrás avanzar ni sincronizar tu repo local con el remoto.

11. Al igual que en el interfaz web de GitHub, a partir de este punto RStudio te permite actualizar un archivo existente en tu repo o crear uno nuevo. Todo dependerá de si actualizas un archivo existente o si creas uno nuevo:

    1. **Para actualizar un archivo existente**, abre la pestaña `Files` (revisa los distintos paneles de RStudio) y cliquea sobre el nombre del archivo que editarás. Haz los cambios que correspondan, según lo asignado. **No olvides guardar cualquier cambio que hagas inmediatamente**, mediante el comando `File>Save` de RStudio o presionando `Ctrl+S`, pero ten en cuenta que **estarás guardando sólo una copia local**, no la del repo de GitHub (más adelante verás cómo actualizar el repo remoto). ¡IMPORTANTE! Si no guardas el documento, no podrás hacer `Commit`>`Push` más adelante.
    
    2. **Para crear un archivo nuevo**, presiona el comando `File>New File>Text File` de RStudio. Se abrirá una ventana en blanco normalmente con el nombre `Untitled1`. Guárdalo inmediatamente con el comando `File>Save` o presionando `Ctrl+S`, y asegúrate que se guarda en la ruta que corresponda dentro del repo. En el documento, añade el texto que tengas que añadir y guarda frecuentemente (`Ctrl+S` te hace más eficiente).
    
12. Finalmente, para sincronizar cambios desde el repo local al remoto, haz lo siguiente:

    1. Abre la pestaña `Git` (revisa los paneles de RStudio hasta encontrarla, o usa el botón ![](../img/bt_git.png) localizado en la barra de herramientas). Si hiciste cambios o añadiste archivos, te encontrarás en esta pestaña con una lista de archivos cambiados o añadidos. Lógicamente, si no creaste ni guardaste archivos, no habrá lista alguna, y la pestaña estará vacía. Haz clic en la marca de cotejo bajo la columna `Staged` de cada uno de los archivos que te interesa actualizar con el repo remoto (normalmente todos). En algunos casos se tratará de modificaciones a archivos existentes (aparecerán con una `M`), o de archivos para añadir (aparecerán con un `?` o con una `A`). Asegúrate de hacer clic tantas veces sea necesario hasta que aparezca como marca de cotejo o aspa (como ésta: ![](../img/aspa.png)), y **no** como cuadro relleno. ¡IMPORTANTE! Sólo los archivos que cotejes se actualizarán con el repo remoto.
    
    2. Presiona el botón `Commit`, se abrirá la ventana `Review Changes`. Aquí puedes revisar los cambios que has hecho a cada archivo. El texto añadido aparece sombreado en verde, y el borrado en rojo.
    
    3. En la caja `Commit message` escribe un mensaje que resuma el conjunto de cambios, por ejemplo, `actualizado archivo de asignación` o `añadido archivo de script`.
    
    4. Presiona el botón `Commit` para que los cambios pasen al `Stage` (¡tus cambios aún no se han sincronizado con el repo remoto!). Aparecerá un cuadro de diálogo informando los cambios realizados, algo tal que ésto (variará mucho de un caso a otro):
    
    <figure><img src="../img/master_branch_changes.png" width="400"></figure>
    
    5. Presiona el botón `Close` para regresar al cuadro `Review Changes`. Al regresar, presiona el botón `Push` y, automáticamente, te aparecerá un cuadro para escribir tu usuario de GitHub y otro para escribir tu contraseña. Si todo sale bien, tus cambios se habrán sincronizado y te aparecerá un mensaje de confirmación informando sobre la actualización de la rama máster, algo tal que esto:
    
    <figure><img src="../img/master_branch_updated.png" width="400"></figure>
    
13. Ve al repo de GitHub, actualiza la ventana del navegador (suele hacerse con `F5`) y verifica que tus cambios se sincronizaron. Si has llegado hasta este punto, ¡Felicidades! Pasaste varios mundos y ya estás preparado/a para realizar tus asignaciones de manera fluida.

## Notifícame que has terminado

Puedes notificarme cuando hayas realizado todos tus *commits* por medio de la interfaz web de GitHub. Este sería un camino idóneo:

1. Ve al repo de tu asignación. Para ello inicia sesión en GitHub. En el panel lateral izquierdo verás tus repos, localiza el que te interesa.

2. Presiona en la pestaña ![](../img/bt_commits.png) localizada sobre los botones del repo (el número de *commits* podría ser diferente en tu caso). Esto te llevará a la lista de *commits* del repo.

3. Selecciona el botón que contiene el nombre de la revisión (*SHA-1 hash*), localizado a la derecha del último *commit*, el cual luce como éste ![](../img/bt_sha_1_hash.png).

4. En la caja al final de la página, escribe un mensaje indicándome que terminaste o cualquier otra indicación que quieras notificarme. Al principio, al final o entre palabras, es imprescindible que escribas una mención a mí usando `@geofis`. Te quedaría algo tal que esto:

    <figure><img src="../img/mention_on_comment.png" width="500"></figure>
    
No es imprescindible que me notifiques, porque estaré pendiente de tu repo y, en última instancia, lo evaluaré tal cual esté tras finalizar el plazo. Sin embargo, el comentario con mención a mí me indicaría que has terminado, o lo que sea que quieras comunicarme.

Puedes utilizar este mismo procedimiento para llamar mi atención, o para que verifique tus avances. No necesitas haber concluido para colocar comentario con mención a mí. Ahora bien, **no utilices este procedimiento para pedir ayuda, porque para ese caso existe un procedimiento separado que te explico en el siguiente punto**.

## Pide ayuda creando un *issue* o incidencia

Utiliza la sección `Issues` para pedir ayuda o reportar errores. Aunque puedes hacerlo, no necesitas incluir una mención a mí (`@geofis`) para notificarme, puesto que GitHub me informa tan pronto creas el *issue*. Sigue este procedimiento.

1. Ve al repo de tu asignación. Para ello inicia sesión en GitHub. En el panel lateral izquierdo verás tus repos, localiza el que te interesa.

2. Presiona en la pestaña ![](../img/bt_issues.png) localizada en la parte superior del repo (el número de *issues* podría ser diferente en tu caso). Esto te llevará a la lista de *issues* del repo.

3. Crea un nuevo *issue* presionando el botón verde `New issue`.

4. Escibe un título para el *issue* en la caja `Title`.

5. En la caja `Leave a comment` describe el problema al que te enfrentaste, cómo intentaste resolverlo o qué soluciones probaste. Si se trata de un tema de programación o de análisis de datos, deberás facilitar **código reproducible y mensaje de error (si lo hubiere)**. Evita el típico comentario "da error", puesto que no conduce a nada. Puedes dar formato a tu mensaje utilizando sintaxis markdown.

6. Cuando hayas terminado, presiona el botón verde `Submit new issue` localizado en la parte inferior. Inmediatamente me llegarán notificaciones a mi cuenta de GitHub y por correo electrónico.

## Aclaración sobre flujos de trabajo "no lineales"

Es más fácil citar las razones por las que una computadora y una persona frente a ella pueden trabajar de manera fluida y sin tropiezos. La lista de las innumerables razones por las que ocurre lo contrario es tan larga como un día de hambre. Por lo tanto, debes estar preparado/a para los flujos de trabajo no lineales.

Tendrás que afrontar incidencias y situaciones muy diferentes a las descritas en esta guía, sobre todo mientras aumente tu actividad en un determinado repo. Probablemente las catalogues como "situaciones indeseadas" o tremendas vainas, pero lo único seguro es que te ocurrirán. Te presento dos de ellas:

1. Imagina esta situación. Clonaste localmente un repo (por ejemplo, usando RStudio), realizaste cambios que sólo guardaste en tu PC y no los sincronizaste al repo origen. Paralelamente, hiciste cambios y `Commit` al repo origen (por ejemplo, tú en la web de GitHub o alguien con privilegios empujó cambios). Si en tu repo clonado localmente intentas hacer `Commit>Push` al origen, ocurrirá un conflicto que tendrás que atender. Lo recomendable es resolverlos haciendo `Pull` localmente, para traer los cambios desde el origen. Así podrás mostrar los conflictos y resolverlos manualmente.  Para evitar este tipo de conflictos es recomendable que, antes de hacer cambios en tu repo localmente, hagas `Pull` para sincronizar con el origen.

2. En algún momento tendrás que usar el intérprete de línea de órdenes (CLI, *command line interpreter*), mal llamada "ventana terminal". Te ocurrirá cuando tengas que ejecutar acciones que superen las herramientas gráficas de RStudio. Ni CLI ni su emulador ensucian las manos ni muerden, así que no hay que tenerles miedo.


## Notas finales

¡Servicio público de radio guarachita!

1. No utilices el servidor de RStudio habilitado por el profesor como repositorio central. Por razones de presupuesto y operativas, el servidor está configurado con un mínimo de seguridad. Por lo tanto, los cambios que hagas a los repos alojados en el servidor, debes actualizarlos tan pronto te sea posible en el repo remoto de GitHub. **Aviso 1 emitido**.

2. Si usas una computadora compartida (por ejemplo, en el aula), es preferible que inicies tu sesión de GitHub y de correo (y cualquier otro servicio) en una ventana de incógnito o privada. Al terminar, **no olvides cerrar tu sesión e igualmente cerrar la ventana del navegador**. Dos "ventanas de incógnito" usan la misma cuenta, por lo que si alguien inició de incógnito, iniciarás con su cuenta. **Aviso 2 emitido**.

3. En GitHub, asegúrate siempre de que es tu cuenta la que figura como cuenta iniciada. Compruébalo en el botón derecho superior, donde verás tu avatar o imagen de perfil. **Aviso 3 emitido**.

4. Si actualizas archivos de tu repo localmente, guarda muy pero muy frecuentemente. Te recomiendo usar `Ctrl+S`. Abandona ese veneno del ratón. **Aviso 4 emitido**.