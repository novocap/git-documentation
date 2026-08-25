# Conexión SSH con GitHub

Para autenticarte contra [GitHub](https://github.com) (o
[GitLab](https://gitlab.com) y [Bitbucket](https://bitbucket.org))
podés usar dos mecanismos:

- **HTTPS** con usuario/contraseña o Personal Access Token (PAT).
- **SSH** con un par de llaves pública/privada.

En esta guía usamos **SSH** porque:

- Evita tipear credenciales en cada `push`/`pull`.
- Permite múltiples identidades en la misma máquina.
- Es estándar de la industria y funciona en cualquier servidor.

!!! warning "Cuidado con equipos compartidos"
    Generá llaves SSH **solo en equipos de tu confianza**. En
    cibercafés, PCs de hoteles o redes públicas, preferí HTTPS con
    PAT rotativo o autenticación de un solo uso.

## 1. Por qué Ed25519

Hay varios algoritmos para generar llaves SSH. Recomendamos
**Ed25519** porque:

- Es más rápido que RSA.
- Las llaves son más cortas (más cómodas de manejar).
- Tiene mejor resistencia a algoritmos de factorización cuántica.

!!! info "Compatibilidad"
    Ed25519 está soportado por GitHub desde 2017, OpenSSH desde
    6.5 (2014) y PuTTY desde 0.68 (2017). Si necesitás compatibilidad
    con sistemas muy antiguos, podés usar RSA 4096, pero Ed25519 es
    la opción moderna.

## 2. Generar la llave SSH

Abrí tu terminal y ejecutá:

```bash
ssh-keygen -t ed25519 -C "tu.correo@ejemplo.com"
```

Git responde:

```text
Generating public/private ed25519 key pair.
Enter a file in which to save the key (~/.ssh/id_ed25519): [Enter]
```

Apretá **Enter** para usar la ubicación por defecto. Si ya tenés una
llave en esa ubicación, **no la sobreescribas**: usá un nombre
distinto (por ejemplo `~/.ssh/id_ed25519_github`).

Después te pide una passphrase:

```text
Enter passphrase (empty for no passphrase): [tu passphrase]
Enter same passphrase again: [repetila]
```

!!! tip "Passphrase, no contraseña"
    Una passphrase en blanco permite usar la llave sin desbloquearla,
    pero si alguien accede a tu archivo puede impersonarte. Con
    passphrase, cada uso requiere que la ingreses (o que el
    `ssh-agent` la desbloquee una vez por sesión).

!!! warning "Si ya tenés una llave SSH activa"
    Antes de generar una nueva, listá las que ya existen:

    ```bash
    ls -la ~/.ssh
    ```

    Si tenés un `id_ed25519` o `id_rsa` que recordás que está
    cargada en GitHub, podés saltearte esta sección y pasar a la
    siguiente.

## 3. Agregar la llave al ssh-agent

El `ssh-agent` es un proceso en segundo plano que guarda las llaves
desbloqueadas mientras dura tu sesión. Para que tu llave funcione
"automágicamente", hay que:

=== "macOS"

    macOS trae un `ssh-agent` integrado. Solo agregá la llave:

    ```bash
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    ```

    El flag `--apple-use-keychain` guarda la passphrase en el
    **Keychain** del sistema, así no te la pide en cada uso.

=== "Linux"

    Iniciá el agente y agregá la llave:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

    Para que el agente se inicie automáticamente al abrir la
    terminal, agregá esas líneas a tu `~/.bashrc` o `~/.zshrc`.

=== "Windows (Git Bash)"

    Iniciá el agente:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

    Para que Git Bash encuentre el agente en sesiones futuras, agregá
    esas líneas a tu `~/.bashrc`.

!!! tip "Verificar las llaves cargadas"
    En cualquier sistema:

    ```bash
    ssh-add -l
    ```

    Lista todas las llaves que el agente tiene desbloqueadas.

## 4. Subir la llave pública a GitHub

Primero copiá el contenido de tu **llave pública** (no la privada):

=== "macOS"

    ```bash
    pbcopy < ~/.ssh/id_ed25519.pub
    ```

=== "Linux"

    ```bash
    xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    ```

    Si no tenés `xclip`:

    ```bash
    sudo apt install xclip
    ```

=== "Windows (Git Bash)"

    ```bash
    clip < ~/.ssh/id_ed25519.pub
    ```

=== "Cualquier sistema"

    Si preferís no usar el portapapeles, abrí el archivo en tu
    editor y copiá todo el contenido (incluyendo el comentario
    `tu.correo@ejemplo.com` al final).

Después andá a GitHub:

1. Entrá a [github.com/settings/ssh/new](https://github.com/settings/ssh/new).
2. **Title**: un nombre descriptivo (por ejemplo "MacBook Pro personal",
   "PC oficina").
3. **Key type**: *Authentication Key*.
4. **Key**: pegá el contenido de tu llave pública.
5. Clic en **Add SSH key**.
6. Si te pide confirmar, ingresá tu contraseña de GitHub.

!!! warning "Limpiá el portapapeles"
    Después de pegar la llave pública en GitHub, copiá cualquier
    otro texto al portapapeles para evitar que la llave quede
    expuesta si pegás accidentalmente en otro lado.

## 5. Probar la conexión

Para verificar que todo funciona:

```bash
ssh -T git@github.com
```

La primera vez que te conectás al servidor, Git te pregunta si
confiás en el fingerprint del host:

```text
The authenticity of host 'github.com (140.82.121.4)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Tipeá `yes`. Si está todo bien, vas a ver:

```text
Hi <tu-usuario>! You've successfully authenticated, but GitHub does not provide shell access.
```

!!! tip "El warning de shell access es normal"
    GitHub te autenticó pero no te da acceso por SSH al servidor
    (no es un servidor interactivo). El mensaje es parte del flujo
    correcto.

Si ves `Permission denied (publickey)`, volvé a las secciones
anteriores y verificá que:

- El archivo en `~/.ssh/` es el **público** (termina en `.pub`).
- Lo subiste a GitHub correctamente.
- El `ssh-agent` tiene la llave privada cargada (`ssh-add -l`).

## 6. Cambiar de HTTPS a SSH

Si ya tenés repositorios clonados por HTTPS y querés pasarlos a SSH,
solo cambiá el remote:

```bash
git remote set-url origin git@github.com:novocap/git-documentation.git
```

Para verificar:

```bash
git remote -v
```

Deberías ver:

```text
origin  git@github.com:novocap/git-documentation.git (fetch)
origin  git@github.com:novocap/git-documentation.git (push)
```

## 7. Múltiples cuentas (avanzado)

Si necesitás identificarte con llaves distintas contra la misma
plataforma (por ejemplo, tu cuenta personal y la de tu empresa),
configurás un bloque en `~/.ssh/config`:

```sshconfig
# Cuenta personal
Host github.com-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Cuenta empresa
Host github.com-empresa
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_empresa
```

Después, en el repositorio:

```bash
git remote set-url origin git@github.com-personal:tu-usuario/proyecto.git
```

!!! tip "`IncludeIf` para config condicional"
    Si trabajás con muchos repositorios distintos, podés usar
    `IncludeIf` para cargar configs diferentes según el directorio.
    Más info en la [documentación oficial de OpenSSH](https://man.openbsd.org/ssh_config#IncludeIf).

## Próximo paso

Con SSH configurado, ya podés pasar a
[Fundamentos de Git y GitHub](git/index.md) para aprender el flujo
de trabajo con `git add`, `git commit`, ramas y Pull Requests.
