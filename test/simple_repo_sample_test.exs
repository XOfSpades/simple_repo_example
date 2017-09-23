defmodule SimpleRepoExampleTest do
  use ExUnit.Case
  doctest SimpleRepoExample

  test "greets the world" do
    assert SimpleRepoExample.hello() == :world
  end
end
