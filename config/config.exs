import Config

config :alertas_ec,
  port: 3000,
  ecto_repos: [AlertasEc.Repo]

config :alertas_ec,
       AlertasEc.Repo,
       migration_primary_key: [name: :id, type: :binary_id]

import_config("#{Mix.env()}.exs")
