defmodule Strainer.Decoder do
  def packet_to_dict(packet) do
    { content } = packet
    Enum.reduce content, Map.new, fn({ key, value }, acc) ->
      Map.put(acc, binary_to_atom(key), value)
    end
  end
end
