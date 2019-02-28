[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

# __Sintaxis MarkDown__

>En este documento se explica con ejemplos las diferentes sintaxis dentro de MarkDown.  

## __Generacion de Titulos__
Todo título o subtítulo debe comenzar con símbolo de numeral "#". Ejemplos: 

# Titulo formato grande
## Sub titulo formato mediano
### Sub titulo formato pequeño

## __Escritura normal__

Como cualquier editor de texto, la escritura es libre, con la posibilidad de darle un formato, esto se explicara luego con otros ejemplos. 


## __Salto de linea__

Los salto de linea se generar con guiones medios. Ejemplo:

-----

## __Formato de texto__

Tenemos la posibilidad de darle formato a los textos que agregamos. Cursiva, Negrita, Tachado

* Cursiva -->  _UN GUION BAJO, AL INICIO Y AL FINAL: CURSIVA_
* Negrita -->  __DOBLE GUION BAJO, AL INICIO Y AL FINAL: NEGRITA__
* Tachado --> Doble ~ al inicio y al final: ~~Ejemplo tachado~~ 

## __Viñetas y Numeración__

Tenemos las posibilidad de generar un listado con viñetas o numerado. 
Las viñetas se generan con * seguidos uno debajo de otro. La numeración se genera siempre con el número 1., la numeracion se genera automaticamente. 
Ejemplos: 

* Agregar una viñeta con un astericos al principio. 
* Ejemplos segunda linea de viñeta.
* Ejemplo tercera linea de viñeta.

1. Agrega una viñeta numerada con el numero 1.
1. Ejemplo segunda linea viñeta numerada.
1. Ejemplo tercera linea viñeta numerada. creo que me voy a pedir el dia de cu
creo que me voy a pedir el dia de cu
### __Sub Listas__creo que me voy a pedir el dia de cu
creo que me voy a pedir el dia de cu
* Viñetas común.creo que me voy a pedir el dia de cu
    1. Prueba dentro de viñeta.creo que me voy a pedir el dia de cu
    1. Prueba dentro de viñeta dos.creo que me voy a pedir el dia de cu
    1. Prueba dentro de viñeta tres. creo que me voy a pedir el dia de cu
creo que me voy a pedir el dia de cu
## __Comentarios__creo que me voy a pedir el dia de cu
creo que me voy a pedir el dia de cu
> La generación de comentario comienza con el signo ">" al creo que me voy a pedir el dia de cuinicio. 

## __Generacion de tablas__

Tenemos la posibilidad de generar tablas dentro de MarkDown, tenemos que tener en cuenta que el tamaño de cada columna varia segun el texto que este contenga. Ejemplo:

* Las columnas se generan con "|"
* Las filas se generan con "-"

ColumnaA | ColumnaB | ColumnaC
---------|----------|----------
Fila1A   | Fila1B   | Fila1C
Fila2A   | Fila2B   | Fila2C

## __Insertar Imagenes__

Dentro de un documento Markdown, se puede insertar imagenes. Siempre tienen que estar dentro del proyecto, para poder referenciarlo en la linea:

> "![Descripcion](path Imagen)"

![ImagenDePrueba](../img/professortocat.png)

## __Hipervínculos__

Dentro de un documento Markdown, se puede insertar hipervinculos hacia paginas Web.

>Agregar hipervinculo a un URL: "[Descripcion](_Direccion URL_)"

[Novocap](https://www.novocap.com)

Dentro de un documento Markdown, se puede insertar hipervinculos hacia otros ducumentos que esten en el mismo proyecto.

>Agregar hipervinculo a otro documento: "[Descripcion](_Path Docuumento_)"

[Documento Referencia](SUMMARY.md)


## __Alineación de columnas en tablas__

Dentro de las tablas, tenemos la posibilidad de darle formato a la alineacion de cada columna. El mismo se configura en la segunda linea, luego de la generación del encabezado. 
* Alineacion derecha    --> -----:
* Alineacion izquierda  --> :-----
* Alineacion centrada   --> :----:

_Ejemplo:_

| Syntax      | Description | Test Text     |
| ---------:  | ----------: | :----------:  |
| Header      | Title       | Here's this   |
| Paragraph   | Text        | And more      |

## __Comentarios tipo codigo__ 

Se puede generar comentarios con formato de codigo. el mismo tienen que estar contenido dento de ``` con la descripcioni del tipo lenguaje que estamos insertando. Ejemplo:  

```sql
SELECT A.nombre, 
       A.numerodocumento, 
       B.descripcion 
FROM   nombretabla1 AS A 
       JOIN nombretabla2 AS B 
         ON A.campo_id = B.campo_id 
WHERE  A.numero = 1 
```