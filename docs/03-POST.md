Para crear o modificar un `post` debemos conocer lo siguiente:

# Un post es un fichero markdown con una cabecera YAML

## El fichero

Un `post` es un fichero [markdown](https://es.wikipedia.org/wiki/Markdown)
alojado bajo la carpeta `_post/*lang*` donde *lang* es el idioma del `post`
(actualmente `es` o `en`)

El nombre de este fichero ha de cumplir el patron `YYYY-MM-DD-slug.md`
donde `YYYY-MM-DD` es la fecha de publicación, `slug` es el título simplificado
(con `-` en vez de espacios, sin tildes, abreviado...) y `.md` es la extensión
del fichero markdown

## La cabecera YAML

La cabecera YAML son las primera lineas del fichero, concretamente las que están
entre dos líneas `---`

[YAML](https://es.wikipedia.org/wiki/YAML) sirve para indicar los metadatos
esenciales del `post`. Por ejemplo:

```yaml
---
title: "Espacios funcionales usuales"
mathjax: true
categories: c4
langid: usualfunction
---
```

Significa que:

- el titulo del post sera "Espacios funcionales usuales"
- va a usar mathjax (esto incluirá automáticamente las librerías mathjax necesarias)
- Su categoría es la c4 y por lo tanto aparecerá en el apartado que según `_data/nav.yml` corresponde a esa categoría
- su id de idioma es langid y por lo tanto cualquier otro `post` en otro idioma con el mismo langid se considerara una traducción suya

*Nota*: el valor de `categories` podría ser c4 como podría ser cualquier otro mucho más descriptivo
(de hecho, en un futuro se cambiara por valores más legibles). Lo único importante es saber que en 
`_data/nav.yml` debemos asignar, si no esta asignado ya, un nivel a dicha jerarquia
(buscar `category: c4` en `_data/nav.yml` para ver un ejemplo).

# Crear un post

Con lo aprendido en el apartado anterior, 
crearemos un archivo `YYYY-MM-DD-slug.md` en la carpeta que le corresponda según su idioma y
rellenaremos su cabecera YAML (recordar editar tambien `_data/nav.yml` si la categría es nueva).

Finalmente bajo la cabecera YAML escribimos el contenido del `post`

## Escribir contenido del post

La mayor parte del `post` podrá escribirse simplemente usando la parte más intuitiva de markdown.

Para todo lo demás hemos de conocer que:

1. Cualquier trozo de código que pongamos en html sera interpretado correctamente en el resultado.
2. Podemos incluir fácilmente imágenes y vídeos usando el tag `resource` (ver *Imágenes y vídeos (recursos)* en *02-ESRUCTURA.md*)
3. Las formulas latex han de incluirse entre dos símbolos de dolar (ej: `blablabla $$\dfrac{2}{3}$$ blabla`).
En el muy poco probable caso de que mathjax no detecte la formular:
	a) si es una formular `inline` envolverla en un \<span\>. Ej: `blablabla \<span\>$$\dfrac{2}{3}$$\</span\> blabla`).
	b) si es una formula `block` envolver en un <\div\>. Ej:
	
```
blablabla

\<div\>
$$\dfrac{2}{3}$$
\</div\>

blablabla
```

## Comprobar el post

Estando en la carpeta local de nuestro proyecto lanzamos el servidor de prueba

```
jekyll server --trace
```

Y en `http://127.0.0.1:4000/` navegamos para ver el resultado.

# Publicar

## Subir el contenido a github

Cuando hayamos conseguido el resultado deseado subimos los cambios al proyecto.
Para ello:

1. Comprobamos el estado del proyecto: `git status`
2. Añadimos los ficheros que queremos modificar: `git add ruata/filero1 ruta/fichero2`
3. Añadimos un comentario describiendo los cambios: `git commit -m "nuevo post"`
4. Subimos los cambios: `git push origin master`

En caso de conflictos consultar un manual más detallado sobre `git`

## Publicar en App Engine

Ver *Publicar en App Engine* en *01-ENTORNO.md*
