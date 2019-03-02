[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido del documento</summary>
    <a href="#Sintaxis-documental-con-Markdown"><strong>Sintaxis documental con Markdown</strong></a><br>
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
## Generacion de Títulos
Todo título o subtítulo debe comenzar con símbolo de numeral "#". 

_Ejemplo:_ 

        # Titulo formato grande
        ## Sub titulo formato mediano
        ### Sub titulo formato pequeño

# Titulo formato grande
## Sub titulo formato mediano
### Sub titulo formato pequeño


## Escritura normal

Como cualquier editor de texto, la escritura es libre, con la posibilidad de darle un formato. Esto se explicara luego con otros ejemplos. 

## Salto de linea

Los salto de linea se generar con guiones medios.

_Ejemplo:_

        -----
-----

## Formato de texto

Tenemos la posibilidad de darle formato a los textos que agregamos. Cursiva, Negrita, Tachado

* __Cursiva:__ Se genera colocando GUION BAJO (_) al comienzo y al final de la palabra u oración. 
* __Negrita:__ Se genera colocando DOBLE GUION BAJO (__) al comienzo y al final de la palabra u oración. 
* __Tachado:__ Se genera colocando DOBLE SIMBOLO ~ al comienzo y al final de la palabra u oración. 

_Ejemplo:_

        * Cursiva: _Oracion en cursiva, no se tiene que dejar espacio al inicio y final de la palaba y oración._
        * Negrita: __Oracion en negrita, no se tiene que dejar espacio al inicio y final de la palaba y oración.__
        * Tachado: ~~Oracion tachada, no se tiene que dejar espacio al inicio y final de la palaba y oración.~~

  * Cursiva: _Oracion en cursiva, no se tiene que dejar espacio al inicio y final de la palaba y oración._
  * Negrita: __Oracion en negrita, no se tiene que dejar espacio al inicio y final de la palaba y oración.__
  * Tachado: ~~Oracion tachada, no se tiene que dejar espacio al inicio y final de la palaba y oración.~~


## Viñetas y Numeración

Tenemos las posibilidad de generar un listado con viñetas o numerado. 
Las viñetas se generan con * seguidos uno debajo de otro. 
La numeración se genera siempre con el número 1., la numeracion se genera automaticamente. 

_Ejemplo:_ 

    * Agregar una viñeta con un astericos al principio. 
    * Ejemplos segunda linea de viñeta.
    * Ejemplo tercera linea de viñeta.

    1. Agrega una viñeta numerada con el numero 1.
    1. Ejemplo segunda linea viñeta numerada.
    1. Ejemplo tercera linea viñeta numerada. 

* Agregar una viñeta con un astericos al principio. 
* Ejemplos segunda linea de viñeta.
* Ejemplo tercera linea de viñeta.

1. Agrega una viñeta numerada con el numero 1.
1. Ejemplo segunda linea viñeta numerada.
1. Ejemplo tercera linea viñeta numerada. 


### Sub Listas

_Ejemplo:_

        * Viñetas común.
            1. Prueba dentro de viñeta.
            1. Prueba dentro de viñeta dos.
            1. Prueba dentro de viñeta tres. 

* Viñetas común.
    1. Prueba dentro de viñeta.
    1. Prueba dentro de viñeta dos.
    1. Prueba dentro de viñeta tres. 

## Comentarios

 La generación de comentario comienza con el signo ">" al inicio. 

        > Esto es un ejemplo de generación de comentarios dentro de Markdown 

> Esto es un ejemplo de generación de comentarios dentro de Markdown

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

[🡡 volver al inicio](#Sintaxis-documental-con-Markdown)