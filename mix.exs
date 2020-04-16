defmodule AlertasEc.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :alertas_ec,
      aliases: aliases(),
      preferred_cli_env: preferred_cli_env(),
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      releases: releases(),
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {AlertasEc, []},
      extra_applications: [:corsica, :ecto, :logger, :plug_cowboy]
    ]
  end

  def aliases do
    [
      test: ["credo", "ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp deps do
    [
      {:absinthe, "~> 1.4"},
      {:absinthe_ecto, "~> 0.1"},
      {:absinthe_plug, "~> 1.4"},
      {:corsica, "~> 1.1"},
      {:ecto_enum, "~> 1.4"},
      {:ecto_sql, "~> 3.3"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.1"},
      {:postgrex, "~> 0.15"},

      # Test dependencies
      {:credo, "~> 1.3.2", only: [:dev, :test], runtime: false},
      {:ex_machina, "~> 2.3", only: :test},
      {:excoveralls, "~> 0.12", only: [:dev, :test]},
      {:faker, "~> 0.13", only: :test},

      # Docs dependencies
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.github": :test,
      "coveralls.html": :test,
      docs: :dev
    ]
  end

  defp releases do
    [
      production: [
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent]
      ]
    ]
  end
end
