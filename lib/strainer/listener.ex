defmodule Strainer.Listener do
  use GenServer.Behaviour
  require Lager

  def start_link(host, port) do
    :gen_server.start_link({:local, :listener}, __MODULE__, [host, port], [])
  end

  def init([host, port]) do
    :gen_udp.open(port, [
      :binary,
      { :ip, host },
      { :active, true }
    ])
  end

  def handle_info({:udp, _socket, _host, _port, packet}, state) do
    Lager.info packet
    { :noreply, state }
  end
end
