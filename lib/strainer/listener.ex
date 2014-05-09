defmodule Strainer.Listener do
  use GenServer.Behaviour
  alias Strainer.Decoder
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
      { :ok, packet_content } = :msgpack.unpack(packet)

      packet_map = Decoder.packet_to_dict(packet_content)
      Strainer.WsServer.broadcast packet_map

      Lager.info "#{packet_map.channel}: #{packet_map.message}"
    end)
    { :noreply, state }
  end
end
