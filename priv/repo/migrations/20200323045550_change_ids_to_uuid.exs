defmodule AlertasEc.Repo.Migrations.ChangeIdsToUUID do
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pgcrypto\"",
      "DROP EXTENSION IF EXISTS \"pgcrypto\""
    )

    alter table(:alerts) do
      add(:uuid, :uuid, default: fragment("gen_random_uuid()"), null: false)
    end

    alter table(:updates) do
      add(:uuid, :uuid, default: fragment("gen_random_uuid()"), null: false)
      add(:alert_uuid, :uuid)
      remove(:id)
    end
  end
end
