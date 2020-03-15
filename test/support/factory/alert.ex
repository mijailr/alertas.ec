defmodule AlertasEc.Factory.Alert do
  defmacro __using__(_) do
    quote do
      def alert_factory do
        %AlertasEc.Models.Alert{
          title: Faker.Lorem.sentence(),
          description: Faker.StarWars.quote(),
          type: Faker.Lorem.word(),
          status: Faker.Lorem.word(),
          date: Faker.DateTime.backward(1)
        }
      end
    end
  end
end
