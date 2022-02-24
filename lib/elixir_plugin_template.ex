defmodule ElixirPluginTemplate do
  use GenServer

  @moduledoc """
  A dummy example server
  """

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  def log_msg(msg) do
    GenServer.cast(__MODULE__, {:log, msg})
    {:ok, msg}
  end

  @impl GenServer
  def init(_) do
    {:ok, %{pings: 0}}
  end

  @impl GenServer
  def handle_call(:ping, _from, state) do
    state = Map.update!(state, :pings, &(&1 + 1))
    {:reply, state.pings, state}
  end

  @impl GenServer
  def handle_cast({:log, msg}, state) do
    msg
    |> :emqx_message.to_map()
    |> IO.inspect(label: :emqx_msg)

    {:noreply, state}
  end
end
