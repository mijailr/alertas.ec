defmodule AlertasEc.Repo do
  use Ecto.Repo,
    otp_app: :alertas_ec,
    adapter: Ecto.Adapters.Postgres
end
