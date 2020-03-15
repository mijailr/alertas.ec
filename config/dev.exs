import Config

config :alertas_ec, AlertasEc.Repo,
  database: "alertas_ec_dev",
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "")
