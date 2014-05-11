defmodule Strainer.StaticHandler do
  @behaviour :cowboy_http_handler

  def init({_any, :http}, req, []) do
    { :ok, req, :undefined}
  end

  def handle(req, state) do
    {path, req} = :cowboy_req.path(req)
    {_slash, filename} = String.split_at(path, 1)
    extension = String.split(path, ".") |> List.last
    {:ok, body} = File.read("static/#{filename}")
    {:ok, req} = :cowboy_req.reply 200, [{"Content-Type", extension_for(extension)}], body, req
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end

  defp extension_for("js"), do: "text/javascript; charset=UTF-8"
  defp extension_for("html"), do: "text/html; charset=UTF-8"
end
