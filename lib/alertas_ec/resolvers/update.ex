defmodule AlertasEc.Resolvers.Update do
  @moduledoc """
  Resolvers for Updates
  """
  alias AlertasEc.Models.Update

  def list_updates(_parent, _args, _resolution) do
    {:ok, Update.list_updates()}
  end
end
