defimpl JSON.Encode, for: Map do
  def to_json(map) when is_map(map) do
    Map.to_list(map) |> JSON.encode
  end
end
