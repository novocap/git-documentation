[<- Inicio](../README.md)

[Indice del Repositorio](SUMMARY.md)

<details>
    <summary>Tabla de contenido</summary>
    <a href="#Confirmación-de-cambios-firmados-en-Git"><strong>Confirmación de cambios firmados en Git</strong></a><br>
    <a href="#Descarga-de-herramienta-GPG">· Descarga de herramienta GPG</a><br>
</details>

# Confirmación de cambios firmados en Git
Hemos visto que para configurar el usuario y nuestra cuenta de correo en Git es verdaderamente muy simple. Entonces, ¿Qué sucedería si, por ejemplo, un usuario se configura una identidad no propia para guardar cambios en un determinado repositorio? Es evidente que de alguna manera u otra podría falsear la identidad de los cambios en el historial de versiones.

Para estos casos Git utiliza una herramienta de seguridad para firmar criptográficamente nuestras confirmaciones de cambios, validando y protegiendo nuestra identidad por Autor para tener un ambiente más seguro. Esta característica también es soportada por las plataformas de GitHub y GitLab, entre otras, y se puede observar el siguiente símbolo en cada `commit` realizado:

![GitHub commit verified](../img/github-commit-verified.png)
> __Imagen 1__: _Confirmaciones de cambio verificadas en GitHub._

[🡡 volver al inicio](#Confirmación-de-cambios-firmados-en-Git)
## Descarga de herramienta GPG
Podemos utilizar la herramienta para firmar las confirmaciones mediante el algoritmo GPG llamada GnuPG. En el caso de Windows será necesario descargar la alternativa [Gpg4Win](https://gpg4win.org/download.html) para contar con GnuGPG, mientras que el Linux lo podemos hacer ejecutando el siguiente comando:
```git
sudo apt-get install gpg -y
```
[🡡 volver al inicio](#Confirmación-de-cambios-firmados-en-Git)