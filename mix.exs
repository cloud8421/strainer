defmodule Strainer.Mixfile do
  use Mix.Project

  def project do
    [app: :strainer,
     version: "0.0.1",
     elixir: "~> 0.13.1",
     elixirc_options: options(Mix.env),
     deps: deps]
  end

  def application do
    [ applications: [:lager, :cowboy],
      mod: {Strainer, config} ]
  end

  defp deps do
    [{:exlager, github: "khia/exlager"},
     {:cowboy, github: "extend/cowboy"},
     {:json, github: "cblage/elixir-json"},
     {:msgpack, github: "msgpack/msgpack-erlang"}]
  end

  defp config do
    %{ listener_host: {10,2,20,57}, listener_port: 9001 }
  end

  defp options(env) when env == :test do
    [exlager_level: :alert]
  end

  defp options(env) when env == :dev do
    [exlager_level: :debug]
  end
end
