defmodule AlertasEc.Repo.Migrations.AddUpdates do
  use Ecto.Migration

  def change do
    create table(:updates) do
      add(:title, :string)
      add(:content, :string)
      add(:date, :naive_datetime)
      add(:source, :string)

      add(:alert_id, references(:alerts))
      timestamps()
    end
  end
end
