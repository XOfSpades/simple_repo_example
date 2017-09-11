defmodule SimpleRepoSample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :simple_repo_sample,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      compilers: [:phoenix] ++ Mix.compilers,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      [
        applications: [
          :logger, :cowboy, :phoenix, :postgrex, :ecto
        ],
        mod: {SimpleRepoSample.Application, []}
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:simple_repo, "~> 0.2.0-rc1"},
      {:phoenix, "~> 1.3" },
      {:phoenix_live_reload, "~> 1.0"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
