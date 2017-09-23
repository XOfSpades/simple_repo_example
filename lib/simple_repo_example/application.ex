defmodule SimpleRepoExample.Application do
  def start(_type, _args) do
    require Logger
    import Supervisor.Spec, warn: false

    Logger.info "Start simple_repo_example"

    # Define workers and child supervisors to be supervised
    # Phoenix is started via mix file
    children = [
      supervisor(SimpleRepoExample.Repo, []),
      supervisor(SimpleRepoExample.Web.Endpoint, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleRepoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
