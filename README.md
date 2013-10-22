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

    port=8000 grunt server

Open your browser at [http://localhost:8000/](http://localhost:8000).

# API

## `PUT /api/todos/_create`

Creates a todo and returns the created document, which includes the id:

    $ curl 'http://localhost:8000/api/todos/_create?name=Test' -u 'simon.wade@gmail.com:asdf'
	> {"todo":{"email":"simon.wade@gmail.com","id":"t59epp","name":"Test"}}

## `GET /api/todos/:id`

Returns the properties of the specified todo.

	$ curl 'http://localhost:8000/api/todos/t59epp' -X GET -u 'simon.wade@gmail.com:asdf'
	> {"todo":{"isCompleted":"true","email":"simon.wade@gmail.com","id":"t59epp"}}

## `POST /api/todos/:id`

Sets properties of the specified todo.

	$ curl 'http://localhost:8000/api/todos/t59epp' -X POST --data 'isCompleted=true' -u 'simon.wade@gmail.com:asdf'
	> {"todo":{"isCompleted":"true","email":"simon.wade@gmail.com","id":"t59epp"}}

## `GET /api/todos/:id/set/:property?value=:value`

Shorthand to set a property of the specified todo.

	$ curl 'http://localhost:8000/api/todos/t59epp/set/isCompleted?value=true' -X GET -u 'simon.wade@gmail.com:asdf'
	> {"todo":{"isCompleted":true,"email":"simon.wade@gmail.com","id":"t59epp"}}
