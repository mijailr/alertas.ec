defmodule AlertasEc.Types.Alert do
  @moduledoc """
  GraphQL schema for updates
  """

  import Ecto.Query, only: [order_by: 2]
  use Absinthe.Ecto, repo: AlertasEc.Repo
  use Absinthe.Schema.Notation

  object :alert do
    field(:id, :id)
    field(:title, :string)
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:type, :string)
    field(:status, :string)
    field(:severity, :string)

    field :updates, list_of(:update) do
      resolve(
        assoc(:updates, fn updates_query, _args, _context ->
          updates_query |> order_by(asc: :date)
        end)
      )
    end
  end
end
