# Entorno de trabajo

Antes de empezar a trabajar con Git, vamos a dejar el entorno listo. En
este capítulo instalamos el binario, configuramos la identidad y
verificamos que todo funcione.

## 1. Instalar Git

El primer paso es instalar el binario de Git en el sistema operativo
que uses. La forma más simple es descargar el instalador oficial desde
el [sitio de descargas](https://git-scm.com/download).

=== "Windows"

    1. Descargá el instalador `.exe` desde
       [git-scm.com/download/win](https://git-scm.com/download/win).
    2. Ejecutá el instalador. Las opciones por defecto son suficientes
       para la mayoría de los casos; prestá atención a estas dos:
       - **"Adjusting your PATH environment"**: dejá la opción
         *"Git from the command line and also from 3rd-party software"*.
         Esto hace que Git quede accesible desde `cmd`, PowerShell y
         otras terminales.
       - **"Choosing the default terminal editor"**: dejá *Vim* o
         cambiá a tu editor preferido.
    3. Al finalizar, abrí **Git Bash** desde el menú inicio. Es la
       terminal que vamos a usar en toda la guía para comandos Git en
       Windows.

=== "macOS"

    En macOS podés instalar Git de dos formas:

    - **Xcode Command Line Tools** (incluye Git):

      ```bash
      xcode-select --install
      ```

    - **Homebrew** (recomendado para mantener actualizado):

      ```bash
      brew install git
      ```

=== "Linux"

    En Debian/Ubuntu:

    ```bash
    sudo apt update
    sudo apt install git
    ```

    En Fedora:

    ```bash
    sudo dnf install git
    ```

    En Arch:

    ```bash
    sudo pacman -S git
    ```

!!! tip "Usuarios de Windows: Git Bash no es WSL"
    **Git Bash** es una capa mínima que trae Git para Windows y un
    shell estilo Unix (basado en MSYS2). No es lo mismo que
    [WSL](https://learn.microsoft.com/en-us/windows/wsl/) (Windows
    Subsystem for Linux). Si ya usás WSL, podés instalar Git dentro
    de tu distro Linux como en cualquier sistema Unix.

## 2. Verificar la instalación

Una vez instalado, abrí tu terminal y comprobá la versión:

```bash
git --version
```

Deberías ver algo como:

```text
git version 2.43.0
```

Si el comando no se reconoce, revisá que el PATH incluya el directorio
de instalación de Git (en Windows suele ser `C:\Program Files\Git\cmd`).

## 3. Configurar la identidad

Git necesita saber quién sos para registrar la autoría de cada cambio.
Esta información se incluye en cada `commit` que hagas, así que
configurarla **una sola vez** es importante.

### Nombre y correo electrónico

```bash
git config --global user.name "Tu Nombre Apellido"
git config --global user.email "tu.correo@ejemplo.com"
```

!!! warning "Usá el mismo correo que en GitHub"
    Si querés que GitHub muestre tus commits como verificados y
    vinculados a tu perfil, el `user.email` tiene que coincidir con
    el correo de tu cuenta. Para múltiples correos, podés agregar
    aliases en GitHub desde
    [Settings → Emails](https://github.com/settings/emails).

### Editor por defecto

Git abre un editor cuando necesita que escribas un mensaje largo
(por ejemplo, en `git commit` sin `-m`). El default suele ser `vim`,
que no es amigable para principiantes. Te recomendamos cambiarlo.

=== "VS Code"

    ```bash
    git config --global core.editor "code --wait"
    ```

    Requiere tener instalada la [extensión `code` en el PATH](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).

=== "Sublime Text"

    ```bash
    git config --global core.editor "subl --wait"
    ```

=== "Nano"

    ```bash
    git config --global core.editor "nano"
    ```

=== "Vim (default)"

    No hace falta configurarlo; ya es el editor por defecto de Git.
    Si Vim te resulta ajeno, abrílo y tipeá `:q!` para salir sin
    guardar.

### Nombre de la rama por defecto

Desde Git 2.28 podés definir el nombre de la rama inicial cuando
creás un repositorio nuevo:

```bash
git config --global init.defaultBranch main
```

!!! info "¿`main` o `master`?"
    Históricamente Git usaba `master` como nombre por defecto, pero la
    comunidad se ha ido moviendo hacia `main` (más inclusivo).
    GitHub, GitLab y otras plataformas adoptaron `main` desde 2020.
    En esta guía usamos `main` en todos los ejemplos.

### Configuraciones útiles adicionales

```bash
# Sacar el resaltado de colores en terminales que lo soporten
git config --global color.ui auto

# Habilitar la autocorrección de comandos (te perdona typos comunes)
git config --global help.autocorrect 10

# Configurar la herramienta de diff por defecto
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
```

## 4. Verificar la configuración

Para ver todas las opciones que configuraste:

```bash
git config --global --list
```

Vas a ver algo como:

```text
user.name=Tu Nombre Apellido
user.email=tu.correo@ejemplo.com
core.editor=code --wait
init.defaultBranch=main
color.ui=auto
help.autocorrect=10
```

## 5. Tres niveles de configuración

Git soporta tres niveles de configuración. Es importante entender
cuándo usar cada uno:

| Nivel | Comando | Alcance | Archivo |
|---|---|---|---|
| `--local` (default) | `git config user.name "X"` | Solo este repositorio | `.git/config` |
| `--global` | `git config --global user.name "X"` | Tu usuario en este sistema | `~/.gitconfig` |
| `--system` | `git config --system user.name "X"` | Todos los usuarios (Linux/macOS) | `/etc/gitconfig` |

!!! tip "Ver desde dónde viene cada opción"
    `git config --show-origin --get user.name` te dice qué archivo
    provee cada valor. Es muy útil cuando una configuración no se
    comporta como esperás.

## Próximo paso

Con Git instalado y configurado, ya podés pasar a
[Conexión SSH con GitHub](ssh.md) para autenticarte de forma segura
contra tus repositorios remotos.
