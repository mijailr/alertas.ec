defmodule AlertasEc.Resolvers.Alert do
  @moduledoc """
  Resolvers for Updates
  """
  alias AlertasEc.Models.Alert

  def list(_parent, _args, _resolution) do
    {:ok, Alert.list()}
  end

  def find(_parent, %{id: id}, _resolution) do
    case Alert.find(id) do
      nil ->
        {:error, "Alert with id #{id} not found"}

      alert ->
        {:ok, alert}
    end
  end
end
