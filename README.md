# Práctica documental en Markdown
:wave: Bienvenidos al repositorio de práctica documental con Markdown en GitHub para el Team [@novocap/novocap-documentation](https://github.com/orgs/novocap/teams/novocap-documentation).

Esta documentación tiene como objetivo servir de guía de configuración del entorno, además de contar una capacitación y realizar prácticas de prueba con Git y Markdown, para incorporar los conceptos del flujo de trabajo en GitHub en un ambiente documental y/o de desarrollo de software. 
## 1. Configuración del entorno de trabajo
Vamos a comenzar configurando el entorno de trabajo, el cual dependerá del Sistema Operativo y de las aplicaciones elegidas a nivel personal, según se describe en la [Guía de configuración de entorno de trabajo](docs/WORKSPACE.md).
## 2. Configuración del directorio y repositorio local
Antes de empezar, es recomendable crear un directorio para alojar todos los repositorios con control de versión de código. A partir de allí nos ubicamos dentro del directorio, y descargamos una copia sincronizada del repositorio conectado por SSH con el siguiente comando:
```git
git clone git@github.com:novocap/practice-markdown-documentation.git
```
Otra forma de contar con una copia sincronizada del repositorio, es creando un directorio local (_se recomienda utilizar el mismo nombre del repositorio_), efectuando los siguientes comandos:
```git
cd practice-markdown-documentation
git init
git remote add origin git@github.com:novocap/practice-markdown-documentation.git
git pull origin master
```