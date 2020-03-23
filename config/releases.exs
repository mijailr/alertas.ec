import Config

config :alertas_ec, AlertasEc.Repo,
  url: System.get_env("DATABASE_URL"),
  migration_primary_key: [name: :id, type: :binary_id]

config :alertas_ec,
  port: String.to_integer(System.get_env("PORT"))
