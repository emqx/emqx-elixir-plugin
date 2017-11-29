# emq_elixir_plugin

This is an EMQ plugin template, which make you write a plugin in elixir language.

Here is an example, supposing you are interested in publish-message hook.

## step 1
Clone emq-relx project and its dependencies.
```
git clone https://github.com/emqtt/emq-relx.git
cd emq-relx
make
```
emq-relx/deps/emq_elixir_plugin is the working directory of following steps.


## step 2
Put emq-elixir-plugin into emq-relx project. emq-elixir-plugin is not included in release project by default since it is just a development template.

+ Modify emq-relx/Makefile:
  - Append emq_elixir_plugin to DEPS variable
  - Add following line to specify the repository
```
dep_emq_elixir_plugin = git https://github.com/emqtt/emq-elixir-plugin master
```
+ Modify relx.conf
  - Add following line below '{emq_lua_hook, load},'
```
{emq_elixir_plugin, load},
```

## step 3
Uncomment the following line in load() of elixir_plugin_body.ex
```
#hook_add(:"message.publish",      &EmqElixirPlugin.Body.on_message_publish/2,     [env])
```
and uncomment the following line in unload() of elixir_plugin_body.ex
```
#hook_del(:"message.publish",      &EmqElixirPlugin.Body.on_message_publish/2     )
```

## step 4
Write your code in on_message_publish() function
```
def on_message_publish(message, _env) do
        IO.inspect(["elixir on_message_publish", message])
        
        # add your elixir code here
        
        {:ok, message}
    end
```

## step 5
Compile your code
```
cd emq-relx
make
```

## step 6
Run your code
```
cd emq-relx/_rel/emqttd
bin/emqttd start
bin/emqttd_ctl plugins load emq_elixir_plugin
```
Your elixir plugin should be working now.



