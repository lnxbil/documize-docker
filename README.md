# Running a [`documize`](https://documize.com/) Instance with Docker Compose

## Quickstart

Just clone the repository, build the image and start it up
(and restart the app service at least once)

```sh
$ docker-compose build
$ docker-compose up -d
$ sleep 10
$ docker-compose restart app
```

Currently, there is problem with the startup of the `documize` instance
itself, was it is discussed in [documize#188](https://github.com/documize/community/issues/188),
so you need to restart the `app` service at least once to get it to
connect to the database.

Afterwards, you can access it on port `8080`, if you haven't changed this.

## Changing parameters

The `docker-compose.yml` file does include all configuration options so
that nothing is hardcoded inside. The version of `documize` you want to
use is also given in the file itself. You need to rebuild the container
via `docker-compose build` after you changed the file (or use `--build`
flag).

## Under the hood

The application Docker image itself is based on `SCRATCH`, therefore as
minimal as it can be. The image needs to be created in a two fold way,
because the downloaded binary needs to be `chmod`ed.
