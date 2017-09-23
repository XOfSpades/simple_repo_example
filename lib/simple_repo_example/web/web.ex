defmodule SimpleRepoExample.Web do

  def controller do
    quote do
      use Phoenix.Controller, namespace: SimpleRepoExample.Web

      # Import URL helpers from the router
      import SimpleRepoExample.Web.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/simple_repo_example/web/templates",
                        namespace: SimpleRepoExample.Web
      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, view_module: 1]

      # Import URL helpers from the router
      import SimpleRepoExample.Web.Router.Helpers

      # # Import authentication checks from Session
      # import SimpleRepoExample.Session, only: [current_user: 1, logged_in?: 1]
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
