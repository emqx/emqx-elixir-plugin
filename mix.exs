defmodule EmqxElixirPlugin.Mixfile do
  use Mix.Project

  def project do
    [
      app: :emqx_elixir_plugin,
      version: "2.3.2",
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
      {:cuttlefish, github: "emqx/cuttlefish", tag: "exs-3.0.0", manager: :rebar3, override: true},
      {:emqx, github: "emqx/emqx", branch: branch()}
    ]
  end

  defp branch do
     cur_branch = :os.cmd('git branch | grep -e \'^*\' | cut -d\' \' -f 2') -- '\n'
     to_string(case :lists.member(cur_branch, ['master', 'develop']) do
                  true -> cur_branch
                  false -> 'develop'
              end)
  end
end
