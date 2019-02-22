[<- Volver](../../../)
# Guía de configuración de entorno de trabajo
Para comenzar, efectuaremos la parametrización mas simple del entorno de trabajo según se lista a continuación:
1. Editor de texto plano a elección.
1. Instalación del programa __Git__ según el sistema operativo elegido en la [página de descargas](https://git-scm.com/download).

Al finalizar la instalación de Git, se puede comprobar la correcta versión instalada ejecutando el siguiente comando:
```git
git --version
```
Como paso siguiente, es necesario configurar el programa de Git con la información del usuario:
* Nombre y Apellido del usuario con el comando
```git
git config --global user.name "Nombre Apellido"
```
* Dirección de correo electrónico del usuario (se recomienda la misma dirección de correo del usuario de GitHub):
```git
git config --global user.email "username@domain.com"
```