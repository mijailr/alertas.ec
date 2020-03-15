import Config

config :alertas_ec,
  port: 3000,
  ecto_repos: [AlertasEc.Repo]

import_config("#{Mix.env()}.exs")
