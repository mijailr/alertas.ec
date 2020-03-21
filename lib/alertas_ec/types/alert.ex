defmodule AlertasEc.Types.Alert do
  @moduledoc """
  GraphQL schema for updates
  """

  use Absinthe.Schema.Notation

  object :alert do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:type, :string)
    field(:status, :string)
    field(:severity, :string)
    field(:updates, non_null(list_of(:update)))
  end
end
