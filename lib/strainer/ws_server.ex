defmodule Strainer.WsServer do
  require Lager

  def broadcast(message) do
    broadcast ws_server, { :message, message }
  end
  defp broadcast(nil, message), do: :wtf
  defp broadcast(pid, message) do
    send pid, message
  end

  def start_link do
    dispatch = :cowboy_router.compile([
      {:_, [
        {'/'  ,  Strainer.StaticHandler, []},
        {'/ws',  Strainer.WsHandler,     []}
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
