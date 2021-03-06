# <%= projectName %>

**This is a new way of front-end coding. There is no need to code raw HTML/CSS, JavaScript with countless brackets.**

- `temp` and `build` directories are disposable. They will be deleted when "grunt" runs.
- The files having "_" (underscore) at the first letter of file name or directory name won't be processed.
- No test framework is set up yet. It's still under development.

## Prerequisites

### [Jade](http://jade-lang.com/)

```
$ npm install -g jade
```

### [CoffeeScript](http://coffeescript.org/)

```
$ npm install -g coffee-script
```

### [Stylus](http://learnboost.github.io/stylus/)

```
$ npm install -g stylus
```


## Installation dependencies if necessary

### Install Node modules if the initial installation failed

```
$ npm install
```

### Install Bower components if the initial installation failed

```
$ bower install
```

## Grunt Tasks

### Default

```
$ grunt
```

- Alias task of `build:development`, `connect` and `watch`
- Run a simple server on [http://localhost:8000/](http://localhost:8000/) by defualt.

### Build

```
$ grunt build
```

- Alias task of `build:production`

### Build for development

```
$ grunt build:development
```

- Compile for the development environment into the `temp` directory
- Load JavaScript files asynchronously via [RequireJS](http://requirejs.org/)

### Build for preview

```
$ grunt build:preview
```

- Compile for kakunin server into the `temp` directory
- Consolidate a bunch of JavaScript files with [RequireJS Optimizer](http://requirejs.org/docs/optimization.html) and [Almond](https://github.com/jrburke/almond)

### Build for production

```
$ grunt build:production
```

- Compile for production environment
- Consolidate a bunch of JavaScript files with [RequireJS Optimizer](http://requirejs.org/docs/optimization.html) and [Almond](https://github.com/jrburke/almond)
