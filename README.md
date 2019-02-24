[Tabla de Contenido](docs/SUMMARY.md)

# Práctica documental con Markdown en GitHub

:wave: Bienvenidos al repositorio de práctica documental con Markdown y GitHub. 

Este repositorio tiene como objetivo servir de guía de configuración del entorno de trabajo con Markdown y GitHub, que incluye instructivos y lecciones para practicar con ambas tecnologías. :wink:
## 1. Configuración del entorno de trabajo
Vamos a comenzar configurando el entorno de trabajo, el cual dependerá del Sistema Operativo y de las aplicaciones elegidas a nivel personal, según se describe en la [Guía de configuración de entorno de trabajo](docs/WORKSPACE.md).

Posteriormente a la configuración del entorno de trabajo, es recomendable operar bajo un marco de seguridad entre nuestra PC y GitHub/GitLab, contando con una [Conexión SSH con GitHub/GitLab](docs/SSH.md) y verificando los cambios [Guardando `commit` firmados](docs/GPG.md).
## 2. Configuración del directorio y repositorio local
Antes de empezar, es recomendable crear un directorio para alojar todos los repositorios con control de versión de código (_por ejemplo: `Repositorios/`_). A partir de allí nos ubicamos dentro del directorio, y descargamos una copia sincronizada del repositorio conectado por SSH con el siguiente comando:
```bash
git clone git@github.com:novocap/markdown-documentation.git
```
Otra forma de contar con una copia sincronizada del repositorio, es creando un directorio local (_se recomienda utilizar el mismo nombre del repositorio_), efectuando los siguientes comandos:
```bash
mkdir markdown-documentation
cd markdown-documentation
git init
git remote add origin git@github.com:novocap/markdown-documentation.git
git pull origin master
```