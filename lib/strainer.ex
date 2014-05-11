defmodule Strainer do
  use Application.Behaviour

  def start(_type, config) do
    Strainer.Supervisor.start_link config
  end
end
