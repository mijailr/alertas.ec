defmodule AlertasEc do
  @moduledoc """
  The AlertasEc application
  """

  use Application

  alias AlertasEc.{Repo, Server}

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Server,
        options: [port: Application.fetch_env!(:alertas_ec, :port)]
      ),
      supervisor(Repo, [])
    ]

    options = [
      strategy: :one_for_one,
      name: Comment.Supervisor
    ]

    start_link = Supervisor.start_link(children, options)
    Ecto.Migrator.run(Repo, "priv/repo/migrations", :up, all: true)

    start_link
  end
end
