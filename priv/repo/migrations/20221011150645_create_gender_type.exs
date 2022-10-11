defmodule Billing.Repo.Migrations.CreateGenderType do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE gender AS ENUM ('f', 'm')"

    down_query = "DROP TYPE gender"

    execute(up_query, down_query)
  end
end
