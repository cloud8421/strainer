defmodule StrainerTest do
  use ExUnit.Case

  test "packet to dict" do
    packet = {[{"channel", "main"}, {"message", "some message 0"}]}
    expected = %{message: "some message 0", channel: "main"}
    assert Strainer.Decoder.packet_to_dict(packet) == expected
  end

  test "impl works" do
    expected = %{message: "some message 0", channel: "main"}
    IO.inspect JSON.encode(expected)
  end
end
