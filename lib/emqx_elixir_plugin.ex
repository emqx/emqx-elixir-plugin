##--------------------------------------------------------------------
## Copyright (c) 2016-2017 EMQ Enterprise, Inc. (http://emqtt.io)
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##--------------------------------------------------------------------

defmodule EmqxElixirPlugin do
  
  Module.register_attribute(__MODULE__, :emqx_plugin, accumulate: false, persist: true)
  Module.put_attribute(__MODULE__, :emqx_plugin, __MODULE__)

  use Application
  
    def start(_type, _args) do
        EmqxElixirPlugin.Body.load([])
        
        # start a dummy supervisor
        EmqxElixirPlugin.Supervisor.start_link()
    end
  
    def stop(_app) do
        EmqxElixirPlugin.Body.unload()
    end

end
