defmodule AlertasEc.Models.Alert do
  @moduledoc """
  Alert model
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias AlertasEc.Repo
  alias AlertasEc.Models.{Alert, Update}

  schema("alerts") do
    field(:title, :string)
    field(:description, :string)
    field(:date, :naive_datetime)
    field(:type, :string)
    field(:status, StatusEnum)
    field(:severity, SeverityEnum)
    has_many(:updates, Update)

    timestamps()
  end

  def list do
    from(a in Alert,
      order_by: [desc: :date]
    )
    |> Repo.all()
  end

  def find(id) do
    Alert
    |> Repo.get(id)
  end

  def create(%{} = attrs) do
    %Alert{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def changeset(%Alert{} = alert, attrs) do
    alert
    |> cast(attrs, [:title, :description, :date, :type, :status, :severity])
    |> validate_required([:title, :description, :date, :type, :status, :severity])
  end
end
