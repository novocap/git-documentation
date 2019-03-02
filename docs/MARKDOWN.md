[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido del documento</summary>
    <a href="#Sintaxis-documental-con-Markdown"><strong>Sintaxis documental con Markdown</strong></a><br>
    <a href="#Encabezados-y-títulos">· Encabezados y títulos</a><br>
    <a href="#Párrafos-y-estilo-normal">· Párrafos y estilo normal</a><br>
    <a href="#Tipos-de-listas">· Tipos de listas</a><br>
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
Markdown gestiona de los encabezados y títulos en seis niveles de la misma forma que la sintaxis del _lenguaje de marcado en hypertexto_ de [HTML](https://es.wikipedia.org/wiki/HTML). A coniinuación podemos ver su sintaxis con la analogía de sus etiquetas en HTML:
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
## Generacion de tablas

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


## Insertar Imagenes

Dentro de un documento Markdown, se puede insertar imagenes. Siempre tienen que estar dentro del proyecto, para poder referenciarlo en la linea:

> ![Descripcion](path Imagen)

_Ejemplo:_ 

        ![ImagenDePrueba](../img/professortocat.png)

![ImagenDePrueba](../img/professortocat.png)

## Hipervínculos

Dentro de un documento Markdown, se puede insertar hipervinculos hacia paginas Web.

* Agregar hipervinculo a un URL: "[Descripcion](_Direccion URL_)"

_Ejemplo:_

        [GitHub](https://www.github.com)
[GitHub](https://www.github.com)

Dentro de un documento Markdown, se puede insertar hipervinculos hacia otros ducumentos que esten en el mismo proyecto.

* Agregar hipervinculo a otro documento: "[Descripcion](_Path Docuumento_)"

_Ejemplo:_

        [Documento Referencia](SUMMARY.md)
[Documento Referencia](SUMMARY.md)


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

## Sintaxis HTML y CSS en Markdown
Durante todo el documento estuvimos viendo la analogía de Markdown con HMTL, y por lo cierto, no fue un capricho. Esto sucede porque Markdown también puede interpretar sintaxis HTML, pero como no es un estándar definido dentro de Markdown, no todos los rederizadores lo interpretan correctamente, ó directamente no lo interpretan. Esta mezcla de sintaxis suele utilizarse cuando Markdown no nos alcanza para lo que queremos realizar, por lo que se hace uso de esta alternativa con HTML. Si bien no vamos a ver ejemplos del tema en esta sección, es importante tenerlo en cuenta e investigar del tema por si el día de mañana lo necesitemos o nos topemos con documentos de esta manera.

También soporta parte del estándar CSS dentro del documento o vinculando estilos con archivos externos `css`, pero aquí la limitación es aún mas grande que con HTML, y sólo se recomienda su uso en casos muy particulares.

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)