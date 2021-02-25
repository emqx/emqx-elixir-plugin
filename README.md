# emqx_elixir_plugin

This is an EMQ X plugin template that enables you to write EMQ X plugins using Elixir.

Here is an example, supposing you are interested in using a publish-message hook:

## Step 1
Clone the `emqx-rel` project and its dependencies.
```
$ git clone https://github.com/emqx/emqx-rel.git
$ cd emqx-rel
$ make
```


## Step 2
This step will load `emqx-elixir-plugin` into the `emqx-rel` project. `emqx-elixir-plugin` is not included in the release project by default, since it is just a development template.

+ Modify `emqx-rel/rebar.config`:
  - Append `emqx_elixir_plugin` to `elixir_deps`
  - Append `{emqx_elixir_plugin, load}` to `elixir_relx_apps`:

```
{elixir_deps, [
 {emqx_elixir_plugin, {git, "https://github.com/z8674558/emqx-elixir-plugin", {branch, "master"}}}
]}.

...

{elixir_relx_apps, [
  {emqx_elixir_plugin, load}
]}.

```

+ Re-make, in order to install the new dependencies (inside `emqx-rel`'s root):
```
$ make
```

## Step 3
`emqx-relx/_build/emqx/lib/emqx_elixir_plugin` is the working directory of following steps.

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
Compile your code (again, inside `emqx-rel`'s root):
```
$ make
```

## Step 6
Run your code
```
$ cd emqx-rel/_build/emqx/rel/emqx
$ bin/emqx start
$ bin/emqx_ctl plugins load emqx_elixir_plugin
```
Your elixir plugin should be working now.

