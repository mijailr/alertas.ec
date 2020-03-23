import Config

config :alertas_ec, AlertasEc.Repo,
  url: System.get_env("DATABASE_URL"),
  migration_primary_key: [name: :id, type: :binary_id]
