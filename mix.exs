defmodule Strainer.Mixfile do
  use Mix.Project

  def project do
    [app: :strainer,
     version: "0.0.1",
     elixir: "~> 0.13.1",
     deps: deps]
  end

  def application do
    [ applications: [],
      mod: {Strainer, config} ]
  end

  defp deps do
    []
  end

  defp config do
    %{ listener_host: {127,0,0,1}, listener_port: 9001 }
  end
end
