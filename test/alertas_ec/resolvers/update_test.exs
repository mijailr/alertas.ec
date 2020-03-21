defmodule AlertasEc.Resolvers.UpdateTest do
  use ExUnit.Case, async: true
  use AlertasEc.RepoCase
  use Plug.Test
  import AlertasEc.Factory
  alias AlertasEc.Server

  @opts Server.init([])

  describe "Update resolver" do
    test "list/0 return a list of updates" do
      update = insert(:update)

      query = """
        {
          updates{
            id
            title
            content
            date
            source
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
      assert conn.resp_body =~ update.source
    end

    test "find/1 should return an error when update id doesn't exist" do
      id = 1

      conn =
        :post
        |> conn("/api", update_query(id))
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.resp_body =~ "Update with id #{id} not found"
    end

    test "find/1 return an update" do
      update = insert(:update)

      conn =
        :post
        |> conn("/api", update_query(update.id))
        |> Server.call(@opts)

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ update.title
      assert conn.resp_body =~ update.content
      assert conn.resp_body =~ update.source
    end

    def update_query(id) do
      """
        {
          update(id: #{id}){
            id
            title
            content
            date
            source
          }
        }
      """
    end
  end
end
