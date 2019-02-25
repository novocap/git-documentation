[<- Inicio](../README.md)

[Tabla de Contenidos](SUMMARY.md)
# Los tres estados de Git
Git es un sistema de control de versiones centralizado y distribuido, el cual administra las versiones por medio de `snapshots` (_instantáneas_) codificadas en [`SHA-1`](https://es.wikipedia.org/wiki/Secure_Hash_Algorithm#SHA-1). Git administra las versiones de un directorio con la colección de todas las sub-carpetas y archivos que esta contiene, estableciendo el concepto de un repositorio. Para establecer el control con Git en un repositorio, se ejecuta por única vez un comando que indica la inicialización del mismo:
```git
git init
```
Esta acción crea un directorio oculto `.git/` en la raíz del repositorio, donde Git gestionará y almacenará allí todas sus instántaneas. A partir de este momento, Git comienza a operar con el control de versiones por medio de tres estados, según se muestra en la imagen a continuación:

![estados de git](../img/git-flujo.png)
> __Imagen 1__: _Los 3 estados de Git._

Luego de contar con el repositorio inicializado, el comando para ver el estado actual de su contenido es por medio de:
```git
git status
```
De esta manera, pasamos a comprender el funcionamiento de cada uno de los estados de Git.
### Working Directory
Este es el estado donde se encuentran los archivos con los cuáles te encontrás trabajando en el repositorio. En este momento Git no tiene control de almacenamiento de lo archivos, ya que se encuentran en plena edición/creación por parte del usuario. Si se ejecuta el comando `git status` luego de modificar/crear archivos, Git muestra por ejemplo el siguiente mensaje:

![Working directory](../img/working-directory.png)
> __Imagen 2__: _Estado Working Directory de Git._

En la sección `Changes not staged for commit` podemos ver que Git informa que tiene archivos modificados posteriormente a su última versión controlada, y marca los archivos como `modified`. Más abajo en `Untracked files` se muestran aquellos archivos nuevos en el repositorio que no tienen control de versión aún.

Git nos informa del uso de 2 comandos, donde uno de ellos sirve para descartar todos los cambios realizados desde el último `commit`, por ejemplo de la siguiente manera:
```git
git checkout docs/GIT.md
```
En este ejemplo estamos descartando los cambios realizados sobre el archivo ubicado en `docs/GIT.md`. El otro comando lo usaremos para pasar al próximo estado de Git, el cual se explica a continuación.
### Staging Area 
Para indicarle a Git que nos almacene el estado de los archivos creados/modificados por medio de una instantánea de los mismos, lo haremos con el comando que nos indica en el ejemplo de la __Imagen 2__ sobre uno de los archivos:
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
Al agregar los archivos al área de preparación, Git nos indica que estos archivos están listos para ser confirmados (`committed`), ya que Git nos da el espacio para que podamos ir trabajando con los archivos entre los dos primeros estados, hasta que en un momento definamos confirmarlos y pasemos al próximo y último estado de control.

En el caso que decidamos volver un archivo en el estado de área de preparación al estado original de directorio de trabajo (_esta acción no elimina el archivo_), lo haríamos con el siguiente comando:
```git
git reset HEAD docs/GIT.md
```
### Git Directory 
Una vez que nos encontramos con todos los cambios esperados en nuestro repositorio, habiéndolos agregado previamente al área de preparación de trabajo, podemos confirmarlos y agregar la instantánea al historial del repositorio con Git.

![Git Directory](../img/changes-to-committed.png)
> __Imagen 4__: _Cambios listos a confirmar._

En el ejemplo podemos ver que Git detecta que hubieron cambios en archivos existentes anteponiendo la marca `modified`, y cuando se agregaron nuevos archivos se marcan con `new file`. Finalmente la confirmación de los archivos en el estado de área de preparación, cierra el circuito de cambios dentro del historial de Git, estableciendo una etiqueta con la codificación `SHA-1` con el siguiente comando:
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
De esta manera, al confirmar los cambios tendremos por ejemplo el siguiente mensaje de Git:

![Git Directory](../img/git-directory.png)
> __Imagen 5__: _Estado Git Directory de Git._
## Gestión del historial de versiones
Cada instantánea creada por Git (_como vimos con SHA-1, por medio de 40 caracteres hexadecimales irrepetibles_) pasa a formar parte del historial del sistema de control de versiones. Asimismo, la fortaleza de Git es precisamente la gestión de la integridad de la información, ya que no existen cambios, corrupción de datos o cualquier otro tipo de alteración sobre los archivos sin que Git lo tenga controlado. Esto funciona gracias a un algoritmo de verificación mediante un [`checksum`](https://es.wikipedia.org/wiki/Suma_de_verificaci%C3%B3n) al momento del almacenamiento de la información, que en resumen resulta de la suma de comprobación de la integridad de los datos en el instante que se persisten los mismos.

Al ser un sistema distribuido, el flujo operativo con Git es prácticamente local, y sólo será necesario interactuar con el repositorio remoto (_el repositorio central almacenado por ejemplo en GitHub/GitLab_) según la necesidad de actualización del propio repositorio, tanto para subir los cambios, como también para descargarlos. Esto nos brinda la ventaja de poder trabajar con proyectos muy grandes, así como también de una amplia distribución entre equipos cliente.
### Listado de cambios
En el momento que necesitemos ver el historial de los cambios en git lo podemos hacer con el siguiente comando:
```git
git log
```
Inmediatamente podremos ver los cambios confirmados en el repositorio ordenados desde el mas reciente, con la información del Autor, Fecha y Hora, Mensaje del `commit`, y lo más importante, el código `SHA-1` de 40 caracteres, el cual nos servirá para movernos en todo el historial como si estuviésemos en una máquina del tiempo.

![Git log](../img/git-log.png)
> __Imagen 6__: _Historial del repositorio con `git log`_

En el caso que no nos alcance la pantalla para ver todo el historial, con las flechas de arriba y abajo, y podemos salir de esta vista presionando la letra `q` seguido de un `Enter`.

Otra opción de vista simplificada del historial, enfocado únicamente en los mensajes y contando con la cabecera de 7 caracteres del código `SHA-1` del `commit` (_que para Git también es válido utilizar su cabecera para identificar los cambios_) es mediante el siguiente comando:
```git
git log --oneline
```
Aquí podemos apreciar la lista resumida del parámetro `--oneline`:

![Git log oneline](../img/git-log-oneline.png)
> __Imagen 7__: _Vista resumida de cambios con `--oneline`_.

### Análisis de diferencias de cambios
#### Diferencias en Working Directory
Ahora bien, contar con el listado de cambios también nos sirve para analizar los cambios frente los anteriores, así como también para volver para atras a un `commit` en específico. Entonces para ver las diferencias de cualquier tipo realizado, utilizaremos el siguiente comando:
```git
git diff
```
Este comando por sí solo, solo nos muestra los cambios efectuados en el repositorio, si los hubiere, desde el último `commit` a las modificaciones agregadas en el estado del Working Directory.
> En el modo de visualización de cambios de Git por terminal, si los cambios que se muestran ocupan más del largo de la pantalla, nos podremos mover hacia arriba y abajo con las flechas del teclado. Para salir de este modo, se debe presionar la letra `q` seguido de la tecla `Enter`.

En este modo de visualización, Git nos ayuda para identificar los cambios con colores, dejando el color de texto del terminal para aquellas líneas que no cambiaron, nos colorea con `Rojo` anteponiendo el símbolo `-` en aquellos cambios que quitamos, y coloca en `Verde` con el símbolo `+` para aquellos cambios que se agregaron. En el ejemplo que se muestra a continuación se puede apreciar esta sintaxis con el archivo ubicado en `docs/GIT.md`:

![Git diff working directory](../img/git-diff-wd.png)
> __Imagen 8__: _Sintaxis de cambios en Working Directory._

#### Diferencias entre `commit`
El comando `git dif` también nos sirve para analizar las diferencias entre un `commit` y otro por medio del uso de parámteros adicionales. Igualmente tenemos dos opciones, analizar todos los archivos cambiados entre los `commit` seleccionados, o simplemente sólo ver los cambios por archivo. La cantidad de parámetros que le indiquemos a `git diff` nos permitirá trabajar con diferentes niveles de análisis.

Para visualizar los cambios de un determinado `commit` al último `commit` efectuado en el repositorio, necesitaremos el códido `SHA-1` del primer `commit`, que en este caso puede ser el código de 40 caracteres que nos muestra `git log`, o también podemos utilizar solamente la cabecera que nos muestra `git log --oneline`.  Vamos a utilizar el ejemplo de la __Imagen 7__ seleccionando la cabecera de un `SHA-1` , que en este caso utilizaremos el más viejo: `2979aea`, para luego compararlo con el último `commit` de la siguiente manera:
```git
git diff 2979aea
```
Teniendo en cuenta la cantidad de cambios que hubieron desde el primer `commit` al último, probablemente los cambios que nos muestre `git diff` será muy extenso, por lo cual podemos optar por ver los cambios por archivo únicamente con el siguiente ejemplo:
```git
git diff 2979aea docs/SUMMARY.md
```
En este caso podremos realizar un análisis mas acotado, particularmente con el archivo `docs/SUMMARY.md` según se muestra en la siguiente imagen de ejemplo:

![Git diff ultimo commit](../img/git-diff-last-commit.png)
> __Imagen 9__: _Git diff con el último `commit` por archivo._

Ahora bien, si necesitamos ver las diferencias entre `commit` donde ninguno de los dos sea el último, necesitamos agregar el código `SHA-1` de cada uno de ellos como parámetro, seguido del tercer parámetro opcional para limitarlo por archivo si es que así quisierámos. De esta manera el comando sería de la siguiente manera:
```git
git diff <-- sha-1 commit anterior --> <-- sha-1 commit posterior --> <-- archivo -->
```
Tomando por ejemplo la __Imagen 7__, analizamos los cambios del segundo `commit` de cabecera `0ba09b7`, contra el ante-último `commit` de cabecera `1ad8bad`, comparando sólo el archivo `README.md`, de manera tal que el comando sería:
```git
git diff 0ba09b7 1ad8bad README.md
```
#### Movernos en el historial de versiones
## Remificación del repositorio
[Ir arriba](GIT.md#Los-tres-estados-de-Git)