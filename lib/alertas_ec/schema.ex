defmodule AlertasEc.Schema do
  @moduledoc """
  GraphQL Schemas
  """

  use Absinthe.Schema
  import_types(AlertasEc.Types.{Update})

  alias AlertasEc.Resolvers

  query do
    # @desc "Get all alerts"
    # field :alerts, list_of(:alerts) do
    #   resolve(&Resolvers.Alert.list_alerts/3)
    # end

    @desc "Get all updates"
    field :updates, list_of(:update) do
      resolve(&Resolvers.Update.list/3)
    end

    @desc "Find update by id"
    field :update, :update do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Update.find/3)
    end
  end
end
