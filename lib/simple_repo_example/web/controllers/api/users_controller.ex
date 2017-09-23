defmodule SimpleRepoExample.Web.Api.UsersController do
  import Plug.Conn
  import SimpleRepoExample.Web.ConnHelper
  require Logger
  use SimpleRepoExample.Web, :controller
  alias SimpleRepoExample.Web.Api.ApiController
  alias SimpleRepoExample.Data.User

  @deserializer SimpleRepoExample.Data.UserDeserializer

  def create(conn, _), do: ApiController.create(conn, %User{})

  def show(conn, _), do: ApiController.show(conn, User, org_scope(conn))

  def index(conn, _), do: ApiController.index(conn, User, org_scope(conn))

  def update(conn, _), do: ApiController.update(conn, User, org_scope(conn))

  def delete(conn, _) do
    ApiController.delete(conn, User, org_scope(conn))
  end

  defp org_scope(conn) do
    IO.inspect(fetch_query_params(conn))
  end
end
