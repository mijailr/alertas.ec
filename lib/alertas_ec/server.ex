defmodule AlertasEc.Server do
  require Logger
  use Plug.Router
  use Plug.ErrorHandler

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

  get "/" do
    send_resp(conn, 200, "Hello")
  end
end
