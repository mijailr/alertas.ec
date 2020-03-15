defmodule AlertasEc.Resolvers.Update do
  @moduledoc """
  Resolvers for Updates
  """
  alias AlertasEc.Models.Update

  def list(_parent, _args, _resolution) do
    {:ok, Update.list()}
  end

  def find(_parent, %{id: id}, _resolution) do
    case Update.find(id) do
      nil ->
        {:error, "Update with id #{id} not found"}

      update ->
        {:ok, update}
    end
  end
end
