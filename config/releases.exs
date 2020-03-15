import Config
config :alertas_ec, AlertasEc.Repo, url: System.get_env("DATABASE_URL")

config :alertas_ec,
  port: String.to_integer(System.get_env("PORT"))
