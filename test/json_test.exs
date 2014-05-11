defmodule JsonTest do
  use ExUnit.Case

  test "it converts a map to json" do
    sample_map = %{ channel: "main", message: "sample message"}
    assert JSON.encode(sample_map) == {:ok, "{\"channel\":\"main\",\"message\":\"sample message\"}"}
  end
end
