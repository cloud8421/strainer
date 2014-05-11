defmodule MsgPack do
  def to_map(packet) when is_binary(packet) do
    { :ok, { packet_content } } = :msgpack.unpack(packet)
    Enum.reduce packet_content, Map.new, fn({ key, value }, acc) ->
      Map.put(acc, binary_to_atom(key), value)
    end
  end
end
