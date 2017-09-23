defmodule SimpleRepoExample.Web.Api.ApiController do
  import Plug.Conn
  use SimpleRepoExample.Web, :controller
  use SimpleRepo.Repository, repo: SimpleRepoExample.Repo
  alias SimpleRepoExample.Repository
  alias SimpleRepoExample.Pager
  alias SimpleRepoExample.Web.ConnHelper

  def create(conn, base_struct) do
    case Repository.save(base_struct, conn.assigns.request_body) do
      {:error, changeset} -> render_invalid(conn, changeset)
      {:ok, entity} ->
        conn |> put_status(201) |> render(".json", %{data: entity})
    end
  end

  def show(conn, model, scope \\ []) do
    id = id(conn)
    case Repository.get(model, id, scope) do
      {:ok, entity} -> render(conn, ".json", %{data: entity})
      {:error, :not_found} -> render_not_found(conn, id)
    end
  end

  def index(conn, model, scope \\ []) do
    entitys = model
    |> Pager.paginate(pagination_params(conn))
    |> Repository.all(scope)
    render(conn, ".json", %{data: entitys})
  end

  def update(conn, model, scope \\ []) do
    id = id(conn)
    params = conn.assigns.request_body
    case Repository.update(model, id, params, scope) do
      {:ok, entity} -> render(conn, ".json", %{data: entity})
      {:error, :not_found} -> render_not_found(conn, id)
      {:error, changeset} -> render_invalid(conn, changeset)
    end
  end

  def delete(conn, model, scope \\ []) do
    id = id(conn)
    case Repository.delete(model, id, scope) do
      {:ok, entity} -> render(conn, ".json", %{data: entity}) # maybe head_no_content?
      {:error, :not_found} -> render_not_found(conn, id)
    end
  end

  def count(conn, model, field, scope \\ []) do
    item_count = Repository.aggregate(model, :count, field, scope)
    render(conn, ".json", %{data: %{count: item_count}})
  end

  def render_invalid(conn, changeset) do
    conn |> put_status(422) |> render("invalid.json", changeset)
  end

  def render_not_found(conn, id) do
    conn |> put_status(404) |> render("not_found.json", %{id: id})
  end

  defp id(conn) do
    [_, _, _, id | _] = conn.path_info
    id
  end

  defp pagination_params(conn) do
    %{
      page: ConnHelper.query_int(conn, :page),
      page_size: ConnHelper.query_int(conn, :pagesize)
    }
  end
end
