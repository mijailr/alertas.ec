defmodule AlertasEc.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias AlertasEc.Repo

      import Ecto
      import Ecto.Query
      import AlertasEc.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(AlertasEc.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(AlertasEc.Repo, {:shared, self()})
    end

    :ok
  end
end
