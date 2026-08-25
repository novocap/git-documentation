# Práctica

Esta sección contiene ejercicios paso a paso. Cada uno es
**autocontenido**: podés seguirlos en orden o saltar al que te
interese.

!!! tip "Antes de empezar"
    Asegurate de tener Git instalado y configurado como vimos en
    [Entorno de trabajo](../workspace.md), y la conexión SSH con
    GitHub lista según [Conexión SSH](../ssh.md).

## Ejercicio 1 · Primer commit

**Objetivo**: crear un repositorio local, hacer un cambio y
confirmarlo. **Duración estimada**: 10 minutos.

### Paso 1 · Crear la carpeta

```bash
mkdir mi-primer-repo
cd mi-primer-repo
```

### Paso 2 · Inicializar Git

```bash
git init
```

Deberías ver:

```text
Initialized empty Git repository in /ruta/a/mi-primer-repo/.git/
```

### Paso 3 · Configurar la rama por defecto (opcional)

Si todavía no configuraste `init.defaultBranch=main` globalmente:

```bash
git checkout -b main
```

### Paso 4 · Crear un archivo

```bash
echo "# Mi primer repo" > README.md
```

### Paso 5 · Ver el estado

```bash
git status
```

Verás:

```text
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
```

### Paso 6 · Agregar al staging

```bash
git add README.md
git status
```

```text
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   README.md
```

### Paso 7 · Hacer el primer commit

```bash
git commit -m ":sparkles: Crear README inicial"
```

!!! success "Resultado esperado"
    ```text
    [main (root-commit) abc1234] :sparkles: Crear README inicial
     1 file changed, 1 insertion(+)
     create mode 100644 README.md
    ```

### Paso 8 · Ver el historial

```bash
git log --oneline
```

Vas a ver tu primer commit con su hash corto.

---

## Ejercicio 2 · Resolver un conflicto

**Objetivo**: simular un conflicto de merge y resolverlo a mano.
**Duración estimada**: 15 minutos.

### Paso 1 · Preparar el repositorio

```bash
mkdir conflicto-demo && cd conflicto-demo
git init && git checkout -b main
echo "Línea 1" > saludo.txt
echo "Línea 2" >> saludo.txt
git add saludo.txt
git commit -m ":sparkles: Versión inicial de saludo"
```

### Paso 2 · Crear una rama con cambio

```bash
git switch -c feature/greeting
echo "Hola, mundo!" > saludo.txt
git commit -am ":sparkles: Saludo en español"
```

### Paso 3 · Volver a main y hacer un cambio distinto

```bash
git switch main
echo "Hello, world!" > saludo.txt
git commit -am ":sparkles: Saludo en inglés"
```

### Paso 4 · Intentar el merge

```bash
git merge feature/greeting
```

Git no puede decidir qué versión del archivo conservar:

```text
Auto-merging saludo.txt
CONFLICT (content): Merge conflict in saludo.txt
Automatic merge failed; fix conflicts and then commit the result.
```

### Paso 5 · Inspeccionar el conflicto

```bash
cat saludo.txt
```

Vas a ver los marcadores:

```text
<<<<<<< HEAD
Hello, world!
=======
Hola, mundo!
>>>>>>> feature/greeting
```

### Paso 6 · Resolver a mano

Editá el archivo y dejá solo la versión que querés:

```bash
echo "Hola, mundo!" > saludo.txt
```

(En la vida real, probablemente querés mantener ambas líneas o
elegir cuidadosamente.)

### Paso 7 · Confirmar la resolución

```bash
git add saludo.txt
git commit -m ":wrench: Resolver conflicto en saludo.txt"
```

---

## Ejercicio 3 · Pull Request con code review

**Objetivo**: simular un flujo completo de colaboración en GitHub:
crear una rama, hacer un cambio, abrir un PR, recibir feedback,
aplicarlo y mergear. **Duración estimada**: 30 minutos.

### Paso 1 · Crear el repositorio en GitHub

1. Andá a [github.com/new](https://github.com/new).
2. Nombre: `practica-pr`.
3. Tildá *Add a README file*.
4. Clic en **Create repository**.

### Paso 2 · Clonar y crear una rama

```bash
git clone git@github.com:TU_USUARIO/practica-pr.git
cd practica-pr
git switch -c docs/agregar-instalacion
```

### Paso 3 · Hacer un cambio

Editá `README.md` y agregá una sección:

````md
## Instalación

```bash
npm install mi-paquete
```
````

(Usá triple backtick en el archivo real.)

### Paso 4 · Commitear y pushear

```bash
git add README.md
git commit -m ":books: Documentar instalación en README"
git push -u origin docs/agregar-instalacion
```

### Paso 5 · Abrir el PR

1. Andá a la URL que GitHub muestra tras el push.
2. Clic en **Compare & pull request**.
3. Título: `Documentar instalación en README`.
4. Descripción: explicación de qué agregaste y por qué.
5. **Marcar como Draft**.
6. Clic en **Create pull request**.

### Paso 6 · Recibir feedback

Imaginate que un revisor comenta:

> "Falta mencionar los prerrequisitos (Node.js >= 18)."

### Paso 7 · Aplicar el feedback

Editá `README.md`:

````md
## Instalación

**Requisito previo**: Node.js 18 o superior.

```bash
npm install mi-paquete
```
````

Commit y push:

```bash
git add README.md
git commit -m ":wrench: Mencionar requisito de Node.js 18+"
git push
```

El PR se actualiza automáticamente con el nuevo commit.

### Paso 8 · Aprobar y mergear

1. Marcar el PR como **Ready for review**.
2. Aprobar (vos mismo en este ejercicio).
3. **Squash and merge**.
4. Eliminar la rama.

---

## Ejercicio 4 · Configurar branch protection

**Objetivo**: aplicar reglas de protección a la rama `main` desde la
UI de GitHub. **Duración estimada**: 10 minutos.

!!! warning "Solo aplica a repositorios donde sos admin"
    Si es tu repo personal, perfecto. Si es de una organización,
    pedí acceso admin antes.

### Paso 1 · Ir a Settings → Branches

[github.com/TU_USUARIO/practica-pr/settings/branches](https://github.com/TU_USUARIO/practica-pr/settings/branches)

### Paso 2 · Agregar regla para `main`

1. Clic en **Add rule**.
2. **Branch name pattern**: `main`.
3. Activá:
   - ☑ Require a pull request before merging.
   - ☑ Require approvals: `1`.
   - ☑ Dismiss stale pull request approvals when new commits are pushed.
   - ☑ Require linear history (sin merge commits).
   - ☑ Do not allow force pushes.
   - ☑ Do not allow deletions.
4. Clic en **Create**.

### Paso 3 · Probar que funciona

```bash
git switch main
echo "Cambio directo" >> README.md
git commit -am "test"
git push
```

Deberías recibir un error:

```text
remote: error: GH006: Protected branch update failed for refs/heads/main.
```

Eso confirma que la protección funciona. Para hacer cambios en
`main`, ahora tenés que hacerlo vía Pull Request.

---

## Recursos adicionales

- [Git Official Tutorial](https://git-scm.com/docs/gittutorial).
- [Oh My Git!](https://ohmygit.org/) — juego para aprender Git
  visualmente.
- [Learn Git Branching](https://learngitbranching.js.org/?locale=es_ES)
  — tutorial interactivo con visualizaciones.
- [GitHub Skills](https://skills.github.com/) — cursos oficiales
  cortos.

## Próximo paso

Volvé al [Inicio](../index.md) para repasar todo el material o
explorar el [Glosario](../glosario.md).
