defmodule AlertasEc.Models.Update do
  @moduledoc """
  This represent an alert update
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias AlertasEc.{Repo}
  alias AlertasEc.Models.{Alert, Update}

  schema("updates") do
    field(:title, :string)
    field(:content, :string)
    field(:date, :naive_datetime)
    field(:source, :string)
    belongs_to(:alert, Alert)

    timestamps()
  end

  def list_updates do
    Update
    |> Repo.all()
  end

  def changeset(%Update{} = update, attrs) do
    update
    |> cast(attrs, [:title, :content, :date, :source, :alert_id])
    |> validate_required([:title, :content, :date, :source, :alert_id])
  end
end
