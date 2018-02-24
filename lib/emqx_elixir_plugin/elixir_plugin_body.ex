##--------------------------------------------------------------------
## Copyright (c) 2016-2018 EMQ Enterprise, Inc. (http://emqtt.io)
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

defmodule EmqxElixirPlugin.Body do

    def hook_add(a, b, c) do
        :emqx_hooks.add(a, b, c)
    end
    
    def hook_del(a, b) do
        :emqx_hooks.delete(a, b)
    end

    def load(env) do
        # uncomment the hooks that you want, and implement its callback
        
        #hook_add(:"message.publish",      &EmqxElixirPlugin.Body.on_message_publish/2,     [env])
        #hook_add(:"message.delivered",    &EmqxElixirPlugin.Body.on_message_delivered/4,   [env])
        #hook_add(:"message.acked",        &EmqxElixirPlugin.Body.on_message_acked/4,       [env])
        #hook_add(:"client.connected",     &EmqxElixirPlugin.Body.on_client_connected/3,    [env])
        #hook_add(:"client.subscribe",     &EmqxElixirPlugin.Body.on_client_subscribe/4,    [env])
        #hook_add(:"client.unsubscribe",   &EmqxElixirPlugin.Body.on_client_unsubscribe/4,  [env])
        #hook_add(:"client.disconnected",  &EmqxElixirPlugin.Body.on_client_disconnected/3, [env])
        #hook_add(:"session.subscribed",   &EmqxElixirPlugin.Body.on_session_subscribed/4,  [env])
        #hook_add(:"session.unsubscribed", &EmqxElixirPlugin.Body.on_session_unsubscribed/4,[env])
    end

    def unload do
        # uncomment the hooks that you want
        
        #hook_del(:"message.publish",      &EmqxElixirPlugin.Body.on_message_publish/2     )
        #hook_del(:"message.delivered",    &EmqxElixirPlugin.Body.on_message_delivered/4   )
        #hook_del(:"message.acked",        &EmqxElixirPlugin.Body.on_message_acked/4       )
        #hook_del(:"client.connected",     &EmqxElixirPlugin.Body.on_client_connected/3    )
        #hook_del(:"client.subscribe",     &EmqxElixirPlugin.Body.on_client_subscribe/4    )
        #hook_del(:"client.unsubscribe",   &EmqxElixirPlugin.Body.on_client_unsubscribe/4  )
        #hook_del(:"client.disconnected",  &EmqxElixirPlugin.Body.on_client_disconnected/3 )
        #hook_del(:"session.subscribed",   &EmqxElixirPlugin.Body.on_session_subscribed/4  )
        #hook_del(:"session.unsubscribed", &EmqxElixirPlugin.Body.on_session_unsubscribed/4)
    end
    
    def on_message_publish(message, _env) do
        IO.inspect(["elixir on_message_publish", message])
        
        # add your elixir code here
        
        {:ok, message}
    end
    
    def on_message_delivered(clientId, username, message, _env) do
        IO.inspect(["elixir on_message_delivered", clientId, username, message])
        
        # add your elixir code here
        
        :ok
    end
    
    def on_message_acked(clientId, username, message, _env) do
        IO.inspect(["elixir on_message_acked", clientId, username, message])
        
        # add your elixir code here
        
        :ok
    end
    
    def on_client_connected(returncode, client, _env) do
        IO.inspect(["elixir on_client_connected", client, returncode, client])
        
        # add your elixir code here
        
        :ok
    end
    
    def on_client_disconnected(error, client, _env) do
        IO.inspect(["elixir on_client_disconnected", error, client])
        
        # add your elixir code here
        
        :ok
    end
    
    def on_client_subscribe(clientid, username, topictable, _env) do
        IO.inspect(["elixir on_client_subscribe", clientid, username, topictable])
        
        # add your elixir code here
        
        {:ok, topictable}
    end
    
    def on_client_unsubscribe(clientid, username, topictable, _env) do
        IO.inspect(["elixir on_client_unsubscribe", clientid, username, topictable])
        
        # add your elixir code here
        
        {:ok, topictable}
    end
    
    def on_session_subscribed(clientid, username, topicitem, _env) do
        IO.inspect(["elixir on_session_subscribed", clientid, username, topicitem])
        
        # add your elixir code here
        
        {:ok, topicitem}
    end
    
    def on_session_unsubscribed(clientid, username, topicitem, _env) do
        IO.inspect(["elixir on_session_unsubscribed", clientid, username, topicitem])
        
        # add your elixir code here
        
        {:ok, topicitem}
    end
end

