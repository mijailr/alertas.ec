defmodule AlertasEc.Repo.Migrations.AddSeverityToAlerts do
  use Ecto.Migration

  def change do
    alter table("alerts") do
      add(:severity, :string, default: "normal")
    end
  end
end
