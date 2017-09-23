# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :simple_repo_example, ecto_repos: [SimpleRepoExample.Repo]

import_config "#{Mix.env}.exs"
