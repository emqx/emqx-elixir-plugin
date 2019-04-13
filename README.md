# emqx_elixir_plugin

This is an EMQ plugin template that enables you to write EMQ plugins using Elixir.

Here is an example, supposing you are interested in using a publish-message hook:

## Step 1
Clone the `emqx-relx` project and its dependencies.
```
$ git clone https://github.com/emqx/emqx-relx.git
$ cd emqx-relx
$ make
```
emqx-relx/deps/emqx_elixir_plugin is the working directory of following steps.


## Step 2
This step will load `emqx-elixir-plugin` into the `emqx-relx` project. `emqx-elixir-plugin` is not included in the release project by default, since it is just a development template.

+ Modify `emqx-relx/Makefile`:
  - Append `emqx_elixir_plugin` to the `CLOUD_APPS` variable

+ Modify `relx.conf`
  - Add a new line like `{emqx_lua_hook, load},`:

```
{emqx_elixir_plugin, load},
```

+ Re-make, in order to install the new dependencies (inside `emqx-relx`'s root):
```
$ make
```

## Step 3
Uncomment the following line in the `load/1` function of `deps/emqx_elixir_plugin/lib/emqx_elixir_plugin/elixir_plugin_body.ex`

```elixir
hook_add(:"message.publish",      &EmqxElixirPlugin.Body.on_message_publish/2,     [env])
```

and uncomment the following line in `unload/0` of the same file:

```elixir
hook_del(:"message.publish",      &EmqxElixirPlugin.Body.on_message_publish/2     )
```

## Step 4

Write your code inside the `on_message_publish/2` function:

```elixir
def on_message_publish(message, _env) do
    IO.inspect(["elixir on_message_publish", message])
        
    # add your elixir code here
        
    {:ok, message}
end
```

## Step 5
Compile your code (again, inside `emqx-relx`'s root):
```
$ make
```

## Step 6
Run your code
```
$ cd emqx-relx/_rel/emqx
$ bin/emqx start
$ bin/emqx_ctl plugins load emqx_elixir_plugin
```
Your elixir plugin should be working now.

