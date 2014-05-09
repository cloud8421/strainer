defmodule Strainer.Decoder do
  def decode(packet) do
    { :ok, packet_content } = :msgpack.unpack(packet)
    {[{"channel", channel}, {"message", message}]} = packet_content
    { :ok, channel, message }
  end
end
