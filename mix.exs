defmodule EmqxElixirPlugin.Mixfile do
  use Mix.Project

  def project do
    [
      app: :emqx_elixir_plugin,
      version: "3.0.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EmqxElixirPlugin, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
    ]
  end
end
