defmodule AlertasEc.Repo.Migrations.UseEnums do
  use Ecto.Migration

  def change do
    StatusEnum.create_type()
    SeverityEnum.create_type()

    alter table(:alerts) do
      remove(:status)
      remove(:severity)
      add(:status, StatusEnum.type(), default: "active")
      add(:severity, SeverityEnum.type(), default: "normal")
    end
  end
end
