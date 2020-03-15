import Config

config :alertas_ec, AlertasEc.Repo, url: System.get_env("POSTGRES_URL")
