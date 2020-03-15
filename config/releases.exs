import Config

config :alertas_ec, AlertasEc.Repo, url: System.get_env("DATABASE_URL")
