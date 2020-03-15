defmodule AlertasEc.Resolvers.AlertTest do
  use ExUnit.Case, async: true
  use AlertasEc.RepoCase
  use Plug.Test
  import AlertasEc.Factory
  alias AlertasEc.Server

  @opts Server.init([])

  describe "Alert resolver" do
    test "list/0 return a list of alerts" do
      alert = insert(:alert)

      query = """
        {
          alerts{
            id
            title
            description
            date
          }
        }
      """

      conn =
        :post
        |> conn("/api", query)
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ alert.title
    end

    test "find/1 return an alert" do
      alert = insert(:alert)

      query = """
        {
          alert(id: #{alert.id}){
            id
            title
            description
            date
          }
        }
      """

      conn =
        :post
        |> conn("/api", query)
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ alert.title
    end
  end
end
