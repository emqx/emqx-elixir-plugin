defmodule EmqElixirPlugin.Body do

    def hook_add(a, b, c) do
        :emqttd_hooks.add(a, b, c)
    end
    
    def hook_del(a, b) do
        :emqttd_hooks.delete(a, b)
    end

    def load(env) do
        # uncomment the hooks that you want, and implement its callback
        
        #hook_add(:"message.publish",      &EmqElixirPlugin.Body.on_message_publish/2,     [env])
        #hook_add(:"message.delivered",    &EmqElixirPlugin.Body.on_message_delivered/4,   [env])
        #hook_add(:"message.acked",        &EmqElixirPlugin.Body.on_message_acked/4,       [env])
        #hook_add(:"client.connected",     &EmqElixirPlugin.Body.on_client_connected/3,    [env])
        #hook_add(:"client.subscribe",     &EmqElixirPlugin.Body.on_client_subscribe/4,    [env])
        #hook_add(:"client.unsubscribe",   &EmqElixirPlugin.Body.on_client_unsubscribe/4,  [env])
        #hook_add(:"client.disconnected",  &EmqElixirPlugin.Body.on_client_disconnected/3, [env])
        #hook_add(:"session.subscribed",   &EmqElixirPlugin.Body.on_session_subscribed/4,  [env])
        #hook_add(:"session.unsubscribed", &EmqElixirPlugin.Body.on_session_unsubscribed/4,[env])
    end

    def unload do
        # uncomment the hooks that you want
        
        #hook_del(:"message.publish",      &EmqElixirPlugin.Body.on_message_publish/2     )
        #hook_del(:"message.delivered",    &EmqElixirPlugin.Body.on_message_delivered/4   )
        #hook_del(:"message.acked",        &EmqElixirPlugin.Body.on_message_acked/4       )
        #hook_del(:"client.connected",     &EmqElixirPlugin.Body.on_client_connected/3    )
        #hook_del(:"client.subscribe",     &EmqElixirPlugin.Body.on_client_subscribe/4    )
        #hook_del(:"client.unsubscribe",   &EmqElixirPlugin.Body.on_client_unsubscribe/4  )
        #hook_del(:"client.disconnected",  &EmqElixirPlugin.Body.on_client_disconnected/3 )
        #hook_del(:"session.subscribed",   &EmqElixirPlugin.Body.on_session_subscribed/4  )
        #hook_del(:"session.unsubscribed", &EmqElixirPlugin.Body.on_session_unsubscribed/4)
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



