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
    <a href="#Líneas-de-código">· Líneas de código</a><br>
    <a href="#Archivo-README">· Archivo README</a><br>
    <a href="#Sintaxis-HTML-y-CSS-en-Markdown">· Sintaxis HTML y CSS en Markdown</a><br>    
</details>

# Sintaxis documental con Markdown
Markdown es un [Lenguaje de Marcado](https://es.wikipedia.org/wiki/Lenguaje_de_marcado) que es utilizado para dar un formato documental predefinido, utilizando texto plano de forma ligera y simplificada. Fue creado con el objetivo de conseguir una plataforma práctica de redacción de documentos, con un formato legible y de fácil publicación. Es ampliamente adoptado en [Sistemas de Gestión de Contenidos (CMS)](https://es.wikipedia.org/wiki/Sistema_de_gesti%C3%B3n_de_contenidos), como ser Blogs, Wiki, Foros, Microblogging, Publicaciones Digitales, E-learning, Sistemas de Mesajería Instantánea, etcétera.

El concepto de Markdown se basa en la creación de archivos de extensión `*.md` desde cualquier editor de texto plano, siguiendo las reglas de la sintaxis que se desarrollarán en las demás secciones del documento. No hace falta conocer ningún leguaje de programación en especial para la redacción de este tipo de archivos, pero para poder leerlos necesitaremos contar con una herramienta que lo renderice al formato visual estándar, ya sea con aplicaciones locales o en sitios en línea, contando con una gran cantidad de opciones tales como:

* IDE's con soporte a Markdown tales como [Visual Studio Code](https://code.visualstudio.com), [Atom](https://atom.io/), [Brackets](http://brackets.io/), [Eclipse](https://www.eclipse.org/ide/), etcétera.
* Herramientas locales como [Typora](https://typora.io/), [MindForger](https://www.mindforger.com/), [BoostNote](https://boostnote.io/), [Joplin](https://joplin.cozic.net/), [PileMd](https://pilemd.com/), etcétera.
* Plataformas de edición en línea, tales como [GitHub](https://github.com), [GitLab](https://gitlab.com), [GitBook](https://gitbook.com), [Sharepoint](https://products.office.com/es-ar/sharepoint/collaboration), [StackEdit](https://stackedit.io), [Dillinger](https://dillinger.io/), etcétera.

Realmente la lista es interminable, y además se suman opciones día tras día debido a la gran adopción de la comunidad de desarrollo y del amplio uso en los sistemas CMS, logrando que Markdown se utilice prácticamente como un estándar documental en la red de redes.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Encabezados y títulos
Markdown gestiona de los encabezados y títulos en seis niveles, de la misma forma que la sintaxis del _lenguaje de marcado en hypertexto_ ([HTML](https://es.wikipedia.org/wiki/HTML)). A continuación podemos ver su sintaxis con la analogía de sus etiquetas en HTML:
```md
# Encabezado 1 <h1>
## Encabezado 2 <h2>
### Encabezado 3 <h3>
#### Encabezado 4 <h4>
##### Encabezado 5 <h5>
###### Encabezado 6 <h6>
```
> Se puede observar que se debe colocar un espacio luego del símbolo `#`.

Una vez renderizado se ve de la siguiente forma:
# Encabezado 1<!-- omit in toc -->
## Encabezado 2<!-- omit in toc -->
### Encabezado 3<!-- omit in toc -->
#### Encabezado 4<!-- omit in toc -->
##### Encabezado 5<!-- omit in toc -->
###### Encabezado 6<!-- omit in toc -->
[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Párrafos y estilo normal
Siguiendo la analogía con HTML, donde en este los párrafos se encienrran entre etiquetas `<p>`, en el caso de Markdown los párrafos se escriben sin ninguna sintaxis en especial. Para separar los párrafos, debe existir dos entradas de teclado de tipo `Enter`.

En el caso de los caracteres especiales utilizados para Markdown dentro de su sintaxis, si queremos evitarlo en su renderizado, debemos anteponer la barra invertida `\` antes, por ejemplo:
```md
\#
\*
\`
\_
\>
```
### Salto de línea<!-- omit in toc -->
Se pueden agregar saltos de línea en Markdown de forma similiar que la etiqueta `<hr>` en HTML de la siguiente manera:
```md
-----
```
Así puede verse según el ejemplo:

-----

### Formato de texto<!-- omit in toc -->
Tenemos la posibilidad de darle formato especial al texto que agreguemos, es decir con formato _Cursiva_, __Negrita__ y ~~Tachado~~, haciéndolo de esta manera:
```md
_Cursiva_
__Negrita__
~~Tachado~~
```
Análogamente en HMTL tenemos las etiquetas `<strong>` para __Negrita__, `<em>` para _Cursiva_ y `<strike>` para ~~Tachado~~.
### Uso de comentarios<!-- omit in toc -->
En Markdown tenemos la posibilidad de formatear párrafos de tipo comentario de la misma forma que HTML con la etiqueta `<blockquote>`, aunque es importante aclarar que no es un comentario de tipo cita porque no tiene una referencia, y tampoco es un comentario de omisión de tipo código (_el cual veremos más adelante_). Para realizar un comentario, lo haremos anteponiendo el śimbolo `>` seguido de un espacio, como podemos ver en el siguiente ejemplo:
```md
> Esto es un párrafo de tipo comentario.
```
Se aprecia de la siguiente manera:
> Esto es un párrafo de tipo comentario.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Tipos de listas
Tenemos la posibilidad de generar un listado con viñetas o auto-numeradas, tal y como lo hacemos con las etiquetas HTML `<ul>` y `<ol>` respectivamente. Cada párrafo de las viñetas se generan anteponiendo el símbolo `*` seguido de un espacio, y de la misma forma se usan las listas numeradas, anteponiendo siempre la sintaxis `1.` seguido de un espacio (_no hace falta numerar la lista por nuestra cuenta, la numeracion se genera automáticamente al momento de su renderización_).
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
Markdown puede gestionar varios tipos de referencias de forma análoga que HTML con la etiqueta `<href>`. Esto se realiza encerrando el texto al que queremos agregar el hypervínculo, mediante los símbolos de corchetes de apertura `[` y de cierre `]`, seguido y sin espacios de los símbolos de paréntesis de apertura `(` y de cierre `)`, colocando allí el vínculo donde queremos que el lector se dirija. 
### Vínculos internos en el documento<!-- omit in toc -->
Para esto vamos a empezar a ver un ejemplo con un vínculo interno al documento, por ejemplo, que al hacer click o presionar sobre una frase nos dirija al inicio de este documento. Sólo podremos hacer esto con títulos o encabezados en Markdown, y se realiza de la siguiente manera:
```md
Vamos al [inicio del documento](#Sintaxis-documental-con-Markdown) para empezar
```
Renderizado quedaría de la siguiente manera:

Vamos al [inicio del documento](#Sintaxis-documental-con-Markdown) para empezar

Entonces aquí vemos que para hacer una referencia a un título (_o subtítulo_), dentro de los paréntesis debemos agregar el título reemplazando los espacios por guiones `-` y anteponemos el símbolo `#` sin dejar ningún tipo de espacio.

Ahora bien, vimos que podemos aplicar un hypervínculo a una frase, pero también lo podemos hacer sobre una palabra, o cualquier otro tipo de contenido en Markdown, mientras respetemos la sintaxis de encerrar ese contenido en corchetes, seguido del vínculo entre paréntesis, no tendremos ningún tipo de inconveniente.
### Vínculos absolutos o relativos<!-- omit in toc -->
En este punto necesitamos comprender el concepto de las rutas absolutas y las rutas relativas, __tema fundamental__ para saber donde estamos y a donde queremos ir en cualquier tipo de software que opere con hypervínculos.
#### Rutas absolutas<!-- omit in toc -->
Las rutas absolutas son aquellas que tienen la dirección completa de su ubicación a partir de la raíz del sistema. Por ejemplo, si queremos acceder a una carpeta dentro de nuestro disco, que a su vez esta se encuentra dentro de otra carpeta (_y así en los niveles del árbol del directorio que se encuentre_), lo hacemos de la siguiente manera:
```bash
/usr/bin/git

C:\Program Files\Git\bin
```
Aquí podemos ver las rutas absolutas del directorio por defecto donde se encuentra instalado Git en el sistema operativo de Linux y Git Bash en Windows, iniciando desde el directorio raíz de sus correspondientes sistemas de archivos.

Ahora bien, rara vez utilizaremos este tipo de rutas en nuestros repositorios de Git, ya que si estamos trabajando en equipo y apuntamos a rutas absolutas de nuestra propia PC, sólo nos funcionará a nosotros en la mayoría de los casos. Habrá momentos que seguramente vamos a utilizar rutas compartidas de red, que no son rutas absolutas, sino mas bien rutas que dependen de este y que se puede acceder desde varios lugares dentro de una red privada. Aquí no podemos dar un ejemplo generalizado, ya que los diferentes sistemas pueden utilizar varias formas de establecer y acceder a rutas compartidas, y también va a depender de cada uno de ellos como gestiona la compatibilidad hacia otros sistemas.
#### Rutas relativas<!-- omit in toc -->
Este tipo de rutas son las mas frecuentes en repositorios compartidos, sitios en internet, entre otras opciones, dado su amplia compatibilidad entre diferentes sistemas y dispositivos. Por lo tanto, debemos tener bien claro este concepto para manejarnos con soltura al vincular elementos dentro de un repositorio.

Una ruta relativa es entonces, la ruta del directorio hacia donde quiero ir, desde donde estamos parados en ese momento. Por ejemplo, nosotros nos encontramos dentro de la carpeta `docs/` y para ir al directorio de un nivel mas arriba o del nivel anterior, debemos ejecutar el siguiente comando:
```bash
cd ../
```
> En el caso del sistema de Microsoft Windows, posiblemente no interprete correctamente la barra lateral `/`, ya que es el único sistema que gestiona las rutas entre carpetas con la barra invertida `\`. El resto de los sistemas, ya sea Linux, MAC, sitios en internet, celulares, etcétera, utilizan la barra lateral, por lo que tendremos una amplia compatibilidad entre ellos. :-1: Mal ahí Microsoft.

Si queremos dirigirnos a una sub-carpeta desde donde estamos, ejecutamos el mismo comando con el nombre de la carpeta seguida de la barra lateral, de la siguiente forma:
```bash
cd nombre-subcarpeta/
```
> Se recomienda el uso de nombres de directorios con sensibilidad a mayúsculas y minúsculas, evitando el uso de espacios al definirlas,  para tener una amplia compatibilidad entre los sistemas. De esta manera, por ejemplo la comunidad de desarrollo nombra a sus directorios y archivos en minúsculas y sin espacios, reemplazando a estos últimos con símbolos, por ejemplo el guión medio `-` y/o guión bajo `_`, como así también el método [Lower Camel Case](https://en.wikipedia.org/wiki/Camel_case).

Ahora bien, vamos a poner otro ejemplo en donde necesitamos ir a una carpeta que está en el mismo nivel que `docs/` en este repositorio, que puede ser `img/` utilizando un caso existente. Entonces para ir la carpeta `img/` lo hacemos así:
```bash
cd ../img/
```
Aquí podemos ver que fuimos primero al nivel anterior con `../` y de ahí fuimos al directorio `img/`. Si quisiéramos ir a otro nivel más arriba aún, tenemos que concatenar otra vez `../`, y así tantas veces necesitemos subir de nivel, por ejemplo simulamos que vamos a una carpeta que esta a dos niveles hacia arriba de donde estamos y luego desde ahí nos dirigimos a una carpeta llamada `ejemplo`:
```bash
cd ../../ejemplo/
```
> Seguramente para comprender bien este concepto es necesario practicar así podemos tenerlo bien incorporado.

De esta manera, contando con el concepto de vínculos relativos podremos crear vínculos a rutas o archivos dentro del repositorio que estamos trabajando. Nuestro marco de trabajo siempre será relativo partiendo desde donde estamos, y colocando la dirección relativa hacia donde queremos ir. Actualmente estamos parados dentro de la carpeta `docs`, y si queremos movernos dentro del propio repositorio, tenemos que colocar su ruta relativa a donde estamos nosotros. Analicemos los siguientes ejemplos:
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
![Imagen interna](../img/professortocat.png)

![Imagen externa](https://octodex.github.com/images/hula_loop_octodex03.gif)
```
En este ejemplo podemos ver la inserción de una imagen PNG desde nuestro repositorio mediante una refencia relativa, y en la otra imagen podemos ver una animación GIF desde un vínculo externo en internet. Dentro de los corchetes se debe colocar una descripción resumida de la imagen, que se mostrará si el vínculo está roto, es decir si la imagen no existe en la dirección que le indicamos.

A continuación vemos como quedan las imágenes insertadas a través de vínculos.

![Imagen interna](../img/professortocat.png)

![Imagen externa](https://octodex.github.com/images/hula_loop_octodex03.gif)

> Debemos tener en cuenta que no podemos redimensionar los tamaños de las imágenes, y si necesitamos hacerlo debemos aplicarle los cambios directamente a la imagen, o utilizar el recurso de la sintaxis HTML que hablaremos más adelante.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Tablas con formato
Con Markdown tenemos la posibilidad de generar tablas formateadas solamente con texto plano. El formato distingue los encabezados de los registros que carguemos en ellas y la sintaxis sería de la siguiente manera:

```md
ColumnaA|ColumnaB|ColumnaC
-|-|-
Fila1A|Fila1B|Fila1C
Fila2A|Fila2B|Fila2C
```
Aquí podemos observar que las columnas se separan con la barra vertical `|`, y la segunda fila no debe tener datos, sino que se debe colocar el símbolo de guión medio `-` de manera obligatoria. Esta nomenclatura distingue la fila de encabezado de la tabla del resto de las filas con datos. Ahora bien, estéticamente no se distingue con facilidad cuando la estamos editando, por lo cual se emplea la siguiente técnica para contar con un mejor marco visual:
```md
ColumnaA | ColumnaB | ColumnaC
-------- | -------- | --------
Fila1A   | Fila1B   | Fila1C
Fila2A   | Fila2B   | Fila2C
```
En este segundo ejemplo, podemos visualizar mejor los límites de la tabla, así como también la separación de las columnas y la distinción del encabezado. Esta técnica funciona exactamente igual que el ejemplo anterior, y el hecho de agregar espacios o guiones adicionales no interfiere en absoluto en el formato final ya renderizado. A continuación vemos como quedaría este caso:

ColumnaA | ColumnaB | ColumnaC
-------- | -------- | --------
Fila1A   | Fila1B   | Fila1C
Fila2A   | Fila2B   | Fila2C

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
### Alineación de columnas<!-- omit in toc -->
Adicionalmente, contamos con una función para alinear el contenido de las columnas hacia la izquierda, al centro o a la derecha. Esto lo podemos hacer modificando la sintaxis de la segunda fila, agregando el símbolo de `:`, marcando hacia donde queremos alinearlo: 

* __Alineación izquierda__:  `:-----`
* __Alineación centrada__:   `:----:`
* __Alineación derecha__:    `-----:`

Vamos a aplicarlo con un ejemplo para poder visualizarlo mejor:
```md
Izquierda | Derecha | Centrado
:-------- | ------: | :------:
Fila1A    | Fila1B  | Fila1C
Fila2A    | Fila2B  | Fila2C
```
Una vez renderizado se podrá ver de la siguiente forma:
Izquierda | Derecha | Centrado
:-------- | ------: | :------:
Fila1A    | Fila1B  | Fila1C
Fila2A    | Fila2B  | Fila2C
> De esta manera, vemos que con Markdown podemos conseguir tablas de forma simple y efectiva, contando con un formato determinado y con varias opciones de alineación. Si fuera necesario aplicar formatos más enriquecidos o contar con mas opciones, ya tenemos que pensar en una sintaxis en HTML con el etiquetado `<table>`, tema que hablaremos más adelante.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Líneas de código
En la mayoría de los sistemas, para mostrar líneas de código se suele emplear el uso del texto sin formato. En este caso Markdown no es la excepción, pero si es digno de destacar que nos brinda la posibilidad de aplicar un formato de resaltado de sintaxis de código según el lenguaje utilizado.
> Cuando hablamos de texto sin formato, en realidad es una forma de declararlo, ya que la realidad es que el texto si tiene un formato, con un determinado tipo de letra, tamaño, espaciado, interlineado, etcétera; y lo que se busca es verdad es contar con un formato parecido a como si estuviéramos trabajando dentro de una consola de comandos de diferentes sistemas operativos.

Ahora bien, el texto sin formato no se utiliza solamente para mostrar ejemplos de código, sinó que también lo podemos utilizar en deterinadas palabras u oraciones dentro de un párrafo. Para hacerlo debemos encerrar el texto entre comilllas simples invertidas \` de la siguiente forma:
```md
Este es un párrafo con una `palabra` sin formato.
```
Aplicando el estilo de Markdown se vería de la siguiente forma:

Este es un párrafo con una `palabra` sin formato.

Supongamos que ahora necesitemos mostrar una porción de código dentro de Markdown, y para ello debemos encerrarlo por una línea con sólo tres comillas simples invertidas al principio, y otra línea de la misma manera al final del código:
```
    ```
    ejemplo de líneas de código
    .....
    .....
    .....
    ```
```
Tomando una porción de código de ejemplo, en este caso con el lenguaje SQL, le podemos aplicar el resaltado del sintaxis agregando el nombre del lenguaje al lado de los marcadores de bloque de código de triple comillas simples invertidas: 
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
```
Cuando Markdown lo renderiza, ya no muestra el nombre del lenguaje, y le brinda un formato de resaltado de sintaxis tal y como se muestra con el ejemplo que venimos trabajando a continuación:
```sql
SELECT A.nombre, 
       A.numerodocumento, 
       B.descripcion 
FROM   nombretabla1 AS A 
       JOIN nombretabla2 AS B 
         ON A.campo_id = B.campo_id 
WHERE  A.numero = 1 
```
> Es importante tener en claro que característica dependerá del renderizador de Markdown que utilicemos y puede que existan variaciones entre ellos.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
### Ocultar líneas en Markdown<!-- omit in toc -->
Con Markdown podremos ocultar una oración, párrafo, o palabras aplicando la misma sintaxis que se utiliza con HTML para ocultar su código al momento de su interpretación por parte de un navedador web. Entonces, HTML utiliza el juego de caracteres de `<!--` para declarar que a partir de ese momento lo que se escriba allí no se renderice ni se muestre en el navegador, hasta que encuentre los caracteres de `-->` para indicar que hasta allí no lo tendrá en cuenta. Markdown adoptó esta misma sintaxis, y con el siguiente ejemplo buscaremos dejar mas claro este concepto:
```md
<!-- Estas líneas de aquí
van a estar ocultas en un visor de Markdown,
y sólo serán visibles al momento de editarlas -->
```
> Se puede notar que existe un espacio entre los juegos de caracteres de apertura y cierre para no tener problemas de compatibilidad con ningún renderizador de Markdown. 

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Archivo README
[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)
## Sintaxis HTML y CSS en Markdown
Durante todo el documento estuvimos viendo la analogía de Markdown con HMTL, y por lo cierto, no fue un capricho. Esto sucede porque la idea original de Markdown partió desde la simpleza del formato estándar de HTML. Además, tenemos la posibilidad de sumar funcionalidad utilizando gran parte de la sintaxis HTML dentro de los propios documentos con Markdown. Ahora bien, la sintaxis HTML no está definida claramente dentro del estándar de Markdown, por lo cual no todos los rederizadores lo interpretan correctamente (_ó directamente no lo interpretan_).

Si bien no vamos a repasar ejemplos de esta tecnología en el presente documento, es importante saber que contamos con esta posibilidad y así poder investigar más del tema. Esto nos daría la versatilidad de poder aplicarlo cuando fuera necesario o nos topemos con documentos editados de esta manera.

También soporta parte del estándar CSS dentro del mismo documento, o vinculando también estilos con archivos externos `css`, pero aquí la limitación es aún mas grande que con HTML, y consecuentemente se recomienda su uso en casos muy particulares.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)