[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido del documento</summary>
    <a href="#Fundamentos-de-Git-y-GitHub"><strong>Fundamentos de Git y GitHub</strong></a><br>
    <a href="#Working-Directory">· Working Directory</a><br>
    <a href="#Staging-Area">· Staging Area</a><br>
    <a href="#Git-Directory">· Git Directory</a><br>
    <a href="#Gestión-del-historial-de-versiones">Gestión del historial de versiones</a><br>
    <a href="#Listado-de-cambios">· Listado de cambios</a><br>
    <a href="#Análisis-de-diferencias-de-cambios">· Análisis de diferencias de cambios</a><br>
    <a href="#Ramificación-del-repositorio">Ramificación del repositorio</a><br>
    <a href="#Trabajar-en-una-nueva-rama">· Trabajar en una nueva rama</a><br>
    <a href="#Gestión-con-repositorio-remoto">Gestión con repositorio remoto</a><br>
    <a href="#Actualización-entre-Git-y-GitHub">· Actualización entre Git y GitHub</a><br>
</details>

# Fundamentos de Git y GitHub
Git es un sistema de control de versiones centralizado y distribuido, el cual administra las versiones por medio de `snapshots` (_instantáneas_) codificadas en un código _hash_ en [`SHA-1`](https://es.wikipedia.org/wiki/Secure_Hash_Algorithm#SHA-1). Git administra el historial de una colección de archivos y carpetas, introduciendo el concepto de un repositorio. Para inicializar el control de Git en un directorio, se ejecuta por única vez el siguiente comando:
```git
git init
```
También existe la posibilidad de que el comando de inicialización de Git realice la creación del directorio que utilizará como repositorio en un único paso (_saltando el paso de agregar una nueva carpeta_), como se muestra en el ejemplo a continuación:
```git
git init nombre-del-repositorio
```
> Si bien se puede nombrar un directorio con espacios encerrándolo por medio del uso de las dobles comillas, no es una práctica recomendable definirlo de esta manera.

La inicialización del repositorio crea un directorio oculto `.git/` en su raíz, donde Git gestionará y almacenará todas sus instántaneas. A partir de este momento, Git comienza a operar con el control de versiones por medio de tres estados, según se muestra en la imagen a continuación:

![estados de git](../img/git-flujo.png)
> __Imagen 1__: _Los 3 estados de Git._

Luego de contar con el repositorio inicializado, el comando para ver el estado actual de control es por medio del comando:
```git
git status
```
A continuación pasamos a comprender el funcionamiento de los estados de Git de manera detallada.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Working Directory
Este es el estado donde se encuentran los archivos con los cuáles nos encontramos trabajando en el repositorio. En este momento Git no tiene control de almacenamiento de lo archivos, ya que se encuentran en plena edición/creación por parte del usuario. Si se ejecuta el comando `git status` luego de modificar/crear archivos, Git muestra por ejemplo el siguiente mensaje:

![Working directory](../img/working-directory.png)
> __Imagen 2__: _Estado Working Directory de Git._

En la sección `Changes not staged for commit` podemos ver que Git informa que tiene archivos modificados posteriormente a su última versión controlada, y marca los archivos como `modified`. Más abajo en `Untracked files` se muestran aquellos archivos nuevos en el repositorio que no tienen control de versión aún.

Git nos informa del uso de dos comandos, donde uno de ellos sirve para descartar los cambios realizados desde el último `commit`, según se muestra en el siguiente comando de ejemplo:
```git
git checkout docs/GIT.md
```
En este ejemplo estamos descartando los cambios realizados sobre el archivo ubicado en `docs/GIT.md`. El otro comando lo usaremos para pasar al próximo estado de Git, el cual se explica a continuación.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Staging Area 
Para indicarle a Git que nos almacene el estado de los archivos creados/modificados por medio de una instantánea, lo haremos con el comando que podemos observar en la __Imagen 2__, por ejemplo:
```git
git add docs/GIT.md
```
Siguiendo el caso, Git alojó el archivo ubicado en `docs/GIT.md` al área de preparación de trabajo (_staged_), mientras que el archivo `img/working-directory.png` sigue en el estado anterior del directorio de trabajo:

![Staging area](../img/staging-area.png)
> __Imagen 3:__ _Estado Staging Area de Git._

Ahora bien, también podemos pasar el archivo `img/working-directory.png` al área de preparación con el comando:
```git
git add img/working-directory.png
```
O en el caso de que quisiéramos agregar múltiples archivos a este estado, lo podemos lograr ejecutando el comando:
```git
git add -A
```
Al agregar los archivos al área de preparación, Git nos indica que estos archivos están listos para ser confirmados (`Changes to be committed`), ya que Git nos da el espacio para que podamos ir trabajando con los archivos entre los dos primeros estados, hasta que en un momento definamos confirmarlos y pasemos al próximo y último estado de control.

En el caso que decidamos volver un archivo en el estado de área de preparación al estado original de directorio de trabajo (_esta acción no elimina el archivo_), lo haríamos con el siguiente comando:
```git
git reset HEAD docs/GIT.md
```
[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Git Directory 
Una vez que nos encontramos con todos los cambios esperados en nuestro repositorio, habiéndolos agregado previamente al área de preparación de trabajo, podemos confirmarlos y agregar la instantánea al historial del repositorio con Git.

![Git Directory](../img/changes-to-committed.png)
> __Imagen 4__: _Cambios listos a confirmar._

En el ejemplo anterior podemos ver que Git detecta que hubieron cambios en archivos existentes, anteponiendo la marca `modified`, y en el caso de los nuevos archivos se marcan con `new file`. Finalmente la confirmación de los archivos en el estado de área de preparación, cierra el circuito de cambios dentro del historial de Git, estableciendo una etiqueta de codificación `SHA-1` con el siguiente comando:
```git
git commit
```
En su defecto, se puede optar por colocar un mensaje a la confirmación, anteponiendo el parámetro `-m` de la siguiente manera:
```git
git commit -m "Mensaje personalizado para explicar brevemente los cambios"
```
Preferiblemente, para firmar el `commit` verificando su identidad con la llave GPG generada en el equipo local, se puede optar por anteponer el parámetro `-S` de la siguiente manera:
```git
git commit -S -m "Mensaje personalizado firmado con la identidad."
```
De esta manera, al confirmar los cambios podremos ver el detalle de información que nos arroja Git con cada uno de los archivos implicados en la instantánea:

![Git Directory](../img/git-directory.png)
> __Imagen 5__: _Estado Git Directory de Git._

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
## Gestión del historial de versiones
Cada instantánea creada por Git (_como vimos con SHA-1, por medio de 40 caracteres hexadecimales irrepetibles_) pasa a formar parte del historial del sistema de control de versiones. Asimismo, la fortaleza de Git es la precisión con la que gestiona la integridad de la información, ya que no existen cambios, corrupción de datos o cualquier otro tipo de alteración sin que Git lo tenga controlado. Esto funciona gracias a un algoritmo de verificación mediante un [`checksum`](https://es.wikipedia.org/wiki/Suma_de_verificaci%C3%B3n) sobre el contenido de los datos al momento efectuar el almacenamiento de la información mediante una instantánea.

Al ser un sistema distribuido, el flujo operativo de Git es en su mayoría local, y sólo será necesario interactuar con el repositorio remoto (_el repositorio central almacenado por ejemplo en GitHub/GitLab_) según la necesidad de actualización de subida y/o descargas de cambios. Esto nos brinda la ventaja de poder trabajar con proyectos muy grandes, con la flexibilidad de contar con una amplia distribución entre los equipos cliente.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Listado de cambios
En el momento que necesitemos ver el historial de los cambios en Git lo podemos hacer con el siguiente comando:
```git
git log
```
Inmediatamente podremos ver los cambios confirmados en el repositorio ordenados desde el mas reciente al más antiguo, con la información del Autor, Fecha y Hora, Mensaje del `commit`; y lo más relevante, el código `SHA-1` de 40 caracteres, el cual nos servirá para trasladarnos dentro de su historial como si estuviésemos en una máquina del tiempo.

![Git log](../img/git-log.png)
> __Imagen 6__: _Historial del repositorio con `git log`_

En el caso que no nos alcance la pantalla para ver todo el historial, con las flechas de arriba y abajo podemos ir recorriéndolo, y luego para salir de esta vista, es necesario presionar la letra `q` seguido de un `Enter`.

Existe otra vista mas reducida del comando `git log`, que está enfocada únicamente en los mensajes del `commit`, e incluyen una cabecera mas corta de 7 caracteres del código `SHA-1` original (_que para Git también es válida_), y se accede mediante el siguiente comando:
```git
git log --oneline
```
Aquí podemos apreciar la lista resumida del parámetro `--oneline`:

![Git log oneline](../img/git-log-oneline.png)
> __Imagen 7__: _Vista resumida de cambios con `--oneline`_.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Análisis de diferencias de cambios
#### Diferencias en Working Directory<!-- omit in toc -->
Ahora bien, contar con el listado de cambios también nos sirve para analizar su historial, además de otras utilidades, como por ejemplo para volver el tiempo atras a un `commit` en específico. Entonces para ver las diferencias de cualquier tipo realizado, utilizaremos el siguiente comando:
```git
git diff
```
Este comando por sí solo, únicamente nos muestra los cambios efectuados en el repositorio (_si los hubiere_), desde el último `commit` comparado con las modificaciones agregadas en el estado de Working Directory. En definitiva, podremos ver los cambios de los archivos que aún estamos preparando.
> En el modo de visualización de cambios de Git por terminal, si su longitud ocupa más del largo de la pantalla, nos podremos mover hacia arriba y abajo con las flechas del teclado. Para salir de este modo, se debe presionar la letra `q` seguido de la tecla `Enter`.

Aquí Git nos ayuda a identificar los cambios con colores, dejando el color de texto del terminal para aquellas líneas que no cambiaron, además nos colorea con `Rojo` anteponiendo el símbolo `-` en aquellos cambios que quitamos en la edición, y coloca en `Verde` con el símbolo `+` para aquellos cambios que agregamos. También podemos ver que esta vista se contextualiza en los cambios, y por lo general no muestra todo el archivo si no es necesario. En el ejemplo que se muestra a continuación, se puede apreciar esta sintaxis con el archivo ubicado en `docs/GIT.md`:

![Git diff working directory](../img/git-diff-wd.png)
> __Imagen 8__: _Sintaxis de cambios en Working Directory._

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
#### Diferencias entre dos `commit`<!-- omit in toc -->
El comando `git diff` también nos sirve para analizar las diferencias entre un `commit` y otro por medio del uso de parámteros adicionales. Igualmente tenemos dos opciones, analizar todos los archivos modificados entre los `commit` seleccionados, o simplemente ver el detalle de los cambios por archivo. La cantidad de parámetros que le indiquemos a `git diff` nos permitirá trabajar con diferentes niveles de análisis.

Para analizar los cambios de un determinado `commit` comparado con el último `commit` efectuado en el repositorio, necesitaremos el códido `SHA-1` del `commit` elegido mas antiguo, que en este caso puede ser el código de 40 caracteres que nos muestra `git log`, o también podremos utilizar solamente la cabecera que nos muestra `git log --oneline`.  Vamos a utilizar el ejemplo de la __Imagen 7__ seleccionando la cabecera de un `SHA-1`, que en este caso utilizaremos el primer commit del repositorio con el código `2979aea`, para luego compararlo con el último `commit`, simplemente de la siguiente manera:
```git
git diff 2979aea
```
Teniendo en cuenta la cantidad de cambios que hubieron desde el primer `commit` al último, probablemente la longitud de las modificaciones que nos muestre `git diff` será muy extensa, por lo cual podemos optar por ver los cambios de manera mas acotada, indicando el nombre del archivo con el siguiente ejemplo:
```git
git diff 2979aea docs/SUMMARY.md
```
En este caso podremos realizar un análisis particular sobre los cambios en el archivo `docs/SUMMARY.md` según se muestra en la siguiente imagen de ejemplo:

![Git diff ultimo commit](../img/git-diff-last-commit.png)
> __Imagen 9__: _Git diff con el último `commit` por archivo._

Ahora bien, si necesitamos ver las diferencias entre dos `commit` donde ninguno sea el último, necesitaremos agregar el código `SHA-1` de cada uno de ellos como parámetro, seguido del tercer parámetro opcional para limitarlo por archivo si es que así lo quisierámos. De esta manera el comando es el siguiente:
```git
git diff <--sha-1 commit anterior--> <--sha-1 commit posterior--> <--archivo-->
```
Tomando por ejemplo la __Imagen 7__, analizamos los cambios del segundo `commit` de cabecera `0ba09b7`, contra el ante-último `commit` de cabecera `1ad8bad`, comparando sólo el archivo `README.md`, de manera tal que el comando sería:
```git
git diff 0ba09b7 1ad8bad README.md
```
[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
#### Movernos en el historial de versiones<!-- omit in toc -->
Git tiene una funcionalidad muy potente que nos permite movernos en su historial de versiones, así como también de trasladarnos entre ramas (_que veremos más adelante_), además de cancelar los cambios realizados del Staging Area al estado de Working Directory. Este comando que hemos visto anteriormente es:
```git
git checkout <--sha-1 commit-->
```
Entonces, esta funcionalidad nos va a permitir movernos a un `commit` en específico colocando como parámetro únicamente el código `SHA-1`, volviendo de esta manera al momento de su instantánea, que simularía ser un viaje en el tiempo.

__¿Qué usos podemos darle a esta función?__ Particularmente se puede volver el tiempo atrás en los casos donde el código deje de funcionar a partir de cualquier cambio; también al volver atrás podemos analizar con mas profundidad que con el comando `git diff`, y otra de las funcionalidades mas utilizadas con `git checkout` es para los casos de ramificación del repositorio, tema que aboradaremos en la próxima sección.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
## Ramificación del repositorio
En esta sección vamos a comprender el concepto de ramificación en Git, que resulta una de las funcionalidades mas increíbles de esta tecnología, la cual nos permite seguir un desarrollo no lineal que no nos obliga a mantenernos por un camino predefinido de trabajo. Esto significa que se puede ir ampliando la funcionalidad del repositorio sin seguir una ruta lineal de desarrollo, ramificando en cualquier momento de su historia, otra linea paralela que no interfiera a la ruta original, y que se pueda volver a adjuntar en el momento que se requiera. Además nos brinda la libertad de delegar los cambios sobre el proyecto en varias rutas, con el objetivo de aplicar nuevas funciones, efectuar correcciones, aplicar nuevos requerimientos, etcétera, sin tener que afectar la ruta principal del desarrollo. Una vez finalizados estos cambios se pueden adjuntar nuevamente a la ruta principal, haciendo testeos previos por ejemplo, o las acciones que se consideren realizar.

![Git branch y merge](../img/git-branch-merge.jpg)
> __Imagen 10__: _Ramificación con Git._

El concepto de ramificación en Git se gestiona por medio de la creación de _ramas_ virtuales dentro del repositorio, donde cada una contiene sus propios `commit` que originalmente vienen derivadas de otras ramas, tal y como se puede ver en el ejemplo de la __Imagen 10__. Esto quiere decir que en vez de trabajar en una única rama en nuestro repositorio, podremos crear una nueva rama en el momento de la historia que surja, y a partir de allí comenzar a desarrollar la nueva funcionalidad, corrección, requerimiento, etcétera.

__¿Como funcionan las ramas en Git?__ Al comenzar a trabajar con Git, este nos crea una rama por defecto denominada `master`, la cual prácticamente se ha convertido en un estándar como la rama principal del repositorio, aunque de todas maneras se le puede cambiar el nombre o utilizar otra rama como la principal sin ningún tipo de problemas. A partir de allí, cada vez que sea necesario aplicar algún cambio en el repositorio, es conveniente crear una nueva rama para tal fin, y efectuar allí todos los `commit` que sean necesarios antes de aplicarlos a la rama principal.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Trabajar en una nueva rama
Ahora bien, a partir del primer `commit`, Git crea por defecto la rama `master`, y además ya podemos crear ramas en el repositorio. Para poder ver un listado de las `ramas` locales que tenemos en el repositorio, lo hacemos con el comando:
```git
git branch -l
```
> La rama que tiene antepuesto un __*__ es la que indica donde Git se encuentra trabajando en ese momento.

Entonces para comenzar a operar con las ramas, debemos situarnos en el `commit` donde surja la necesidad de ramificar el proyecto (_que en la mayoría de los casos es el último, aunque podemos movernos al que creamos necesario con el comando que vimos en la sección anterior_), y a partir de ese momento crear la rama en cuestión con el siguiente comando:
```git
git branch <--nombre-nueva-rama-->
```
> El nombre de la rama es indistinto, aunque no puede repetirse en el mismo repositorio y no puede tener espacios.

Esta acción crea una rama a partir del `commit` que se encontraba en ese momento, y funciona de manera independiente de la rama `master`. Para comenzar a trabajar con la nueva rama, que podemos llamarla por ejemplo `test`, debemos trasladarnos a ella y ejecutar el siguiente comando:
```git
git checkout test
```
A continuación podemos ejecutar el comando `git branch -l` para observar en que rama estamos trabajando. También podemos ahorrarnos unos pasos al crear una nueva rama y trasladarnos directamente a ella con el siguiente comando:
```git
git checkout -b test
```
Una vez que estamos en la nueva rama, el circuito de control de cambios es exactamente el mismo que veníamos efectuando en la rama `master`, siguiendo el ciclo del flujo de los 3 estados de Git hasta que terminemos de realizar todos los cambios que consideremos necesarios. A partir de este momento, se recomienda efectuar los análisis y las pruebas que se crean convenientes antes de llevar estos cambios en la rama principal, adoptando así las buenas prácticas del desarrollo de software, con el objetivo de mantener una rama principal con los cambios debidamente controlados y aplicados.

Siguiendo el ejemplo, para mezclar los cambios que hayamos realizado en la rama `test` sobre la rama `master`, primero tenemos que situarnos en la rama principal y luego traer los cambios de la rama que estuvimos modificando de la siguiente manera:
```git
git checkout master
git merge test
```
Si no existe ningún conflicto al mezclar los cambios de `test` a la rama `master`, tendremos listo el circuito ramificación en Git. En la realidad, suelen haber confictos cuando se mezclan las ramas y existen casos donde el mismo comando `git merge` crea un nuevo `commit`, que a su vez el usuario tiene que intervenir para elegir con que cambios quiere quedarse, pero lejos de dejar una mala impresión en este tipo de situaciones, Git nos ayuda en cada paso marcándonos en que líneas debemos prestar atención, y definir así con que cambios nos quedamos.

Finalmente, si bien el circuito de `git merge` es perfectamente funcional para el concepto de ramificación de Git, actualmente se deja esta función para trabajar de forma local entre ramas donde ninguna de ellas sea la principal, y se delega la tarea de mezclar los cambios a la rama principal y de forma controlada, directamente en la plataforma de Github, que veremos en las próximas secciones del documento.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
## Gestión con repositorio remoto
Git nos brinda la posibilidad de definir un repositorio remoto para que todo el equipo de desarrollo se conecte para subir y bajar los cambios de forma controlada y distribuida. Igualmente, la realidad es que cada repositorio local es una copia del repositorio remoto de origen, pero no sólo se copian sus archivos con la estructura de instantáneas de Git, sinó que también cuentan con la dirección del repositorio remoto al que deben conectarse para trabajar de forma centralizada.

Entonces para crear un repositorio central, se puede hacer de dos formas, creando primero el repositorio remoto y luego descargando una copia sincronizada de este en cada equipo cliente, para trabajar así de forma distribuida; o directamente subir un repositorio local ya empezado, para luego subirlo como repositorio central y distribuir las copias sincronizadas al resto.

La plataforma centralizada que elegimos para mantener el repositorio central es [GitHub](https://github.com) (_también puede ser GitLab, Bitbucket, Visual Studio Team Services, servidor propio, etcétera_) y para crear un nuevo reposositorio lo haremos dentro de las opciones del símbolo __+__ ubicado a la derecha de la barra de navegación:

![GitHub Nav Bar](../img/github-navbar.png)
> __Imagen 11__: _Barra de navegación de GitHub._

En nuestra cuenta de GitHub, tendremos la posibilidad de crear repositorios privados o públicos (_que dependerá del criterio personal  elegir alguna de las dos opciones_), definiendo su nombre sin espacios, y de manera opcional agregar un encabezado descriptivo del mismo, así como también la creación de la documentación principal con el archivo `README.md`, seguido de una licencia y de un archivo de configuración de GitHub denominado `.gitignore`, que al ser opcionales, también podremos agregarlos luego (_Estas opciones las conoceremos más adelante_).

![GitHub nuevo repositorio](../img/github-new-repo.png)
> __Imagen 12__: _Crear nuevo repositorio en GitHub._

Una vez creado el repositorio central tenemos dos opciones, una de ellas es conectarnos directamente al repositorio en cuestión con la función de _clonación_, que significa descargar una copia del mismo con el control de versiones de Git activado y con la dirección del repositorio remoto; o en su defecto conectar un repositorio local ya existente con el repositorio creado recientemente en GitHub. Entonces, para clonar el repositorio, nos dirigimos a la cerpeta donde tenemos almacenado todos los repositorios, y de paso lo vamos a hacer con el repositorio actual de la siguiente manera:
```git
git clone git@github.com:novocap/git-documentation.git
```
Otra forma de hacer esto mismo, es creando un directorio local (_se recomienda utilizar el mismo nombre del repositorio en GitHub_), efectuando los siguientes comandos:
```git
git init git-documentation
git remote add origin git@github.com:novocap/git-documentation.git
git pull origin master
```
En estos dos ejemplos hemos utilizado otros comandos de Git no utilizados hasta el momento, uno de ellos es `git clone` que nos va a permitir descargar una copia sincronizada del repositorio remoto, y de todos aquellos que tengamos acceso, o también con repositorios públicos de cualquier usuario u organización. Después podemos ver que existe el comando `git remote` que se utiliza para vincular los repositorios locales con repositorios remotos, y podremos utilizarlo con estas variantes:

```git
git remote add origin <--direccion-git-remota-->
```    
Sirve para vincular el repositorio local a un repositorio remoto, donde el parámtero `origin` es el nombre por defecto que utiliza GitHub para nombrar el vínculo del repositorio remoto (_esto deriva en que un repositorio local puede tener más de un vínculo remoto_).
```git
git remote remove origin
```
Con este comando estamos borrando el vínculo al repositorio remoto llamado `origin`.
```git
git remote -v
```
Aquí podremos ver los vínculos remotos, tanto de subida como de descarga, para las actualizaciones de cambios en el repositorio remoto o en el repositorio local.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
### Actualización entre Git y GitHub
En el ejemplo que estábamos trabajando en la sección anterior, vimos algunos comandos nuevos en Git, uno de ellos es `git pull`. Este comando en realidad es la combinación de varios comandos, y para poder comprender su funcionamiento, vamos a volver a ampliar el concepto de la ramificación con Git.

Anteriormente vimos que con el comando `git branch -l` podemos ver la lista de ramas que se encuentran en el repositorio, y una de ellas se encuentra marcada con el caracter especial __*__. Sin contar con un gran de nivel de detalle, esto significaría que la rama marcada es la rama activa, pero a nivel mas técnico, esta marca es un apuntador desde una rama oculta denominada `HEAD` hacia la rama indicada. 

![Git HEAD master](../img/git-head-master.png)
> __Imagen 13__: _Rama `HEAD` apuntando a `master`._

Es decir, en realidad la rama activa siempre es la rama oculta, y lo que hace Git cuando queremos ir a otra rama no es cambiar la rama activa, sino que directamente cambia el apuntador de la rama oculta `HEAD`, dando una impresión de que nos hemos trasladado a otra rama.

![Git HEAD testing](../img/git-head-testing.png)
> __Imagen 14__: _Rama `HEAD` apuntando a `testing`._

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)
#### Descarga de cambios desde GitHub<!-- omit in toc -->
Suponiendo que nos encontramos en el caso de que nuestra copia local del repositorio está desactualizada frente a la versión más reciente existente en GitHub, entonces tenemos la tarea de actualizar nuestro repositorio local. También es importante evitar el desarrollo de nuevos cambios sobre una rama que se encuentre desactualizada, ya que vamos a generar conflictos al querer subirlos cuando estén listos. Para lograr esto, debemos estar al tanto de los cambios en el repositorio en GitHub, activando por ejemplo las notificaciones por correo electrónico en las [Configuraciones de notificación de GitHub](https://github.com/settings/notifications), según se muestra en la imagen a continuación:

![GitHub email notifications](../img/github-notifications.png)
> __Imagen 15__: _Configuraciones de notificaciones por email en GitHub._

Se puede observar en la imagen que podemos tener una cuenta de email personal para las notificaciones generales de la cuenta, y una cuenta corporativa en el caso que tenegamos acceso a una organización en GitHub.

Entonces para bajar los cambios de GitHub en el repositorio local, primero nos tenemos que situarnos en la rama donde necesitamos descargar los cambios, y una vez allí ejecutamos los siguientes comandos:
```git
git fetch origin <--rama-a-descargar-->
git merge origin <--rama-a-descargar-->
```
Aquí podemos ver que tenemos el comando `git fetch`, el cual descarga primeramente los cambios del repositorio a la rama oculta `HEAD`, y luego será necesario hacer la mezcla de los cambios en nuestra rama en cuestión. De esta manera podemos ver que Git no descarga los cambios directamente a nuestro entorno de trabajo, proteginéndonos de cualquier efecto no deseado, y nos obliga a definir que queremos hacer con los cambios descargados, en este caso mezclándolos por ejemplo con la rama desactualizada.

Ahora bien, Git nos brinda la posibilidad de efectuar estos dos comandos en uno sólo, es decir descargar los cambios del repositorio remoto, y hacer directamente la mezcla en nuestra rama desactualizada (_igualmente es nuestra responsabilidad de verificar previamente de que no tengamos cambios locales, para que no generemos conflitos al hacerlo_), utilizando el siguiente comando:
```git
git pull origin <--rama-a-descargar-->
```
> Si tenemos conflictos bajo cualquiera de las dos opciones que elijamos al momento de descargar los cambios, Git no efectuará ningún cambio y nos va a informar cuál es el problema para que podamos resolverlo, y luego de que lo corrijamos recién podremos bajar las actualizaciones sin problemas.
#### Subida de cambios a GitHub<!-- omit in toc -->
Para subir cambios a GitHub, debemos tener los mismos cuidados que al bajar cambios, mas allá de que todas maneras si hay conflictos estaremos bloqueados para subirlo.

[🡡 volver al inicio](#Fundamentos-de-Git-y-GitHub)