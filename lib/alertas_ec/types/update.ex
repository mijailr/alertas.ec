defmodule AlertasEc.Types.Update do
  @moduledoc """
  GraphQL schema for updates
  """

  use Absinthe.Schema.Notation

  object :update do
    field(:id, :id)
    field(:title, :string)
    field(:content, :string)
    field(:source, :string)
    field(:date, :naive_datetime)
  end
end
