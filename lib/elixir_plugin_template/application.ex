defmodule ElixirPluginTemplate.Application do
  use Application

  @moduledoc false

  @impl Application
  def start(_type, _args) do
    children = [
      %{
        id: ElixirPluginTemplate,
        start: {ElixirPluginTemplate, :start_link, []},
        type: :worker
      }
    ]

    opts = [strategy: :one_for_one, name: ElixirPluginTemplate.Supervisor]

    # put any start up your plugin has to do here
    with pid when is_pid(pid) <- Process.whereis(:emqx_hooks) do
      :emqx.hook(:"message.publish", {ElixirPluginTemplate, :log_msg, []})
    end

    Supervisor.start_link(children, opts)
  end

  @impl Application
  def stop(_state) do
    # put any clean up your plugin has to do when being stopped here
    with pid when is_pid(pid) <- Process.whereis(:emqx_hooks) do
      :emqx.unhook(:"message.publish", {ElixirPluginTemplate, :log_msg, []})
    end

    :ok
  end
end
