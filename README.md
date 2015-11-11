# Estructura del sitio

## Navegación del sitio

La navegación de la página se hace a traves del fichero `/_data/nav.yml`.
En él se definen los idiomas disponibles y el arból de la jerarquia.

Cada nivel tiene su título en cada idioma y los hijos que contiene.

Por defecto un nivel que tiene definido el campo `category` genera una
página en la que se listan los `posts` de dicha categoria,
mientras que un nivel sin dicho campo no genera ningúna página y por
lo tanto solo simboliza una agrupación de los niveles inferiores.

La plantilla por defecto que usan las páginas con el campo `category`
definido es `/_layout/block.html`.

Si se quiere que algún nivel genere una página o use una plantilla
distinta a la de por defecto basta con definirle el campo `layout` con
el nombre de la plantilla sin ruta ni extensión.

El campo `class` sirve para que se use como clase de estilo en el html
cuando se referencia a ese item de la navegación.

## Imagenes y vídeos (recursos)

Las imagenes y los videos estan en la ruta `/rec/img/` y `/rec/vid/`
respectivamente. Los códigos fuente de las imagenes y videos estan en
`/rec/ori/`.

Cada imagen o video debe tener un nombre unico aunque esten en
diferentes carpetas. A su vez, si se desea proporcionar el código fuente
de ese recurso se debe alojar bajo la carpeta `/rec/ori/` y usando el
mismo nombre que el recurso, aunque obviamente con otra extensión.

Adicionalmente, en `/_data/resoruces.yml` se puede asignar a cada
recurso (a traves del nombre de su fichero) información adicional como
su alt, title, etc.

Finalmente, para incluir una imagen o video en un post se usa el tag
resource de la siguiente manera:

´´´liquid
{% resource XX.yyy %}
´´´

Donde XX.yyy es el nombre de la imagen o video.

El tag, sirviendose de que XX.yyy es un nombre único, encontrara el
fichero bajo `/rec/img/` o `/rec/vid/`, su código fuente bajo `/rec/ori/`
si lo tiene, y la información adicional que pudiera haber en
`/_data/resoruces.yml` y con todo ello incluira el recurso en la página.
