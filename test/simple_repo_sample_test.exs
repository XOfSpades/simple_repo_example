defmodule SimpleRepoSampleTest do
  use ExUnit.Case
  doctest SimpleRepoSample

  test "greets the world" do
    assert SimpleRepoSample.hello() == :world
  end
end
