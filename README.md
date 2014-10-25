Mavis
=====
This is a game by Tim Daniell, Seb Oelke and Jahn Saito for on the 2nd Babbel Hackday in 2014.  


Required modules
----------------
We require some global packages as tools to be installed as well as some packages for the source locally.

###Global Coffee Script compilation, etc.###
```bash
npm install -g coffee-script browserify
```

The browserify "lets you require('modules') in the browser by bundling up all of your dependencies.".

###Local node.js packages###
```bash
npm install coffee-script express socket.io
```

Compilation Mavis
-----------------

###Compile client sources###
```bash
coffee --output public/javascript/client --compile src/*.coffee

```
(Add `--watch` for auto compilation.)


###Compile client sources###
```bash
coffee --compile module/*.coffee

```

Playing Mavis
-------------

###Run server from CoffeeScript in development mode###
```
coffee index.coffee

```

Start the server in your network. Connect from servers on port

  http://your.ip.is.here:5555/

Click "Join the game".

The server needs restarting after every game.
