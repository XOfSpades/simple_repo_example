defmodule SimpleRepoExample.Web.Router do
  use SimpleRepoExample.Web, :router

  @base_crud [:create, :update, :show, :index, :delete]

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", SimpleRepoExample.Web do
    pipe_through :api

    resources "/users", Api.UsersController, only: @base_crud
  end
end
