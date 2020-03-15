defmodule AlertasEc.MixProject do
  use Mix.Project

  def project do
    [
      app: :alertas_ec,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {AlertasEc, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:absinthe, "~> 1.4"},
      {:absinthe_ecto, "~> 0.1"},
      {:absinthe_plug, "~> 1.4"},
      {:ecto_sql, "~> 3.2"},
      {:joken, "~> 2.2"},
      {:plug_cowboy, "~> 2.1"},
      {:postgrex, "~> 0.15"},
      {:tentacat, "~> 1.0"},

      # Test dependencies
      {:credo, "~> 1.1.5", only: [:dev, :test], runtime: false},
      {:ex_machina, "~> 2.3", only: :test},
      {:excoveralls, "~> 0.12", only: [:dev, :test]},
      {:faker, "~> 0.13", only: :test},
      {:exvcr, "~> 0.11", only: :test},

      # Docs dependencies
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end
end
