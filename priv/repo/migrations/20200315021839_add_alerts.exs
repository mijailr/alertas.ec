defmodule AlertasEc.Repo.Migrations.AddAlerts do
  use Ecto.Migration

  def change do
    create table(:alerts) do
      add(:title, :string)
      add(:description, :string)
      add(:date, :naive_datetime)
      add(:type, :string)
      add(:status, :string)

      timestamps()
    end
  end
end
