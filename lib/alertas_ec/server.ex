defmodule AlertasEc.Server do
  @moduledoc """
  Server endpoints
  """

  require Logger
  use Plug.Router
  use Plug.ErrorHandler

  plug(Corsica, origins: "*", allow_headers: :all)

  plug(Plug.Static,
    at: "/",
    from: {:alertas_ec, "priv/static"}
  )

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  forward("/api",
    to: Absinthe.Plug,
    init_opts: [schema: AlertasEc.Schema]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: AlertasEc.Schema]
  )

  get _ do
    conn
    |> put_resp_content_type("text/html")
    |> send_file(200, Path.join(:code.priv_dir(:alertas_ec), "static/index.html"))
  end
end
