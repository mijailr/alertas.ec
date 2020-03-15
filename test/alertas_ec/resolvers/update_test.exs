defmodule AlertasEc.Resolvers.UpdateTest do
  use ExUnit.Case, async: true
  use AlertasEc.RepoCase
  use Plug.Test
  import AlertasEc.Factory
  alias AlertasEc.Server

  @opts Server.init([])

  describe "Update resolver" do
    test "list/0 return a list of alerts" do
      update = insert(:update)

      query = """
        {
          updates{
            id
            title
            content
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
      assert conn.resp_body =~ update.title
      assert conn.resp_body =~ update.content
    end

    test "find/1 return an update" do
      update = insert(:update)

      query = """
        {
          update(id: #{update.id}){
            id
            title
            content
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
      assert conn.resp_body =~ update.title
      assert conn.resp_body =~ update.content
    end
  end
end
