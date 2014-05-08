defmodule Strainer do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, config) do
    Strainer.Supervisor.start_link config
  end
end
