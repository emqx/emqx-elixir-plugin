defmodule EmqElixirPlugin do
  use Application
  
    def start(_type, _args) do
        EmqElixirPlugin.Body.load([])
        
        # start a dummy supervisor
        EmqElixirPlugin.Supervisor.start_link()
    end
  
    def stop(_app) do
        EmqElixirPlugin.Body.unload()
    end

end
