defmodule SimpleRepoSample.Web.Api.FoldersView do
  use SimpleRepoSample.Web, :view
  alias SimpleRepoSample.Web.Api.ErrorView

  def render(".json", %{data: data}), do: data
  def render(json_code, data), do: ErrorView.render(json_code, data)
end
