#!/bin/sh

docker-compose up -d --build simple-repo-example-postgres-test-s

MIX_ENV=test mix do ecto.create, ecto.migrate, test

docker-compose down
