defmodule SimpleRepoExample.Web.Api.ErrorView do
  def render("not_found.json", meta_data) do
    %{errors: %{folder: "No item with #{Map.get(meta_data, :id)} found"}}
  end
  def render("invalid.json", _data = %{changesets: changesets}) do
    Enum.map(changesets, &(render("invalid.json", &1)))
  end
  def render("invalid.json", changeset) do
    changeset.errors
    |> Enum.map(fn {key, {value, _}} -> {key, value} end)
    |> Enum.map(&SimpleRepoExample.JsonMapper.to_json_tuple/1)
    |> Enum.into(%{})
    |> fn error_map -> %{errors: error_map} end.()
  end
end
