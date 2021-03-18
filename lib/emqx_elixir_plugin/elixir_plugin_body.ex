##--------------------------------------------------------------------
## Copyright (c) 2021 EMQ Technologies Co., Ltd. All Rights Reserved.
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
  defp hook(point, cb, initarg) do
    :emqx.hook(point, cb, initarg)
  end

  defp unhook(point, cb) do
    :emqx.unhook(point, cb)
  end

  def load(env) do
    ## hook only the ones you need
    ## For more hook points see https://docs.emqx.io/en/broker/v4.2/advanced/hooks.html#hookpoint
    hook(:"message.publish",      &__MODULE__.on_message_publish/2,      [env])
  end

  def unload do
    unhook(:"message.publish",      &__MODULE__.on_message_publish/2)
  end

  def on_message_publish(msg, env) do
      do_on_message_publish(:emqx_message.to_map(msg), env)
      {:ok, msg}
  end

  defp do_on_message_publish(message = %{:payload => payload}, _env) do
    IO.inspect(["elixir on_message_publish: ", payload])
    # add your code here
    {:ok, :emqx_message.from_map(message)}
  end

end
