[Tabla de Contenidos](docs/SUMMARY.md)

# Práctica documental con Markdown en GitHub

:wave: Bienvenidos al repositorio de práctica documental con Markdown y GitHub. 

Este repositorio tiene como objetivo servir de guía de configuración del entorno de trabajo con Markdown y GitHub, que incluye instructivos y lecciones para practicar con ambas tecnologías. :wink:
## 1. Configuración del entorno de trabajo
Vamos a comenzar configurando el entorno de trabajo, el cual dependerá del Sistema Operativo y de las aplicaciones elegidas a nivel personal, según se describe en la [Guía de configuración del entorno de trabajo](docs/WORKSPACE.md).

Posteriormente a la configuración del entorno de trabajo, es recomendable operar bajo un marco de seguridad entre nuestra PC y GitHub/GitLab, contando con una [Conexión SSH con GitHub](docs/SSH.md) y verificando los cambios [Guardando `commit` firmados](docs/GPG.md).
## 2. Implementación del repositorio en el entorno local
Una vez configurado el entorno de trabajo, necesitaremos comprender el funcionamiento del repositorio acuerdo a la guía de [Los tres estados de Git](docs/GIT.md). Ni bien adoptemos su flujo de trabajo, ya podremos descargar una copia sincronizada del repositorio (_copia distribuida_) conectado por SSH con el siguiente comando:
```git
git clone git@github.com:novocap/markdown-documentation.git
```
Otra forma de contar con una copia sincronizada del repositorio, es creando un directorio local (_se recomienda utilizar el mismo nombre del repositorio en GitHub_), efectuando los siguientes comandos:
```git
git init markdown-documentation
git remote add origin git@github.com:novocap/markdown-documentation.git
git pull origin master
```
[🡡 volver al inicio](README.md#Práctica-documental-con-Markdown-en-GitHub)