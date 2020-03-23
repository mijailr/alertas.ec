defmodule AlertasEc.Repo.Migrations.MoveIndex do
  use Ecto.Migration
  import Ecto.Query, only: [from: 2]

  alias AlertasEc.Repo
  alias AlertasEc.Models.{Update, Alert}

  def change do
    reindex_updates()

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
      "ALTER TABLE updates ADD CONSTRAINT updates_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES alerts(id);
"
    )
  end

  defp reindex_updates do
    AlertasEc.Models.Alert
    |> Repo.all()
    |> Enum.each(&add_uuid/1)
  end

  defp add_uuid(alert) do
    from(u in Update, where: u.alert_id == ^alert.id)
    |> Repo.update_all(set: [alert_uuid: alert.uuid])
  end
end
