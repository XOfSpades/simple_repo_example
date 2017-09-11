defmodule SimpleRepoSample.Web.ConnHelper do
  def query(conn, value) when is_binary(value) do
    Map.get(Plug.Conn.fetch_query_params(conn).query_params, value, nil)
  end
  def query(conn, value) when is_atom(value) do
    query(conn, Atom.to_string(value))
  end

  def query_int(conn, value) do
    case query(conn, value) do
      nil -> nil
      number -> String.to_integer(number)
    end
  end

  def account_data(conn, key) when is_binary(key) do
    Map.get(conn.assigns.account, key)
  end
  def account_data(conn, key) when is_atom(key) do
    account_data(conn, Atom.to_string(key))
  end
end
