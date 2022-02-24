# Example EMQX Elixir Plugin Template

An example Mix project that can be used to build an EMQX 5.0.0 plugin.

## Quickstart

1. `make` or `MIX_ENV=prod mix release --overwrite`
2. Copy `_build/prod/plugrelex/example/example-0.1.0` to the `plugins` directory in your EMQX installation.
3. ```sh
   emqx ctl plugins install example-0.1.0
   emqx ctl plugins enable example-0.1.0
   emqx ctl plugins start example-0.1.0
   ```
4. In a console in your broker (`emqx remote_console`):

   ```elixir
   :emqx.subscribe("topic")
   :emqx.publish(:emqx_message.make("topic", "payload"))
   ```

   You should see your message printed by the plugin.

   ```elixir
   emqx_msg: %{
     extra: [],
     flags: %{},
     from: :undefined,
     headers: %{},
     id: <<0, 5, 216, 140, 219, 62, 202, 170, 244, 66, 0, 0, 10, 211, 0, 0>>,
     payload: "payload",
     qos: 0,
     timestamp: 1645474368899,
     topic: "topic"
   }
   ```
