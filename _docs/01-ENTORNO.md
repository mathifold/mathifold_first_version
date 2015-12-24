*Nota:* Las intruciones detalladas son solo para Linux (Ubuntu, Mint y similares)
ya que no dispongo de un entorno windows donde probar, pero para todo lo dicho
hay un equivalente en windows. Buscar manuales por internet.

# Requisitos

Para trabajar en este proyecto se necesita:

- [ruby](https://www.ruby-lang.org/es/) 1.9.3p484 o superior
- [jekyll](https://jekyllrb.com/) 2.5.3
- [git](http://rogerdudler.github.io/git-guide/index.es.html)

Si adicionalmente se quiere además poder subir los resultados a
[App Engine](https://appengine.google.com) se necesitara:

- [App Engine SDK](https://cloud.google.com/appengine/downloads)

# Entorno local

1º Creamos una cuenta en [github](https://github.com)

2º Instalar los paquetes necesarios

```
sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install ruby ruby-dev make gcc nodejs
sudo gem install jekyll --no-rdoc --no-ri -v 2.5.3
```

3º Configuramos git con nuestro usuario

```
git config --global user.name "nick"
git config --global user.email "correo@electronico.com"
```

4º Descargar el proyecto

```
git clone https://github.com/mathifold/mathifold.git
```

4º Probar proyecto

```
cd mathifold
jekyll server --trace
```

Esto creara una versión local del sitio en `http://127.0.0.1:4000/`

# Publicar en App Engine

Descargamos [Google App Engine SDK for Python](https://cloud.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python)
para Linux y lo descomprimimos en una carpeta que nos venga bien.

En la carpeta de nuestro proyecto mathifold creamos (o modificamos) el script `_publish.sh` cuyo contenido ha de ser:

```bash
#!/bin/bash
set -e

# Build the _site/ contents with Jekyll
jekyll build

# Publish in App Engine
~/google_appengine/appcfg.py update .
```

Donde `~/google_appengine/` ha de ser subsituido por la ruta donde hayamos descomprimido el SDK.

Y finalmente le damos permisos de ejecución: `chmod +x _publis.sh`.

De esta manera cuando ejecutemos `./_publis.sh` se publicara el contenido en App Engine
