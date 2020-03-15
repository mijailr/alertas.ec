defmodule AlertasEc.Models.AlertTest do
  use AlertasEc.RepoCase
  import AlertasEc.Factory

  alias AlertasEc.Models.Alert

  test "A valid alert" do
    assert {:ok, %Alert{}} =
             params_for(:alert)
             |> Alert.create()
  end
end
