defmodule Strainer.Listener do
  use GenServer.Behaviour
  require Lager

  def start_link(host, port) do
    :gen_server.start_link({:local, :listener}, __MODULE__, [host, port], [])
  end

  def init([host, port]) do
    :gen_udp.open(port, [
      :binary,
      { :recbuf, 16384 },
      { :ip, host },
      { :active, true }
    ])
  end

  def handle_info({:udp, _socket, _host, _port, packet}, state) do
    spawn(fn ->
      packet_map = MsgPack.to_map(packet)

      Strainer.WsServer.broadcast packet_map
      Lager.info "Received packet: #{packet_map.channel} - #{packet_map.message}"
    end)
    { :noreply, state }
  end
end
