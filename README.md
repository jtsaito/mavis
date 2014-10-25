Mavis
=====
This is a multiplayer typing game by Timothy Daniell, Sebastian Oelke and Jahn Saito developed at the _2nd Babbel Hackday_ in 2014.  

Required modules
----------------
We require some global packages as tools and some local dependencies.

###Global Coffee Script compilation, etc.###
```bash
npm install -g coffee-script browserify
```

The browserify "lets you require('modules') in the browser by bundling up all of your dependencies.".

###Local node.js packages###
```bash
npm install coffee-script express socket.io
```

Compiling Mavis
---------------
###Compile client sources###
```bash
coffee --output public/javascript/client --compile src/*.coffee
```
(Add `--watch` for auto compilation.)

###Compile server sources###
```bash
coffee --compile module/*.coffee
```

Playing Mavis
-------------
###Run server from CoffeeScript in development mode###
```
coffee index.coffee
```
Start the server in your network. Connect from servers on port 5555: `http://your.ip.is.here:5555/`. Click "Join the game".

Currently, the server needs restarting after every game.
