# IDE con Visual Studio Code

Una vez que Git y GitHub están configurados, llega el momento de elegir
un editor que integre todo el flujo de trabajo en una sola ventana.
Hay muchas opciones excelentes:

- [Visual Studio Code](https://code.visualstudio.com/) (VS Code).
- [Neovim](https://neovim.io/) / [Vim](https://www.vim.org/) con
  plugins.
- [JetBrains IDEs](https://www.jetbrains.com/) (IntelliJ, PyCharm,
  WebStorm, etc.).
- [Sublime Text](https://www.sublimetext.com/).
- [Emacs](https://www.gnu.org/software/emacs/).

En esta guía usamos **VS Code** porque:

- Es **gratuito** y de código abierto.
- Tiene **integración nativa con Git** (no requiere plugins).
- Soporta **Markdown** con preview en vivo.
- Corre en **Windows, macOS y Linux**.
- Tiene un ecosistema enorme de extensiones.

!!! note "Si Vim es lo tuyo"
    Vim y Neovim siguen siendo herramientas de primera línea, sobre
    todo en servidores remotos y para gente que vive en la terminal.
    Hay configuraciones como
    [LazyVim](https://www.lazyvim.org/) o
    [AstroNvim](https://astronvim.com/) que los dejan como IDEs
    completos. Esta guía no los cubre, pero la elección es válida.

## 1. Instalación

=== "Windows"

    1. Descargá el instalador desde
       [code.visualstudio.com/Download](https://code.visualstudio.com/Download).
    2. Durante la instalación, tildá estas opciones:
       - **"Add to PATH"** (suma `code` al PATH para usarlo desde la
         terminal).
       - **"Add 'Open with Code' action"** (clic derecho en el
         Explorador).
    3. Al finalizar, abrí VS Code desde el menú inicio.

=== "macOS"

    Con Homebrew:

    ```bash
    brew install --cask visual-studio-code
    ```

    O descargá el `.dmg` desde el sitio oficial.

=== "Linux"

    Debian/Ubuntu:

    ```bash
    sudo apt install ./code_1.85.0-1702772538_amd64.deb
    ```

    Fedora:

    ```bash
    sudo dnf install code
    ```

    O desde la [página oficial](https://code.visualstudio.com/Download)
    (hay `.deb`, `.rpm` y tarball).

## 2. Configuración inicial

### Cambiar el shell por defecto

En Windows, la terminal integrada usa PowerShell por defecto. Para
usar Git Bash (más cómodo con comandos Unix):

1. Abrí la paleta de comandos con ++ctrl+shift+p++.
2. Escribí `Terminal: Select Default Profile`.
3. Elegí **Git Bash**.

En macOS y Linux, el shell del sistema ya es Unix y funciona sin
cambios.

### Tema

VS Code viene con temas claros y oscuros. Para cambiar:

1. ++ctrl+k++ seguido de ++ctrl+t++ (atajo directo).
2. Elegí entre los temas preinstalados o instalá uno nuevo (más
   abajo).

### Fuente

Para programadores, recomendamos una fuente con ligaduras tipo
*programming ligatures*:

1. Instalá [JetBrains Mono](https://www.jetbrains.com/lp/mono/) o
   [Fira Code](https://github.com/tonsky/FiraCode).
2. En VS Code: ++ctrl+comma++ (Settings).
3. Buscá `font family` y configurá `'JetBrains Mono Ligatures', monospace`.

## 3. Integración con Git

VS Code trae Git **integrado de fábrica**. Si tenés Git instalado en
el sistema, todo funciona sin instalar nada extra.

### Source Control panel

El ícono de **Source Control** (la rama de Git en la barra lateral
izquierda) abre un panel donde podés:

- Ver archivos modificados, agregados y eliminados.
- Hacer stage de cambios (botón `+` al lado de cada archivo).
- Escribir un mensaje de commit y confirmar.
- Push, pull, sync.
- Ver y resolver conflictos visualmente.

### Status bar

La barra de estado (abajo) muestra:

- La rama actual (ej. `main`, `feature/login`).
- Si hay cambios pendientes (`↓` para pull, `↑` para push, `⇅` para
  ambos).
- El número de warnings y errores del archivo abierto.

### Git Graph (extensión recomendada)

La extensión [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
agrega una visualización del historial de commits con colores por
rama. Es muy útil para entender merges y rebase.

## 4. Extensiones recomendadas

### Esenciales para Git/GitHub

| Extensión | Qué hace |
|---|---|
| [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) | Anota cada línea con autor y fecha del último commit. |
| [GitHub Actions](https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions) | Resaltado y validación de workflows YAML. |
| [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) | Revisá y aprobá PRs sin salir del editor. |

### Esenciales para Markdown

| Extensión | Qué hace |
|---|---|
| [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) | Atajos de teclado, TOC automático, preview mejorado. |
| [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) | Linter en tiempo real para Markdown. |
| [Mermaid](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid) | Preview nativo de diagramas Mermaid. |

### Esenciales para productividad

| Extensión | Qué hace |
|---|---|
| [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens) | Errores y warnings inline en el código. |
| [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager) | Maneja múltiples repositorios como proyectos. |
| [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) | Sincroniza tu configuración entre máquinas. |

!!! tip "Backup de tu configuración"
    En la nube, VS Code sincroniza automáticamente tu config si
    iniciás sesión con GitHub (icono de cuenta, abajo a la izquierda).
    Es la forma más simple de tener la misma experiencia en todos
    tus equipos.

## 5. Atajos de teclado productivos

Los atajos más útiles para el flujo de Git/Markdown:

| Acción | Windows / Linux | macOS |
|---|---|---|
| Paleta de comandos | ++ctrl+shift+p++ | ++cmd+shift+p++ |
| Quick open (buscar archivo) | ++ctrl+p++ | ++cmd+p++ |
| Settings | ++ctrl+comma++ | ++cmd+comma++ |
| Toggle terminal | ++ctrl+grave++ | ++ctrl+grave++ |
| Markdown preview | ++ctrl+k++ + ++v++ | ++cmd+k++ + ++v++ |
| Format document | ++shift+alt+f++ | ++shift+option+f++ |
| Multi-cursor | ++alt+click++ o ++ctrl+alt+down++ | ++option+click++ o ++cmd+option+down++ |
| Move line up/down | ++alt+up++ / ++alt+down++ | ++option+up++ / ++option+down++ |
| Comment line | ++ctrl+slash++ | ++cmd+slash++ |
| Go to definition | ++f12++ | ++f12++ |

!!! tip "Cheat sheet oficial"
    VS Code publica una
    [cheat sheet PDF](https://code.visualstudio.com/docs/getstarted/keybindings#_keyboard-shortcuts-reference)
    con todos los atajos. Imprimila y tenela a mano las primeras
    semanas.

## 6. Flujo de trabajo típico

Veamos un escenario real: estás editando documentación, querés
commiteart los cambios y abrir un PR.

### Editar archivos

1. Abrí la carpeta del proyecto (`File → Open Folder` o `code .` en
   terminal).
2. Navegá el árbol en la barra lateral.
3. Editá los archivos. El **panel de Source Control** muestra los
   archivos modificados en tiempo real.

### Revisar cambios antes de commitear

1. Hacé clic en un archivo modificado desde Source Control.
2. VS Code abre una **vista de diff** inline: las líneas agregadas
   en verde, las quitadas en rojo.
3. Verificá que los cambios sean correctos.

### Commitear

1. En Source Control, escribí el mensaje.
2. ++ctrl+enter++ para confirmar (o el botón ✓).
3. Si está activado `commit.gpgsign`, el commit se firma
   automáticamente (ver [Firma criptográfica con GPG](../git/gpg.md)).

### Push y Pull Request

1. Después de commitear, aparece un botón **"Sync Changes"** en la
   status bar.
2. Hacé clic y elegí **Push**.
3. Si instalaste la extensión *GitHub Pull Requests*, aparece un
   botón **"Create Pull Request"** que abre el editor web de GitHub
   con la rama ya seleccionada.

## 7. Settings útiles

Configurá estas opciones en `settings.json` (++ctrl+shift+p++ →
`Preferences: Open User Settings (JSON)`):

```json
{
    "editor.fontFamily": "'JetBrains Mono', 'Fira Code', monospace",
    "editor.fontLigatures": true,
    "editor.formatOnSave": true,
    "editor.tabSize": 2,
    "editor.minimap.enabled": false,
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.bracketPairs": true,
    "files.trimTrailingWhitespace": true,
    "files.insertFinalNewline": true,
    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    "terminal.integrated.fontFamily": "'JetBrains Mono', monospace",
    "markdown.preview.fontSize": 14,
    "markdownlint.config": {
        "MD013": false,
        "MD033": false
    }
}
```

!!! tip "Versiona tu settings.json"
    Guardá tu `settings.json` en un repositorio dotfiles o sincronizá
    con [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync).
    Así tenés la misma experiencia en cualquier máquina.

## Próximo paso

Con el IDE configurado, podés pasar a
[Sintaxis documental con Markdown](markdown.md) para aprender a
escribir el contenido de la documentación, o saltar a
[Práctica](../practice/index.md) para hacer ejercicios completos.
