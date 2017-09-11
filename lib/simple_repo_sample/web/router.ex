defmodule SimpleRepoSample.Web.Router do
  use SimpleRepoSample.Web, :router

  @base_crud [:create, :update, :show, :index, :delete]

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", SimpleRepoSample.Web do
    pipe_through :api

    resources "/users", Api.UsersController, only: @base_crud
  end
end
