defmodule AlertasEc.Models.Update do
  @moduledoc """
  This represent an alert update
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias AlertasEc.Repo
  alias AlertasEc.Models.{Alert, Update}

  schema("updates") do
    field(:title, :string)
    field(:content, :string)
    field(:date, :naive_datetime)
    field(:source, :string)
    field(:alert_uuid, :binary)
    belongs_to(:alert, Alert)

    timestamps()
  end

  def find(id) do
    Update
    |> Repo.get(id)
  end

  def list do
    Update
    |> Repo.all()
  end

  def create(%{} = attrs) do
    %Update{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def changeset(%Update{} = update, attrs) do
    update
    |> cast(attrs, [:title, :content, :date, :source, :alert_id])
    |> validate_required([:title, :content, :date, :alert_id])
  end
end
