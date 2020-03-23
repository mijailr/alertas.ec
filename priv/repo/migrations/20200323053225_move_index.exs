defmodule AlertasEc.Repo.Migrations.MoveIndex do
  use Ecto.Migration
  alias AlertasEc.Repo

  def change do
    alter table(:updates) do
      remove(:alert_id)
    end

    alter table(:alerts) do
      remove(:id)
    end

    rename(table(:alerts), :uuid, to: :id)
    rename(table(:updates), :uuid, to: :id)
    rename(table(:updates), :alert_uuid, to: :alert_id)

    execute("ALTER TABLE alerts ADD PRIMARY KEY (id);")
    execute("ALTER TABLE updates ADD PRIMARY KEY (id);")

    execute(
      "ALTER TABLE updates ADD CONSTRAINT updates_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES alerts(id);"
    )
  end
end
