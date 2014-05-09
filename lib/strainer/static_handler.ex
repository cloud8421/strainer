defmodule Strainer.StaticHandler do
  @behaviour :cowboy_http_handler
  @moduledoc """
  This is an HTTP handler that will serve a single file to the
  client.
  """

  def init({_any, :http}, req, []) do
    { :ok, req, :undefined}
  end

  def handle(req, state) do
    {:ok, html_data} = File.read("static/index.html")
    {:ok, req} = :cowboy_req.reply 200, [{"Content-Type", "text/html"}], html_data, req
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end
end
