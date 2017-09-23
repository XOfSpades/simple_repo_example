defmodule SimpleRepoExample.ApplicationTest do
  use ExUnit.Case
  doctest SimpleRepoExample.Application

  test "greets the world" do
    assert SimpleRepoExample.Application.hello() == :world
  end
end
