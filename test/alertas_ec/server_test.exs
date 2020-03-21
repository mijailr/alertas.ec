defmodule AlertasEc.ServerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias AlertasEc.Server

  @opts Server.init([])

  test "Index URI" do
    conn =
      :get
      |> conn("/")
      |> Server.call(@opts)

    assert conn.state == :file
    assert conn.status == 200
    assert conn.resp_body =~ "INDEX_PLACEHOLDER"
  end
end
