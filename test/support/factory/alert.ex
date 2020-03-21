defmodule AlertasEc.Factory.Alert do
  @moduledoc """
  Alert factory for testing
  """

  defmacro __using__(_) do
    quote do
      def alert_factory do
        %AlertasEc.Models.Alert{
          title: Faker.Lorem.sentence(),
          description: Faker.Lorem.sentence(),
          type: Faker.Lorem.word(),
          status: Faker.Lorem.word(),
          date: Faker.DateTime.backward(1),
          severity: Faker.Lorem.word()
        }
      end
    end
  end
end
