# generator-panda [![Build Status](https://secure.travis-ci.org/abdonwww/generator-panda.png?branch=master)](https://travis-ci.org/abdonwww/generator-panda)

A generator for [Yeoman](http://yeoman.io).


## Getting Started

### What is Yeoman?

Trick question. It's not a thing. It's this guy:

![](http://i.imgur.com/JHaAlBJ.png)

Basically, he wears a top hat, lives in your computer, and waits for you to tell him what kind of application you wish to create.

Not every new computer comes with a Yeoman pre-installed. He lives in the [npm](https://npmjs.org) package repository. You only have to ask for him once, then he packs up and moves into your hard drive. *Make sure you clean up, he likes new and shiny things.*

```
$ npm install -g yo
```

### Yeoman Generators

Yeoman travels light. He didn't pack any generators when he moved in. You can think of a generator like a plug-in. You get to choose what type of application you wish to create, such as a Backbone application or even a Chrome extension.

To install generator-panda from npm, run:

```
$ npm install -g generator-panda
```

Finally, initiate the generator:

```
$ yo panda
```

### Getting To Know Yeoman

Yeoman has a heart of gold. He's a person with feelings and opinions, but he's very easy to work with. If you think he's too opinionated, he can be easily convinced.

If you'd like to get to know Yeoman better and meet some of his friends, [Grunt](http://gruntjs.com) and [Bower](http://bower.io), check out the complete [Getting Started Guide](https://github.com/yeoman/yeoman/wiki/Getting-Started).


## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)



- **`htdocs` and `build` directories are disposable. They will be deleted when "grunt" runs.**
- The files having "_" (underscore) at the first letter of file name or directory name won't be processed.



## Prerequisites

### [Jade](http://jade-lang.com/)
```Jade
$ npm install -g jade
```

### [CoffeeScript](http://coffeescript.org/)
```CoffeeScript
$ npm install -g coffee-script
```

### [Stylus](http://learnboost.github.io/stylus/)
```Stylus
$ npm install -g stylus
```


## Installation of dependencies

### Install Node modules
```Node modules
$ npm install
```

### Install Bower components
```Bower components
$ bower install
```

## Grunt Tasks

### Default
```Default
$ grunt
```

Alias task of `build:development`, `connect` and `watch`

### Build
```Build
$ grunt build
```

Alias task of `build:production`

### Build for development
```Build for development
$ grunt build:development
```

Compile for the development environment

### Build for preview
```Build for preview
$ grunt build:preview
```

Compile for kakunin server

### Build for production
```Build for production
$ grunt build:production
```

Compile for production environment
