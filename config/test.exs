use Mix.Config

config :simple_repo_example, SimpleRepoExample.Web.Endpoint,
  http: [port: 8002],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  url: [host: "localhost", port: 8002]

# Do not include metadata nor timestamps in development logs
config :logger, :console, level: :debug, format: "[$level] $message\n"

config :simple_repo_example, SimpleRepoExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "simple_repo_example_test",
  username: "simple_repo_example_test",
  password: "exs#exs123",
  hostname: "127.0.0.1",
  port: "5432",
  pool_size: 10
