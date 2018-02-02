# The Beit Beaver Website

The website of The Beit Beaver, built using Jekyll on top of Ghost's default theme, [Casper](https://github.com/tryghost/casper).


## Getting Started

- Build the static website into `_site/`: `make`
- Run the site on a local server: `make serve`

## Compiling Styles

Styles are compiled using Gulp/PostCSS to polyfill future CSS spec. You'll need Node and Gulp installed globally. After that, from the theme's root directory:

```bash
$ npm install
$ gulp
```

Now you can edit `/assets/css/` files, which will be compiled to `/assets/built/` automatically.
