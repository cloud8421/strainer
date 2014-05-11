defmodule MsgPackTest do
  use ExUnit.Case

  test "it converts a packet to a map" do
    packet_content = <<130, 167, 99, 104, 97, 110, 110, 101, 108, 164, 109, 97, 105, 110, 167, 109, 101, 115, 115, 97, 103, 101, 174, 115, 111, 109, 101, 32, 109, 101, 115, 115, 97, 103, 101, 32, 48>>
    assert MsgPack.to_map(packet_content) == %{channel: "main", message: "some message 0"}
  end

end
