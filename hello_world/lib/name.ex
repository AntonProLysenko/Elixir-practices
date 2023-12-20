defmodule HelloWorld.Name do
  def random do
    Faker.Person.first_name()
  end
end
