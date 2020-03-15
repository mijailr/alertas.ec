defmodule AlertasEc.Server do
  require Logger
  use Plug.Router
  use Plug.ErrorHandler

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello")
  end
end
