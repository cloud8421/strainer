defmodule Strainer.WsServer do
  require Lager

  def broadcast(packet) do
    { :ok, message } = JSON.encode(packet)
    broadcast ws_server, { :message, message }
  end
  defp broadcast(nil, _message), do: :wtf
  defp broadcast(pid, message) do
    send pid, message
  end

  def start_link do
    dispatch = :cowboy_router.compile([
      {:_, [
        {'/ws',        Strainer.WsHandler,     []},
        {'/:filename', Strainer.StaticHandler, []}
      ]}
    ])
    Lager.info("Starting cowboy websockets handler")
    :cowboy.start_http :ws_listener, 100, [{:port, 8002}], [{:env, [{:dispatch, dispatch}]}]
  end

  def stop(_state), do: :ok

  defp ws_server do
    Process.whereis(:ws_handler)
  end
end
