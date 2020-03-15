defmodule AlertasEc.Models.Alert do
  use Ecto.Schema
  import Ecto.Changeset

  alias AlertasEc.Repo
  alias AlertasEc.Models.{Alert, Update}

  schema("alerts") do
    field(:title, :string)
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:type, :string)
    field(:status, :string)
    has_many(:updates, Update)

    timestamps()
  end

  def list do
    Alert
    |> Repo.all()
  end

  # def find(id) when is_binary(id) do
  #   id
  #   |> String.to_integer()
  #   |> find()
  # end

  def find(id) do
    Alert
    |> Repo.get(id)
  end

  def changeset(%Alert{} = alert, attrs) do
    alert
    |> cast(attrs, [:title, :description, :date, :type, :status])
    |> validate_required([:title, :description, :date, :type, :status])
  end
end
