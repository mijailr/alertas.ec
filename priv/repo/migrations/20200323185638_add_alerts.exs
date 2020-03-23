defmodule AlertasEc.Repo.Migrations.AddAlerts do
  use Ecto.Migration

  def change do
    StatusEnum.create_type()
    SeverityEnum.create_type()
    
    create table(:alerts) do
      add(:title, :string)
      add(:description, :string)
      add(:date, :naive_datetime)
      add(:type, :string)
      add(:status, StatusEnum.type(), default: "active")
      add(:severity, SeverityEnum.type(), default: "normal")

      timestamps()
    end
  end
end
