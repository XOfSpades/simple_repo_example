#!/bin/sh

docker-compose up -d --build simple-repo-example-postgres-dev-s

MIX_ENV=dev mix do ecto.create, ecto.migrate, phx.server

