[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido del documento</summary>
    <a href="#Sintaxis-documental-con-Markdown"><strong>Sintaxis documental con Markdown</strong></a><br>
    <a href="#Encabezados-y-títulos">· Encabezados y títulos</a><br>
    <a href="#Párrafos-y-estilo-normal">· Párrafos y estilo normal</a><br>
    <a href="#Tipos-de-listas">· Tipos de listas</a><br>
    <a href="#Vínculos">· Vínculos</a><br>
    <a href="#Inserción-de-imágenes-mediante-vínculos">· Inserción de imágenes mediante vínculos</a><br>
    <a href="#Tablas-con-formato">· Tablas con formato</a><br>
    <a href="#Archivo-README">· Archivo README</a><br>
    <a href="#Sintaxis-HTML-y-CSS-en-Markdown">· Sintaxis HTML y CSS en Markdown</a><br>
    <a href="#">· </a><br>
</details>

# Sintaxis documental con Markdown
Markdown es un [Lenguaje de Marcado](https://es.wikipedia.org/wiki/Lenguaje_de_marcado) que es utilizado para dar un formato documental utilizando texto plano de forma ligera y simplificada. Fue creado con el objetivo de conseguir una plataforma práctica de redacción de documentos, con un formato legible y de fácil publicación. Es un sistema ampliamente adoptado en [Sistemas de Gestión de Contenidos (CMS)](https://es.wikipedia.org/wiki/Sistema_de_gesti%C3%B3n_de_contenidos), como ser Blogs, Wiki, Foros, Microblogging, Publicaciones Digitales, E-learning, Sistemas de Mesajería Instantánea etcétera.

El secreto de Markdown se basa en la creación de archivos de extensión `*.md` desde cualquier editor de texto plano, siguiendo las reglas de la sintaxis que se desarrollan en las demás secciones del documento. No hace falta nada más que eso para la redacción, y en el caso de su legibilidad necesitaremos contar con una herramienta que lo renderice, ya sea local o en línea, contando con una gran cantidad de opciones tales como:

* IDE's con soporte a Markdown tales como [Visual Studio Code](https://code.visualstudio.com), [Atom](https://atom.io/), [Brackets](http://brackets.io/), [Eclipse](https://www.eclipse.org/ide/), etcétera.
* Herramientas locales como [Typora](https://typora.io/), [MindForger](https://www.mindforger.com/), [BoostNote](https://boostnote.io/), [Joplin](https://joplin.cozic.net/), [PileMd](https://pilemd.com/), etcétera.
* Plataformas de edición en línea, tales como [GitHub](https://github.com), [GitLab](https://gitlab.com), [GitBook](https://gitbook.com), [Sharepoint](https://products.office.com/es-ar/sharepoint/collaboration), [StackEdit](https://stackedit.io), [Dillinger](https://dillinger.io/), etcétera.

Sinceramente la lista es interminable y además se suman opciones día tras día, debido a la gran adopción de la comunidad de desarrollo y del abanico de los sistemas CMS, convirtiendo a Markdown en un estándar prácticamente.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Encabezados y títulos
Markdown gestiona de los encabezados y títulos en seis niveles de la misma forma que la sintaxis del _lenguaje de marcado en hypertexto_ de [HTML](https://es.wikipedia.org/wiki/HTML). A continuación podemos ver su sintaxis con la analogía de sus etiquetas en HTML:
```md
# Encabezado 1 <h1>
## Encabezado 2 <h2>
### Encabezado 3 <h3>
#### Encabezado 4 <h4>
##### Encabezado 5 <h5>
###### Encabezado 6 <h6>
```
> Se puede observar que se debe colocar un espacio luego del símbolo `#`.

Renderizado se vería de esta forma:
# Encabezado 1<!-- omit in toc -->
## Encabezado 2<!-- omit in toc -->
### Encabezado 3<!-- omit in toc -->
#### Encabezado 4<!-- omit in toc -->
##### Encabezado 5<!-- omit in toc -->
###### Encabezado 6<!-- omit in toc -->
[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Párrafos y estilo normal
Siguiendo la analogía con HTML, donde los párrafos se encienrran entre etiquetas `<p>`, en el caso de Markdown los párrafos se escriben sin ninguna sintaxis en especial. Para separar los párrafos, debe existir dos entradas de teclado de tipo `Enter`.

En el caso de los caracteres especiales utilizados para Markdown por su sintaxis, si queremos evitar su formateado debemos anteponer la barra invertida `\` antes del mismo, por ejemplo:
```md
\#
\*
\`
\_
\>
```
### Salto de línea<!-- omit in toc -->
Se pueden agregar saltos de línea en Markdown similiar a la etiqueta `<hr>` en HTML, de la siguiente manera:
```md
-----
```
Así puede verse según el ejemplo:

-----

### Formato de texto<!-- omit in toc -->
Tenemos la posibilidad de darle formato especial al texto que agreguemos, es decir con formato _Cursiva_, __Negrita__ y ~~Tachado~~, haciéndolo de la siguiente manera:
```md
_Cursiva_
__Negrita__
~~Tachado~~
```
Análogamente en HMTL tenemos las etiquetas `<strong>` para __Negrita__, `<em>` para _Cursiva_ y `<strike>` para ~~Tachado~~.
### Uso de comentarios<!-- omit in toc -->
Tenemos la posibilidad de formatear párrafos de tipo comentario en Markdown de la misma forma que HTML con la etiqueta `<blockquote>`, aunque es importante aclarar que no es un comentario de tipo cita porque no tiene una referencia, y tampoco es un comentario de omisión de tipo código (_el cual veremos más adelante_). Para realizar un comentario, lo haremos anteponiendo el śimbolo `>` seguido de un espacio, como podemos ver en el siguiente ejemplo:
```md
> Esto es un párrafo de tipo comentario.
```
Se aprecia de la siguiente manera:
> Esto es un párrafo de tipo comentario.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Tipos de listas
Tenemos las posibilidad de generar un listado con viñetas o auto-numeradas, tal y como lo hacemos con las etiquetas HTML `<ul>` y `<ol>` respectivamente. Cada párrafo de las viñetas se generan anteponiendo el símbolo `*` seguido de un espacio, y de la misma forma se usan las listas numeradas, anteponiendo siempre la sintaxis `1.` seguido de un espacio (_no hace falta numerar la lista por nuestra cuenta, ya que colocando la sintaxis mencionada, la numeracion se genera automáticamente_).
```md
* Agregar una viñeta con un astericos al principio. 
* Ejemplos segunda linea de viñeta.
* Ejemplo tercera linea de viñeta.

1. Agrega una viñeta numerada con el numero 1.
1. Ejemplo segunda linea viñeta numerada.
1. Ejemplo tercera linea viñeta numerada.
```
Se vería de la siguiente manera:
* Agregar una viñeta con un astericos al principio. 
* Ejemplos segunda linea de viñeta.
* Ejemplo tercera linea de viñeta.

1. Agrega una viñeta numerada con el numero 1.
1. Ejemplo segunda linea viñeta numerada.
1. Ejemplo tercera linea viñeta numerada. 

Para realizar sub-listas, debemos mantener tabularlas para que Markdown las interprete en niveles, por ejemplo:
```md
* Viñeta en nivel 1.
    1. Lista numerada 1 en nivel 2.
    1. Lista numerada 2 en nivel 2.
    1. Lista numerada 3 en nivel 2.
```
Se verán de la siguiente manera:
* Viñeta en nivel 1.
    1. Lista numerada 1 en nivel 2.
    1. Lista numerada 2 en nivel 2.
    1. Lista numerada 3 en nivel 2.

También podremos realizar un listado de tipo [Casillas de verificación](https://es.wikipedia.org/wiki/Casilla_de_verificaci%C3%B3n) (_este listado no se puede nivelar_), utilizando la siguiente sintaxis:
```md
- [x] Casilla verificada
- [ ] Casilla sin verificar
```
Esta lista se ve de la siguiente manera:
- [x] Casilla verificada
- [ ] Casilla sin verificar

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Vínculos
Markdown puede gestionar varios tipos de referencias de similar forma que HTML con la etiqueta `<href>`. Lo que se hace es encerrar la descripción a la que queremos agregar el hypervínculo con los símbolos de corchetes de apertura `[` y de cierre `]`, seguido y sin espacios de los símbolos de paréntesis de apertura `(` y de cierre `)` para colocar allí el vínculo donde queremos que el lector se dirija. 
### Vínculos internos en el documento<!-- omit in toc -->
Para esto vamos a empezar a ver un ejemplo con un vínculo interno al documento, por ejemplo, que al hacer click o presionar sobre una frase nos dirija al inicio de este documento. Sólo podremos hacer esto con títulos o encabezados en Markdown, y se realiza de la siguiente manera:
```md
Vamos al [inicio del documento](#Sintaxis-documental-con-Markdown) para empezar
```
Renderizado quedaría de la siguiente manera:

Vamos al [inicio del documento](#Sintaxis-documental-con-Markdown) para empezar

Entonces aquí vemos que para hacer una referencia a un título (_o subtítulo_), dentro de los paréntesis debemos agregar el título reemplazando los espacios por guiones `-` y anteponemos el símbolo `#` sin dejar ningún tipo de espacio.

Ahora bien, vimos que podemos aplicar un hypervínculo a una frase, pero también lo podemos hacer sobre una palabra, o cualquier otro tipo de contenido en Markdown, mientras respetemos la sintaxis de encerrar ese contenido en corchetes y seguido del vínculo entre paréntesis, no tendremos ningún tipo de inconveniente.
### Vínculos absolutos o relativos<!-- omit in toc -->
En este punto necesitamos comprender el concepto de las rutas absolutas y las rutas relativas, __tema fundamental__ para saber donde estamos y a donde queremos ir en cualquier tipo de software que opere con hypervínculos.
#### Rutas absolutas<!-- omit in toc -->
Las rutas absolutas son aquellas que tienen la dirección completa de la ubicación desde la raíz del sistema. Por ejemplo, si queremos acceder a una carpeta dentro del directorio de nuestro disco, que se encuentra dentro de otra carpeta, y así en los niveles del árbol del directorio que se encuentre, lo hacemos de la siguiente manera:
```bash
/usr/bin/git

C:\Program Files\Git\bin
```
Aquí podemos ver las rutas absolutas del directorio donde se encuentra instalado Git en el sistema operativo de Linux y Git Bash en Windows, iniciando desde el directorio raíz de los sistemas de archivos.

Ahora bien, rara vez utilizaremos este tipo de rutas en nuestros repositorios de Git, ya que si estamos trabajando en equipo y apuntamos a rutas absolutas de nuestra propia PC, sólo nos funcionará a nosotros. Hay casos que seguramente vamos a utilizar rutas compartidas de red, que no son rutas absolutas, sino mas bien rutas que dependen de este y que se puede acceder desde varios lugares en la red. Aquí no podemos dar un ejemplo generalizado, ya que los sistemas pueden utilizar varias formas de establecer rutas compartidas, y también va a depender de cada sistema y de la compatibilidad de las mismas hacia otros sistemas.
#### Rutas relativas<!-- omit in toc -->
Este tipo de rutas son las mas frecuentes en el uso de repositorios compartidos, sitios en internet entre otros, dado su amplia compatibilidad en diferentes sistemas. Por lo tanto, debemos tener bien claro este concepto para manejarnos con soltura al vincular sus elementos. Una ruta relativa es entonces, la ruta del directorio donde estoy parado en este momento. Por ejemplo, nosotros nos encontramos dentro de la carpeta `docs/` y para ir por ejemplo al directorio de arriba, o del nivel anterior debemos ejecutar el siguiente comando:
```bash
cd ../
```
> En el caso del sistema de Microsoft Windows, posiblemente no interprete correctamente la barra lateral `/`, ya que es el único sistema que gestiona las rutas entre carpetas con la barra invertida `\`. El resto de los sistemas, ya sea Linux, MAC, sitios en internet, celulares, etcétera, utilizan la barra lateral, por lo que tendremos una amplia compatibilidad entre ellos. :-1: Mal por Microsoft.

Si queremos dirigirnos a una sub-carpeta desde donde estamos, ejecutamos el mismo comando con el nombre de la carpeta, seguida de la barra lateral, de la siguiente forma:
```bash
cd nombre-subcarpeta/
```
> Se debe tener en cuenta para tener una amplia compatibilidad entre los sistemas, de usar la rutas relativas con sensibilidad a mayúsculas y minúsculas, así como también evitar el uso de espacios al definirlas. De esta manera, por ejemplo la comunidad de desarrollo nombra a sus directorios y archivos en minúsculas y sin espacios, reemplazando a estos últimos con símbolos.

Ahora bien, vamos a poner otro ejemplo en donde necesitamos ir a una carpeta que está en el mismo nivel que `docs/` en este repositorio, que puede ser `img/` utilizando un caso existente. Entonces para ir la carpeta `img/` lo hacemos así:
```bash
cd ../img/
```
Aquí podemos ver que fuimos primero al nivel anterior con `../` y de ahí fuimos al directorio `img/`. Si quisiéramos ir a otro nivel más arriba aún, tenemos que concatenar otra vez `../`, y así tantas veces necesitemos subir de nivel, por ejemplo, simulamos que vamos dentro de una carpeta que esta a dos niveles hacia arriba de donde estamos y luego desde ahí nos dirigimos a una carpeta llamada `ejemplo`:
```bash
cd ../../ejemplo/
```
> Seguramente para comprender bien este concepto es necesario practicar así podemos tenerlo bien incorporado.

Habiendo comprendido el concepto de vínculos relativos, podremos crear vínculos a rutas o archivos dentro del repositorio que estamos trabajando. Nuestro marco de trabajo siempre será relativo partiendo desde donde estamos, y colocando la dirección relativa hacia donde queremos ir. Actualmente estamos parados dentro de la carpeta `docs`, y si queremos movernos dentro del propio repositorio, tenemos que colocar su ruta relativa a nosotros. Analicemos los siguientes ejemplos:
```md
[Este es un vínculo](../img) a una ruta relativa.
[Este es un vínculo](../README.md) a un archivo relativo.
```
En el primer caso, tenemos una ruta relativa a una carpeta o directorio llamada `img` que se encuentra en un nivel superior de donde estamos. En el segundo caso, nos movimos a un archivo que se encuentra en un nivel superior de donde estamos.
> Para utilizar de forma correcta las rutas relativas, siempre debemos tener presente los límites de nuestro repositorio, es decir evitar crear rutas relativas fuera de este, ya que las copias del repositorio tanto locales como remotos serán fieles entre ellas mientras se mantengan actualizadas.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
### Vínculos externos<!-- omit in toc -->
Los vínculos externos, son aquellas rutas compartidas que estuvimos analizando anteriormente, donde se tiene acceso desde diferentes lugares. Este tipo de vínculos se utilizan en su mayoría para vínculos de internet con un amplia compatibilidad entre dispositivos y sistemas, y también nos servirá para vinculos en una red privada (_aquí es recomendable generar vínculos para poder acceder sin problemas desde diferentes sistemas y/o ubicaciones_).

Veamos el siguiente ejemplo:
```md
Ir a la página de [Google Argentina](https://www.google.com.ar)
```
Acá podemos ver el caso de un sitio web público que prácticamente se tiene acceso desde cualquier red y dispositivo conectados a internet. También podemos agregar referencias a un correo electrónico en particular de la siguiente forma:
```md
Pueden enviarme un [correo](mailto:correo@ejemplo.com)
```
En definitiva podemos ver que la referencia a vínculos externos es smiliar a la tecnología HTML, y la lista de opciones que tenemos es extensa.
> Dentro de la plataforma de GitHub, podemos gestionar referencias al historial del propio proyecto, a los Issues, Pull Request, Teams, etcétera, lo cuáles serán últiles a la hora de comunicarnos dentro de la propia plataforma.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Inserción de imágenes mediante vínculos
Dentro de un documento Markdown también se puede insertar imágenes estáticas o en movimiento desde un vínculo en particular, tales como PNG, JPG, GIF, entre otras. Las imágenes pueden estar dentro de nuestro repositorio como así también fuera de este, y lo que necesitaremos para esto es dirección relativa o externa dependiendo del caso.

La sintaxis de inserción de una imagen es idéntica a la de un vínculo, salvo que hay que anteponer el símbolo de exclamación `!` antes de los corchetes:
```md
![ImagenDePrueba](../img/professortocat.png)

![Imagen externa](https://octodex.github.com/images/hula_loop_octodex03.gif)
```
En este ejemplo podemos ver la inserción de un imagen de nuestro repositorio mediante una refencia relativa, y luego podemos ver una imagen en movimiento desde un vínculo externo en internet. Dentro de los corchetes se colocar una descripción resumida de la imagen, que se mostrará si el vínculo está roto, es decir si la imagen no existe en la dirección que le indicamos.

A continuación vemos como quedan las imágenes insertadas a través de vínculos.

![Imagen interna](../img/professortocat.png)

![Imagen externa](https://octodex.github.com/images/hula_loop_octodex03.gif)

> Debemos tener en cuenta que nos podemos redimensionar los tamaños de las imágenes, y si necesitamos hacerlo debemos aplicarle los cambios directamente a la imagen, o utilizar el recurso de la sintaxis HTML que hablaremos más adelante.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Tablas con formato
Tenemos la posibilidad de generar tablas dentro de MarkDown, tenemos que tener en cuenta que el tamaño de cada columna varia segun el texto que este contenga.

_Ejemplo:_

* Las columnas se generan con "|"
* Las filas se generan con "-"

        ColumnaA | ColumnaB | ColumnaC
        ---------|----------|----------
        Fila1A   | Fila1B   | Fila1C
        Fila2A   | Fila2B   | Fila2C

ColumnaA | ColumnaB | ColumnaC
---------|----------|----------
Fila1A   | Fila1B   | Fila1C
Fila2A   | Fila2B   | Fila2C


## Alineación de columnas en tablas

Dentro de las tablas, tenemos la posibilidad de darle formato a la alineacion de cada columna. El mismo se configura en la segunda linea, luego de la generación del encabezado. 

* Alineacion derecha    --> -----:
* Alineacion izquierda  --> :-----
* Alineacion centrada   --> :----:

_Ejemplo:_

        Izquierda | Derecha  | Centrado
        :-------- | -------: |:--------:
        Fila1A    | Fila1B   | Fila1C
        Fila2A    | Fila2B   | Fila2C

Izquierda | Derecha  | Centrado
:-------- |--------: |:--------:
Fila1A    | Fila1B   | Fila1C
Fila2A    | Fila2B   | Fila2C


## Comentarios tipo codigo 

Se puede generar comentarios con formato de codigo. El mismo tienen que estar contenido dento de ``` con la descripción del tipo lenguaje que estamos insertando. 

_Ejemplo:_

        ```sql
        SELECT A.nombre, 
            A.numerodocumento, 
            B.descripcion 
        FROM   nombretabla1 AS A 
            JOIN nombretabla2 AS B 
                ON A.campo_id = B.campo_id 
        WHERE  A.numero = 1 
        ```
```sql
SELECT A.nombre, 
       A.numerodocumento, 
       B.descripcion 
FROM   nombretabla1 AS A 
       JOIN nombretabla2 AS B 
         ON A.campo_id = B.campo_id 
WHERE  A.numero = 1 
```

## Archivo README
[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Sintaxis HTML y CSS en Markdown
Durante todo el documento estuvimos viendo la analogía de Markdown con HMTL, y por lo cierto, no fue un capricho. Esto sucede porque Markdown también puede interpretar sintaxis HTML, pero como no es un estándar definido dentro de Markdown, no todos los rederizadores lo interpretan correctamente, ó directamente no lo interpretan. Esta mezcla de sintaxis suele utilizarse cuando Markdown no nos alcanza para lo que queremos realizar, por lo que se hace uso de esta alternativa con HTML. Si bien no vamos a ver ejemplos del tema en esta sección, es importante tenerlo en cuenta e investigar del tema por si el día de mañana lo necesitemos o nos topemos con documentos de esta manera.

También soporta parte del estándar CSS dentro del documento o vinculando estilos con archivos externos `css`, pero aquí la limitación es aún mas grande que con HTML, y sólo se recomienda su uso en casos muy particulares.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)