defmodule ElixirPluginTemplateTest do
  use ExUnit.Case
  doctest ElixirPluginTemplate

  test "pings" do
    assert ElixirPluginTemplate.ping() == 1
    assert ElixirPluginTemplate.ping() == 2
  end
end
