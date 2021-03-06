defmodule AlertasEc.Models.UpdateTest do
  use AlertasEc.RepoCase
  import AlertasEc.Factory

  alias AlertasEc.Models.Update

  test "A valid alert" do
    assert {:ok, %Update{}} =
             params_with_assocs(:update)
             |> Update.create()
  end
end
