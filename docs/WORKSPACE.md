[<- Inicio](../README.md)

[Tabla de Contenidos](SUMMARY.md)
# Guía de configuración del entorno de trabajo
Para comenzar, efectuaremos la parametrización mas simple del entorno de trabajo según se lista a continuación:
1. Editor de texto plano a elección.
1. Instalación del programa __Git__ según el sistema operativo elegido en la [página de descargas](https://git-scm.com/download).

Al finalizar la instalación de Git, se puede comprobar la correcta versión instalada ejecutando el siguiente comando:
```git
git --version
```
Como paso siguiente, es necesario configurar Git con la información del usuario:
El Nombre y Apellido del usuario con el siguiente comando:
```git
git config --global user.name "Nombre Apellido"
```
La dirección de correo electrónico del usuario (_se recomienda la misma dirección de correo del usuario de GitHub_) de la siguiente manera:
```git
git config --global user.email "username@domain.com"
```
Selección del editor por defecto para edición de mensajes de Git
```git
git config --global core.editor deepin-editor
```
Para ver las configuraciones globales de Git ya establecidas, se puede realizar de la siguiente forma:
```git
git config --list
```
[🡡 volver al inicio](WORKSPACE.md#Guía-de-configuración-del-entorno-de-trabajo)