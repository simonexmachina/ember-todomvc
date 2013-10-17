# Toptal Todo

Prerequisites:

- [Node.js](http://nodejs.org/)
- Bower: `npm install -g bower`
- Grunt: `npm install -g grunt`

Create your clone:

    git clone ssh://git@bitbucket.org/simonwade/toptal-todo.git \
      && cd toptal-todo \
      && git submodule update --init \
      && npm install \
      && bower install

Start the server:

    grunt server

Open your browser at [http://localhost:8000/](http://localhost:8000).

# Ember Data

Rebuilding ember-data:

    cd vendor/ember-data \
      && bundle && rake dist

- Until the guides are updated you should read the [transition notes](https://github.com/emberjs/data/blob/master/TRANSITION.md)