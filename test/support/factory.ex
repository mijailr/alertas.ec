defmodule AlertasEc.Factory do
  @moduledoc """
  Factories for AlertasEc
  """

  use ExMachina.Ecto, repo: AlertasEc.Repo
  alias AlertasEc.Factory.{Alert, Update}

  use Alert
  use Update
end
