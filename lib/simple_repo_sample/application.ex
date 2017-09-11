defmodule SimpleRepoSample.Application do
  def start(_type, _args) do
    require Logger
    import Supervisor.Spec, warn: false

    Logger.info "Start simple_repo_sample"

    # Define workers and child supervisors to be supervised
    # Phoenix is started via mix file
    children = [
      supervisor(SimpleRepoSample.Repo, []),
      supervisor(SimpleRepoSample.Web.Endpoint, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleRepoSample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
