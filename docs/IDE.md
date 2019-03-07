[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido</summary>
    <a href="#Elección-del-IDE"><strong>Elección del IDE</strong></a><br>
    <a href="#Visual-Studio-Code">· Visual Studio Code</a><br>
</details>

# Elección del IDE
Indistintamente del proyecto que trabajemos, será necesario definir un marco de trabajo analizando las diferentes alternativas que tengamos para hacerlo. Antes de comenzar es importante tomarse el debido tiempo de análisis para evaluar las ventajas y desventajas de cada modelo, para que tengamos claro que podremos hacer y que no con la opción que definamos.

En el caso de Git, ya hemos configurado desde el terminal o línea de comandos su parametrización inicial de forma local, y también nos conectamos de manera segura con nuestros repositorios remotos en GitHub/GitLab. De esta manera hemos configurado nuestro entorno de trabajo de manera centralizada y distribuida con Git.

Para trabajar con un proyecto documental usando la tecnología de Markdown, lo podemos realizar simplemente desde un editor de texto plano y desde comandos desde el terminal. La variedad de editores de texto que contamos hoy día es vasta, y las interfaces de uso son simples, funcionales y de buen rendimiento por el bajo consumo de recursos.

Además de este escenario del editor de texto sumado a la terminal de línea de comandos, tenemos la posibilidad de contar con [Entornos de Desarrollo Integrados IDE](https://es.wikipedia.org/wiki/Entorno_de_desarrollo_integrado) que tienen incorporadas todas estas funcionalidades en una misma herramienta, sumado a otras opciones que pueden resultarnos últiles en el día a día.
> También contamos con editores de texto plano desarrollados hace muchos años atrás, que fueron confeccionados para la interfaz de línea de comandos. De todas maneras siguen siendo muy utilizandos incluso hoy día por su rendimiento y productividad. Pueden investigar sobre el uso de complementos con las aplicaciones de consola de Emacs y Vim, y lograr entornos IDE muy potentes y eficientes (_sobretodo sin levantar la mano del teclado para interactuar con ellos, y así puedes deshacerte directamente del períferico del mouse :scream:_).

![Vim con plugins](../img/vim-with-plugins.gif)
>__Imagen 1__: _Editor de consola Vim con complementos logrando un interfaz similar a los IDE's actuales._

Actualmente contamos con una infinidad de opciones de IDE's en el mercado, y debemos evaluar una opción u otra dependeniendo del lenguaje y del proyecto que vamos a realizar; por lo cual, en el caso que definamos trabajar con un IDE para documentar con Markdown, será necesario analizar que opciones existentes trabajan con esta tecnología, filtrando por aquellos que se integran con Git y permitan conectarse con GitHub. En las próximas secciones del documento iremos viendo algunas alternativas que recomendamos, aunque igualmente la elección dependerá del gusto de cada uno.

[🡡 volver al inicio](#Elección-del-IDE)
## Visual Studio Code
[Visual Studio Code](https://code.visualstudio.com/) es un producto desarrollado por Microsoft, siendo uno de los IDE más utilizados hoy día por la comunidad de desarrollo, teniendo en cuenta su integridad con gran cantidad de lenguajes, frameworks y utilidades, además de ser de uso gratuito bajo un desarrollo de software libre; mantenido con una perioricidad de actualización de versiones finales prácticamente mensuales, y además es multiplataforma tanto para sistemas Linux, Windows y MacOS.

Por defecto este editor tiene una alta integración con la instalación local de Git, además de contar con una previsualización en vivo para editar documentos en Markdown, contando con extensiones para comunicarnos directamente con varias funciones de GitHub, por lo cual lo hace uno de las mejores opciones para comenzar con proyectos de esta índole.

### Descarga de la aplicación<!-- omit in toc -->
Para descargarnos una copia nos dirigimos al su sitio de [descargas](https://code.visualstudio.com/#alt-downloads) y elegimos el sistema operativo que usamos. Podremos notar que su instalador no es de gran tamaño y no necesita de grandes [requerimientos](https://code.visualstudio.com/docs/supporting/requirements) para poder operar con él.

![Descarga de Visual Studio Code](../img/vscode-download.png)
> __Imagen 2__: _Descarga de Visual Studio Code para diferentes sistemas operativos._

[🡡 volver al inicio](#Elección-del-IDE)
### Instalación e interfaz de la solución<!-- omit in toc -->
Las opciones de descarga de Visual Studio Code en su sitio público, son opciones auto-instalables por medio de los correspondientes administradores de paquetes de instalación de cada sistema operativo, por lo cual no tendremos inconvenientes durante su instalación prácticamente guíada.

También contamos con la posibilidad de descargarnos el código de desarrollo libre de la propia aplicación alojada en el [repositorio de Visual Studio Code en GitHub](https://github.com/Microsoft/vscode) y seguir los pasos para compilarlo en nuestras PC y poder utilizarlo a partir del ensamblado creado. Esta opción solo es recomendable si queremos aprovechar las nuevas funcionalidades y correcciones que salen a diario, aunque con poco testeo de las mismas, o en el caso que directamente queramos contribuir con el desarrollo de la solución.

Una vez instalado, ubicamos el acceso directo a la aplicacion y al inciarla nos dará la bienvenida como se muestra a continuación:

![Bienvenida VSCode](../img/vscode-welcome.png)
> __Imagen 3__: _Bienvenida de Visual Studio Code versión 1.31.1_

Como vemos en la imagen, tenemos una barra de menú superior con una gran cantidad de opciones, y sobre el lateral izquierdo tendremos acceso a las siguientes opciones:

![Explorador](../img/vscode-folders.png) __Explorador__: En esta sección podremos seleccionar y trabajar con nuestro arbol de archivos abriendo un directorio, o también podemos abrir un archivo directamente sin el contenedor del directorio. También nos mostrará que archivos tenemos abiertos o estamos trabajando, además de aquellos que tenemos abiertos con un previsualizador (_este tema lo abordaremos más adelante_). Más abajo tenemos otra opción llamada entorno que nos brindará accesos rápidos a las secciones de nuestro código en la ventana que estemos trabajando.

![Buscador](../img/vscode-search.png) __Buscador__: Aquí nos encontraremos con un potente buscador de bloques de código en todos los archivos contenidos en la sección del Explorador, el cual también nos dará la posibilidad de reemplazar sus valores. Cuando presionamos sobre un valor encontrado, nos posiciona directamente en el archivo y en la línea que marcamos, lo cual nos puede servir de mucha ayuda en más de una ocasión.

![Git](../img/vscode-source-control.png) __Control de Fuente__: Aquí nos encontraremos con una interfaz gráfica integrada con nuestra instalación de Git local, y nos permitirá ahorrarnos del uso de los comandos de consola de Git si así lo quisiéramos. Es excelente para ver diferencias que fuimos o estemos editando, así como también de mantenernos sincronizados con nuestro repositorio remoto en GitHub/GitLab. Sólo funciona si tenemos instalado Git en nuestra PC, y el directorio abierto en la sección del explorador tiene control de versión con Git.

![Depurador](../img/vscode-debugger.png) __Depurador__: El depurador es una herramienta muy potente para inspeccionar la ejecución de nuestras líneas de código durante su ciclo de vida. Es muy útil para poder analizar o encontrar problemas. No tendremos uso si nos manejamos con repositorios documentales, aunque dependerá igualmente de las funcionalidades que le agreguemos a nuestros repositorios.

![Extensiones](../img/vscode-extensions.png) __Extensiones__: Esta sección es muy interesante, la cual nos permitirá agregar funcionalidades, trabajar con otros lenguajes, instalar frameworks, entre otras opciones de forma rápida y ágil como si fuera una tienda de aplicaciones. Seguramente nos será de mucha utilidad y podremos sacarle mucho jgo a este IDE.
> Al presionar una vez mas sobre la sección en que estamos en la barra lateral derecha, esta se ocultará y nos dará un espacio más amplio de trabajo.

Debajo de todas estas opciones nos encontraremos con una rueda dentada, la cual nos dará acceso a un menú flotante de parametrización de la propia plataforma.

![Configuración](../img/vscode-config.png)
> __Imagen 4__: _Sección de Configuración de Visual Studio Code._

Más adelante accederemos a varias de estas opciones para configurar la aplicación para dejar listo nuestro entorno de trabajo.

La interfaz de la aplicación también nos brindará una barra de estado con información muy útil sobre nuestro marco de trabajo en ese momento:

![Barra de estado](../img/vscode-state-bar.png)
> __Imagen 5__: _Barra de estado de Visual Studio Code._

Por ejemplo, si contramos con control de versión con Git nos mostrará en que rama estamos trabajando, sumado a un estado de cambios en comparación con nuestro repositorio remoto, así como también con botones para sincronizarlos. También nos identificará la cantidad de errores y advertencias en el código, en que línea y columna estamos editando, el tipo de codificación del texto, entre otras opciones que también podrán aparecer dependiendo de las extensiones que instalemos en él.

[🡡 volver al inicio](#Elección-del-IDE)
### Configuración del Terminal Integrado<!-- omit in toc -->
<!--
```json
// Command Prompt
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe"
// PowerShell
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
// Git Bash
"terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe"
// Bash on Ubuntu (on Windows)
"terminal.integrated.shell.windows": "C:\\Windows\\System32\\bash.exe"
```

```git
git config --global core.editor "code"
```
-->