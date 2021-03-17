# emqx_elixir_plugin

This is an EMQ X plugin template that enables you to write EMQ X plugins using Elixir.

Here is an example, supposing you are interested in using a publish-message hook:

## Step 1: Add `emqx_elixir_plugin` as emqx's dependency

Clone [emqx/emqx.git](https://github.com/emqx/emqx), and
follow the [instructions](https://github.com/emqx/emqx/blob/master/lib-extra/README.md)
to add the plugin repo as an extra dependency in the `elixir_plugins` group.

## Step 2: Instruct the build scripts to include `emqx_elixir_plugin` in the build

Set `EMQX_EXTRA_PLUGINS` environment variable to include this plugin in the build, e.g. in bash:
`export EMQX_EXTRA_PLUGINS='emqx_elixir_plugin'`

## Step 3: Build a release

```
$ make
```

If all goes as expected, there should be two directories in the release:

```
_build/emqx/rel/emqx/lib/elixir-<..elixir-vsn..>/
_build/emqx/rel/emqx/lib/emqx_elixir_plugin-<..plugin-vsn..>/
```

## Step 4: Run your code

### Start the node

```
./_build/emqx/rel/emqx/bin/emqx console
```

### Load the plugin

Start another shell console and execute

```
./_build/emqx/rel/emqx/bin/emqx_ctl plugins load emqx_elixir_plugin
```

### Send a message to test

The demo code by default has the `on_message_publish` callback registered as a hook.
And the callback is implemented to print out the payload.

Send a message from any MQTT client.

```
mosquitto_pub -h localhost -t 'a/b/c' -m 'Hello Elixir'
```

The EMQ X node console should print out:

```
["elixir on_message_publish: ", "Hello Elixir"]
```

## Caveats

* Elixir as Erlang dependency is not quite nicely supported as incremental builds,
  meaning you will not be able to edit the code in emqx.git project's sub directory and get the changes rebuilt.

* To have the plugin enabled/loaded by default, you can include it in this template
  `data/loaded_plugins.tmpl` in emqx.git project.
