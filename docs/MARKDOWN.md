[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

# __Sintaxis MarkDown__

Markdown es un lenguaje de marcado que facilita la aplicación de formato a un texto empleando una serie de caracteres de una forma especial. 
Este tipo de formato siempre será compatible con todas las plataformas que utilices, así que utilizar Markdown es una manera de mantener todo tu contenido siempre accesible desde cualquier dispositivo (smartphones, computadoras personales, tablets…), ya que en cualquiera de ellas siempre encontrarás las aplicaciones adecuadas para leer y editar este tipo de contenido.
En este documento se explicara con ejemplos las diferentes sintaxis dentro de MarkDown.  

## __Generacion de Titulos__
Todo título o subtítulo debe comenzar con símbolo de numeral "#". 

_Ejemplo:_ 

        # Titulo formato grande
        ## Sub titulo formato mediano
        ### Sub titulo formato pequeño

# Titulo formato grande
## Sub titulo formato mediano
### Sub titulo formato pequeño


## __Escritura normal__

Como cualquier editor de texto, la escritura es libre, con la posibilidad de darle un formato. Esto se explicara luego con otros ejemplos. 

## __Salto de linea__

Los salto de linea se generar con guiones medios.

_Ejemplo:_

        -----
-----

## __Formato de texto__

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


## __Viñetas y Numeración__

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


### __Sub Listas__

_Ejemplo:_

        * Viñetas común.
            1. Prueba dentro de viñeta.
            1. Prueba dentro de viñeta dos.
            1. Prueba dentro de viñeta tres. 

* Viñetas común.
    1. Prueba dentro de viñeta.
    1. Prueba dentro de viñeta dos.
    1. Prueba dentro de viñeta tres. 

## __Comentarios__

 La generación de comentario comienza con el signo ">" al inicio. 

        > Esto es un ejemplo de generación de comentarios dentro de Markdown 

> Esto es un ejemplo de generación de comentarios dentro de Markdown

## __Generacion de tablas__

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


## __Insertar Imagenes__

Dentro de un documento Markdown, se puede insertar imagenes. Siempre tienen que estar dentro del proyecto, para poder referenciarlo en la linea:

> ![Descripcion](path Imagen)

_Ejemplo:_ 

        ![ImagenDePrueba](../img/professortocat.png)

![ImagenDePrueba](../img/professortocat.png)

## __Hipervínculos__

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


## __Alineación de columnas en tablas__

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


## __Comentarios tipo codigo__ 

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