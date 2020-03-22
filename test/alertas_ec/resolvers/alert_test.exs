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
            title
            description
            type
            status
            severity
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
      assert conn.resp_body =~ alert.description
      assert conn.resp_body =~ alert.type
      assert conn.resp_body =~ Atom.to_string(alert.status)
      assert conn.resp_body =~ Atom.to_string(alert.severity)
    end

    test "find/1 without an alert should return error" do
      id = 1

      conn =
        :post
        |> conn("/api", alert_query(id))
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.resp_body =~ "Alert with id #{id} not found"
    end

    test "find/1 return an alert" do
      alert = insert(:alert)

      conn =
        :post
        |> conn("/api", alert_query(alert.id))
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ alert.title
      assert conn.resp_body =~ alert.description
      assert conn.resp_body =~ alert.type
      assert conn.resp_body =~ Atom.to_string(alert.status)
      assert conn.resp_body =~ Atom.to_string(alert.severity)
    end
  end

  def alert_query(id) do
    """
    {
      alert(id: #{id}){
        title
        description
        type
        status
        severity
      }
    }
    """
  end
end
