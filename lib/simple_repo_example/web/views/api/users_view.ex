defmodule SimpleRepoExample.Web.Api.FoldersView do
  use SimpleRepoExample.Web, :view
  alias SimpleRepoExample.Web.Api.ErrorView

  def render(".json", %{data: data}), do: data
  def render(json_code, data), do: ErrorView.render(json_code, data)
end
