defmodule AlertasEc.Factory.Update do
  defmacro __using__(_) do
    quote do
      def update_factory do
        %AlertasEc.Models.Update{
          title: Faker.Lorem.sentence(),
          content: Faker.StarWars.quote(),
          date: Faker.DateTime.backward(1),
          source: Faker.Internet.url(),
          alert: build(:alert)
        }
      end
    end
  end
end
