[<- Inicio](../../../)

[Tabla de Contenido](SUMMARY.md)
# Los tres estados de Git
Git es un sistema de control de versiones centralizado y distribuido, el cual administra las versiones por medio de `snapshots` (_instantáneas_) codificadas en [`SHA-1`](https://es.wikipedia.org/wiki/Secure_Hash_Algorithm#SHA-1). Git administra las versiones de un directorio con la colección de todas las sub-carpetas y archivos que esta contiene, estableciendo el concepto de un repositorio. Para establecer el control con Git en un repositorio, se ejecuta por única vez un comando que indica la inicialización del mismo:
```bash
git init
```
Esta acción crea un directorio oculto `.git/` en la raíz del repositorio, donde Git gestionará y almacenará allí todas sus instántaneas. A partir de este momento, Git comienza a operar con el control de versiones por medio de tres estados, según se muestra en la imagen a continuación:

![estados de git](../img/GitFlujoTrabajoLocal.png)
__Imagen 1__: _Los 3 estados de Git._

Luego de contar con el repositorio inicializado, el comando para ver el estado actual de su contenido es por medio de:
```bash
git status
```
De esta manera, pasamos a comprender el funcionamiento de cada uno de los estados de Git.
## Working Directory
Este es el estado donde se encuentran los archivos con los cuáles te encontrás trabajando en el repositorio. En este momento Git no tiene control de almacenamiento de lo archivos, ya que se encuentran en plena edición/creación por parte del usuario. Si se ejecuta el comando `git status` luego de modificar/crear archivos, Git muestra por ejemplo el siguiente mensaje:

![Working directory](../img/working-directory.png)
__Imagen 2__: _Estado Working Directory de Git._

En la sección `Changes not staged for commit` podemos ver que Git informa que tiene archivos modificados posteriormente a su última versión controlada, y marca los archivos como `modified`. Más abajo en `Untracked files` se muestran aquellos archivos nuevos en el repositorio que no tienen control de versión aún.

Git nos informa del uso de 2 comandos, donde uno de ellos sirve para descartar todos los cambios realizados desde el último `commit`, por ejemplo de la siguiente manera:
```bash
git checkout docs/GIT.md
```
En este ejemplo estamos descartando los cambios realizados sobre el archivo ubicado en `docs/GIT.md`. El otro comando lo usaremos para pasar al próximo estado de Git, el cual se explica a continuación.
## Staging Area 
Para indicarle a Git que nos almacene el estado de los archivos creados/modificados por medio de una instantánea de los mismos, lo haremos con el comando que nos indica en el ejemplo de la __Imagen 2__ sobre uno de los archivos:
```bash
git add docs/GIT.md
```
Siguiendo el caso, Git alojó el archivo ubicado en `docs/GIT.md` al área de preparación de trabajo (_staged_), mientras que el archivo `img/working-directory.png` sigue en el estado anterior del directorio de trabajo:

![Staging area](../img/staging-area.png)
__Imagen 3:__ _Estado Staging Area de Git._

Ahora bien, también podemos pasar el archivo `img/working-directory.png` al área de preparación con el comando:
```bash
git add img/working-directory.png
```
O en el caso de que quisiéramos agregar múltiples archivos a este estado, lo podemos lograr ejecutando el comando:
```bash
git add -A
```
Al agregar los archivos al área de preparación, Git nos indica que estos archivos están listos para ser confirmados (`committed`), ya que Git nos da el espacio para que podamos ir trabajando con los archivos entre los dos primeros estados, hasta que en un momento definamos confirmarlos y pasemos al próximo y último estado de control.

En el caso que decidamos volver un archivo en el estado de área de preparación al estado original de directorio de trabajo (_esta acción no elimina el archivo_), lo haríamos con el siguiente comando:
```bash
git reset HEAD docs/GIT.md
```
## Git Directory 
Una vez que nos encontramos con todos los cambios esperados en nuestro repositorio, habiéndolos agregado previamente al área de preparación de trabajo, podemos confirmarlos y agregar la instantánea al historial del repositorio con Git.

![Git Directory](../img/changes-to-committed.png)
__Imagen 4__: _Cambios listos a confirmar._

La confirmación de los archivos en el estado de área de preparación, cierra el circuito de cambios dentro del historial de Git, estableciendo una etiqueta con la codificación `SHA-1` con el siguiente comando:
```bash
git commit
```
En su defecto, se puede optar por colocar un mensaje a la confirmación, anteponiendo el parámetro `-m` de la siguiente manera:
```bash
git commit -m "Mensaje personalizado para explicar brevemente los cambios"
```
Preferiblemente, para firmar el `commit` verificando su identidad con la llave GPG generada en el equipo local, se puede optar por anteponer el parámetro `-S` de la siguiente manera:
```bash
git commit -S -m "Mensaje personalizado firmado con la identidad."
```
De esta manera, al confirmar los cambios tendremos por ejemplo el siguiente mensaje de Git:

![Git Directory](../img/git-directory.png)
__Imagen 5__: _Estado Git Directory de Git._