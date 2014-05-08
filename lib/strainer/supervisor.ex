defmodule Strainer.Supervisor do
  use Supervisor.Behaviour

  def start_link(config) do
    :supervisor.start_link(__MODULE__, config)
  end

  def init(config) do
    children = [
      worker(Strainer.Listener, [config.listener_host, config.listener_port])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
